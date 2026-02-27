import 'package:flutter/material.dart';
import 'package:portfolio/features/landing_page/presentation/widgets/about_me.dart';
import 'package:portfolio/features/landing_page/presentation/widgets/language_switcher.dart';
import 'package:portfolio/l10n/app_localizations.dart';

import 'mobile_cards_builder.dart';

class MobileExperience extends StatelessWidget {
  const MobileExperience({
    Key? key,
    required this.width,
    required this.heigth,
  }) : super(key: key);

  final double width;
  final double heigth;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    const deepBlue = Color(0xFF1A1A40);
    const deepPurple = Color(0xFF432371);

    return Positioned(
      left: 0,
      child: SizedBox(
        height: heigth,
        width: width,
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                deepBlue,
                deepPurple,
              ],
            ),
          ),
          child: Column(
            children: [
              const SizedBox(height: 40),
              const LanguageSwitcher(),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Text(
                      l10n.name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 2,
                        shadows: [
                          Shadow(
                            color: Colors.black26,
                            blurRadius: 10,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      l10n.title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white.withValues(alpha: 0.9),
                        letterSpacing: 2,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),

              // Scrollable/Flexible Content Area
              const Expanded(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: MobileCardsBuilder(),
                  ),
                ),
              ),

              // Sticky Footer
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: AboutMe(
                  heigth: heigth,
                  width: width,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
