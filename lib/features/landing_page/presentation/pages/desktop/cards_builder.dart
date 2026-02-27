import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio/features/landing_page/domain/entities/job_data.dart';
import 'package:portfolio/features/landing_page/presentation/widgets/modal_animation_helper.dart';

import '../../../../../core/data/experience_data.dart';
import '../../widgets/elliptical_carousel.dart';

class Cardsbuilder extends StatefulWidget {
  const Cardsbuilder({Key? key}) : super(key: key);

  @override
  State<Cardsbuilder> createState() => _CardsbuilderState();
}

class _CardsbuilderState extends State<Cardsbuilder> {
  final List<JobData> experience = getExperienceData();

  @override
  Widget build(BuildContext context) {
    if (experience.isEmpty) return const SizedBox.shrink();

    return EllipticalCarousel(
      items: experience.map((data) => ExperienceCard(data: data)).toList(),
      onIndexChanged: (index) {
        // Optional: Trigger any side effects when the focused card changes
      },
    );
  }
}

class ExperienceCard extends StatefulWidget {
  final JobData data;
  const ExperienceCard({Key? key, required this.data}) : super(key: key);

  @override
  State<ExperienceCard> createState() => _ExperienceCardState();
}

class _ExperienceCardState extends State<ExperienceCard>
    with TickerProviderStateMixin {
  bool _isHovered = false;
  final GlobalKey _buttonKey = GlobalKey();

  late AnimationController pulseController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1500),
  )..repeat(reverse: true);

  late Animation<double> pulseAnimation =
      Tween<double>(begin: 1.0, end: 1.1).animate(
    CurvedAnimation(parent: pulseController, curve: Curves.easeInOut),
  );

  @override
  void dispose() {
    pulseController.dispose();
    super.dispose();
  }

  void _showDetails() {
    showCardDetailModal(
      context: context,
      buttonKey: _buttonKey,
      content: _buildDetailContent(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: _showDetails,
        child: AnimatedScale(
          scale: _isHovered ? 1.02 : 1.0,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeOutCubic,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.fastOutSlowIn,
            width: 550, // Slightly narrower for carousel fit
            height: 380,
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Stack(
              children: [
                if (_isHovered)
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        boxShadow: [
                          BoxShadow(
                            color:
                                const Color(0xFF8121D0) // Vibrant Purple Glow
                                    .withValues(alpha: 0.3),
                            blurRadius: 40,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                    ),
                  ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.08),
                        borderRadius: BorderRadius.circular(40),
                        border: Border.all(
                          color: Colors.white.withValues(alpha: 0.25),
                          width: 2,
                        ),
                      ),
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Colors.white.withValues(alpha: 0.2),
                                    const Color(0xFF8121D0)
                                        .withValues(alpha: 0.05),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 40,
                              vertical: 25,
                            ),
                            child: SingleChildScrollView(
                              clipBehavior: Clip.none,
                              physics: const NeverScrollableScrollPhysics(),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.workspace_premium_outlined,
                                        size: 38,
                                        color: Colors.white,
                                      ),
                                      const SizedBox(width: 15),
                                      Flexible(
                                        child: Text(
                                          widget.data.company,
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            fontSize: 26,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            letterSpacing: 1.2,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    '${widget.data.startDate} — ${widget.data.endDate}',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color:
                                          Colors.white.withValues(alpha: 0.8),
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 3,
                                    ),
                                  ),
                                  _buildCompactContent(),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCompactContent() {
    return Column(
      children: [
        const SizedBox(height: 25),
        Padding(
          padding: const EdgeInsets.symmetric(
              vertical: 20, horizontal: 20), // Layout buffer for pulse
          child: ScaleTransition(
            scale: pulseAnimation,
            child: Container(
              key: _buttonKey,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.white.withValues(alpha: 0.3)),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.touch_app_outlined, color: Colors.white, size: 18),
                  SizedBox(width: 8),
                  Text(
                    'DETALLES',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 10,
                      letterSpacing: 2,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 30),
      ],
    );
  }

  Widget _buildDetailContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(40),
      child: Column(
        children: [
          const SizedBox(height: 20),
          const Icon(
            Icons.star_rounded,
            size: 48,
            color: Colors.white,
          ),
          const SizedBox(height: 15),
          Text(
            widget.data.company,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            '${widget.data.startDate} — ${widget.data.endDate}',
            style: TextStyle(
              fontSize: 14,
              color: Colors.white.withValues(alpha: 0.6),
              fontWeight: FontWeight.w500,
              letterSpacing: 3,
            ),
          ),
          const SizedBox(height: 25),
          const SizedBox(
            width: 80,
            child: Divider(color: Colors.white30, thickness: 2.5),
          ),
          const SizedBox(height: 35),
          Text(
            widget.data.description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white,
              height: 1.6,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 45),
          Text(
            'TECH STACK',
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.6),
              fontSize: 12,
              fontWeight: FontWeight.w900,
              letterSpacing: 4,
            ),
          ),
          const SizedBox(height: 20),
          Wrap(
            alignment: WrapAlignment.center,
            runSpacing: 12,
            spacing: 12,
            children: widget.data.techs.map((tech) {
              return Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.15),
                  ),
                ),
                child: Text(
                  tech,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
