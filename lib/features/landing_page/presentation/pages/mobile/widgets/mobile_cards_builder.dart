import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio/features/landing_page/domain/entities/job_data.dart';
import 'package:portfolio/features/landing_page/presentation/widgets/modal_animation_helper.dart';
import 'package:portfolio/l10n/app_localizations.dart';

import '../../../../../../core/data/experience_data.dart';
import '../../../widgets/elliptical_carousel.dart';

class MobileCardsBuilder extends StatefulWidget {
  const MobileCardsBuilder({Key? key}) : super(key: key);

  @override
  State<MobileCardsBuilder> createState() => _MobileCardsBuilderState();
}

class _MobileCardsBuilderState extends State<MobileCardsBuilder> {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final List<JobData> data = getExperienceData(l10n);

    if (data.isEmpty) return const SizedBox.shrink();

    return EllipticalCarousel(
      items: data.map((item) => MobileExperienceCard(data: item)).toList(),
      onIndexChanged: (index) {},
    );
  }
}

class MobileExperienceCard extends StatefulWidget {
  final JobData data;
  const MobileExperienceCard({Key? key, required this.data}) : super(key: key);

  @override
  State<MobileExperienceCard> createState() => _MobileExperienceCardState();
}

class _MobileExperienceCardState extends State<MobileExperienceCard>
    with TickerProviderStateMixin {
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
    final width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: _showDetails,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
        width: width * 0.85,
        height: 450,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: ClipRRect(
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
                            const Color(0xFF8121D0).withValues(alpha: 0.05),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
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
                                size: 28,
                                color: Colors.white,
                              ),
                              const SizedBox(width: 15),
                              Flexible(
                                child: Text(
                                  widget.data.company,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 20,
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
                              color: Colors.white.withValues(alpha: 0.8),
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
      ),
    );
  }

  Widget _buildCompactContent() {
    final l10n = AppLocalizations.of(context)!;
    return Column(
      children: [
        const SizedBox(height: 25),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: ScaleTransition(
            scale: pulseAnimation,
            child: Container(
              key: _buttonKey,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.white.withValues(alpha: 0.3)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.touch_app_outlined,
                      color: Colors.white, size: 18),
                  const SizedBox(width: 8),
                  Text(
                    l10n.details,
                    style: const TextStyle(
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
    final l10n = AppLocalizations.of(context)!;
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
            l10n.techStack,
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
