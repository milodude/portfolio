import 'package:flutter/material.dart';
import 'package:portfolio/features/landing_page/presentation/pages/desktop/cards_builder.dart';
import 'package:portfolio/features/landing_page/presentation/widgets/about_me.dart';

class Experience extends StatelessWidget {
  const Experience({
    Key? key,
    required this.width,
    required this.heigth,
  }) : super(key: key);

  final double width;
  final double heigth;

  @override
  Widget build(BuildContext context) {
    const deepBlue = Color(0xFF1A1A40);
    const deepPurple = Color(0xFF432371);

    return Positioned(
      left: width * 0.5,
      child: SizedBox(
        height: heigth,
        width: width * 0.5,
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
              // Sticky Header
              const SizedBox(height: 60),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Text(
                      width > 912 ? 'Roque Matías Raverta' : 'Roque Raverta',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 50,
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
                      'Senior Software Engineer',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white.withValues(alpha: 0.9),
                        letterSpacing: 4,
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
                    child: Cardsbuilder(),
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
