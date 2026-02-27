import 'dart:ui';

import 'package:flutter/material.dart';

Future<void> showCardDetailModal({
  required BuildContext context,
  required GlobalKey buttonKey,
  required Widget content,
  bool useBlur = true,
}) async {
  final overlay = Overlay.of(context);
  late OverlayEntry entry;

  entry = OverlayEntry(
    builder: (context) => _CardDetailModal(
      buttonKey: buttonKey,
      content: content,
      useBlur: useBlur,
      onClose: () {
        entry.remove();
      },
    ),
  );

  overlay.insert(entry);
}

class _CardDetailModal extends StatefulWidget {
  final GlobalKey buttonKey;
  final Widget content;
  final bool useBlur;
  final VoidCallback onClose;

  const _CardDetailModal({
    required this.buttonKey,
    required this.content,
    required this.useBlur,
    required this.onClose,
  });

  @override
  State<_CardDetailModal> createState() => _CardDetailModalState();
}

class _CardDetailModalState extends State<_CardDetailModal>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  Rect? _buttonRect;
  Size? _screenSize;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _calculatePositions();
      _controller.forward();
    });
  }

  void _calculatePositions() {
    final renderBox =
        widget.buttonKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox != null) {
      final position = renderBox.localToGlobal(Offset.zero);
      setState(() {
        _buttonRect = position & renderBox.size;
        _screenSize = MediaQuery.of(context).size;
      });
    }
  }

  Future<void> _handleClose() async {
    await _controller.reverse();
    widget.onClose();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_buttonRect == null || _screenSize == null)
      return const SizedBox.shrink();

    final modalWidth = (_screenSize!.width * 0.8).clamp(300.0, 600.0);
    final modalHeight = (_screenSize!.height * 0.7).clamp(400.0, 800.0);
    final modalRect = Rect.fromCenter(
      center: Offset(_screenSize!.width / 2, _screenSize!.height / 2),
      width: modalWidth,
      height: modalHeight,
    );

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          // Semi-transparent background with tap to close
          GestureDetector(
            onTap: _handleClose,
            child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Container(
                  color: Colors.black.withOpacity(_animation.value * 0.5),
                  child: widget.useBlur
                      ? BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: _animation.value * 5,
                            sigmaY: _animation.value * 5,
                          ),
                          child: Container(color: Colors.transparent),
                        )
                      : null,
                );
              },
            ),
          ),

          // Lines Connecting Vertices
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              if (_animation.value == 0) {
                return const SizedBox.shrink();
              }
              return CustomPaint(
                painter: _CornerLinesPainter(
                  fromRect: _buttonRect!,
                  toRect: modalRect,
                  progress: _animation.value,
                ),
                child: Container(),
              );
            },
          ),

          // Expanding Modal
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              final currentRect =
                  Rect.lerp(_buttonRect, modalRect, _animation.value)!;
              return Positioned.fromRect(
                rect: currentRect,
                child: Opacity(
                  opacity: (_animation.value * 2).clamp(0.0, 1.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF1A1A1A), // Modern surface color
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color:
                              Colors.black.withOpacity(0.3 * _animation.value),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                      border: Border.all(
                        color: Colors.white.withOpacity(0.1),
                        width: 1,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: Stack(
                        children: [
                          _animation.value > 0.8
                              ? widget.content
                              : const SizedBox.shrink(),
                          Positioned(
                            top: 10,
                            right: 10,
                            child: IconButton(
                              icon: const Icon(Icons.close,
                                  color: Colors.white70),
                              onPressed: _handleClose,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _CornerLinesPainter extends CustomPainter {
  final Rect fromRect;
  final Rect toRect;
  final double progress;

  _CornerLinesPainter({
    required this.fromRect,
    required this.toRect,
    required this.progress,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Opacity logic: starts at 0, goes to 0.4 quickly, and stays there or fades slightly
    final opacity = (progress * 0.4).clamp(0.0, 0.4);

    final paint = Paint()
      ..color = Colors.white.withOpacity(opacity)
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    final cornersFrom = [
      fromRect.topLeft,
      fromRect.topRight,
      fromRect.bottomLeft,
      fromRect.bottomRight,
    ];

    final cornersTo = [
      toRect.topLeft,
      toRect.topRight,
      toRect.bottomLeft,
      toRect.bottomRight,
    ];

    for (int i = 0; i < 4; i++) {
      final start = cornersFrom[i];
      final end = cornersTo[i];

      // Calculate current line end based on progress
      final currentEnd = Offset.lerp(start, end, progress)!;

      canvas.drawLine(start, currentEnd, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _CornerLinesPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
