import 'package:flutter/material.dart';
import 'package:portfolio/features/landing_page/presentation/pages/mobile/build_experience_snap_cards.dart';

import '../../widgets/about_me.dart';

class ExperienceMobile extends StatelessWidget {
  const ExperienceMobile({
    Key? key,
    required this.heigth,
    required this.width,
  }) : super(key: key);

  final double heigth;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      height: heigth * 0.8,
      width: width,
      top: heigth * 0.2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: heigth * 0.50,
            width: width * 0.9,
            child: const BuildExperienceSnapCards(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AboutMe(
                width: width,
                heigth: heigth,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
