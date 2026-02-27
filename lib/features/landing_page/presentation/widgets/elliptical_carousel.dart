import 'dart:math';

import 'package:flutter/material.dart';

class EllipticalCarousel extends StatefulWidget {
  final List<Widget> items;
  final int initialIndex;
  final ValueChanged<int>? onIndexChanged;

  const EllipticalCarousel({
    Key? key,
    required this.items,
    this.initialIndex = 0,
    this.onIndexChanged,
  }) : super(key: key);

  @override
  State<EllipticalCarousel> createState() => _EllipticalCarouselState();
}

class _EllipticalCarouselState extends State<EllipticalCarousel>
    with SingleTickerProviderStateMixin {
  late AnimationController _snapController;
  late double _currentRotation; // Total rotation in radians
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    // Each item is spaced by 2*pi / N
    _currentRotation = _currentIndex * (2 * pi / widget.items.length);

    _snapController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
  }

  @override
  void dispose() {
    _snapController.dispose();
    super.dispose();
  }

  void _handlePanUpdate(DragUpdateDetails details) {
    setState(() {
      // Adjust sensitivity: 1 pixel drag = small fraction of rotation
      // Width of 500px roughly equals 2*pi rotation
      _currentRotation -= details.delta.dx * 0.01;
    });
  }

  void _handlePanEnd(DragEndDetails details) {
    final double itemSpacing = 2 * pi / widget.items.length;
    final int nearestIndex = (_currentRotation / itemSpacing).round();
    final double targetRotation = nearestIndex * itemSpacing;

    final Animation<double> animation = Tween<double>(
      begin: _currentRotation,
      end: targetRotation,
    ).animate(CurvedAnimation(
      parent: _snapController,
      curve: Curves.easeOutCubic,
    ));

    animation.addListener(() {
      setState(() {
        _currentRotation = animation.value;
      });
    });

    _snapController.forward(from: 0).then((_) {
      // Normalize index for loop support
      final int normalizedIndex =
          (nearestIndex % widget.items.length + widget.items.length) %
              widget.items.length;
      if (normalizedIndex != _currentIndex) {
        _currentIndex = normalizedIndex;
        widget.onIndexChanged?.call(_currentIndex);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double width = constraints.maxWidth;
        final double height = constraints.maxHeight;

        // Define ellipse radii
        final double rx = width * 0.45; // More horizontal spread
        const double ry = 60.0; // More vertical offset for depth effect

        List<_CarouselItemData> positionedItems = [];

        for (int i = 0; i < widget.items.length; i++) {
          // Angle for each specific item
          final double angle =
              _currentRotation - (i * 2 * pi / widget.items.length);

          // Basic sin/cos for ellipse
          final double x = sin(angle) * rx;
          final double depth = cos(angle); // 1.0 (front) to -1.0 (back)

          // Visual properties based on depth
          // Map depth [-1, 1] to specific ranges
          final double scale = 0.4 + (0.6 * (depth + 1) / 2); // 0.4 to 1.0
          final double opacity = 0.1 +
              (0.9 * pow((depth + 1) / 2, 1.5))
                  .clamp(0.0, 1.0); // Sharper curve

          // Optional: rotation in Y for 3D feel
          // Items on the sides rotate more
          final double rotY = -sin(angle) * 0.3;

          positionedItems.add(_CarouselItemData(
            index: i,
            child: widget.items[i],
            x: x,
            y: depth * ry, // Subtle vertical movement
            scale: scale,
            opacity: opacity,
            depth: depth,
            rotY: rotY,
          ));
        }

        // Sort items by depth so back items are drawn first (lower z-index)
        positionedItems.sort((a, b) => a.depth.compareTo(b.depth));

        return GestureDetector(
          onPanUpdate: _handlePanUpdate,
          onPanEnd: _handlePanEnd,
          behavior: HitTestBehavior.opaque,
          child: Container(
            width: width,
            height: height,
            color: Colors.transparent,
            child: Stack(
              clipBehavior: Clip.none,
              children: positionedItems.map((item) {
                return Positioned(
                  left: width / 2 +
                      item.x -
                      (width * 0.5), // Center and apply offset
                  top: height / 2 + item.y - (height * 0.5),
                  child: SizedBox(
                    width: width,
                    height: height,
                    child: Center(
                      child: Opacity(
                        opacity: item.opacity,
                        child: Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.identity()
                            ..setEntry(3, 2, 0.001) // perspective
                            ..rotateY(item.rotY)
                            ..scaleByDouble(item.scale, item.scale, 1.0, 1.0),
                          child: item.child,
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}

class _CarouselItemData {
  final int index;
  final Widget child;
  final double x;
  final double y;
  final double scale;
  final double opacity;
  final double depth;
  final double rotY;

  _CarouselItemData({
    required this.index,
    required this.child,
    required this.x,
    required this.y,
    required this.scale,
    required this.opacity,
    required this.depth,
    required this.rotY,
  });
}
