import 'package:flutter/material.dart';
import 'package:portfolio/features/landing_page/presentation/pages/mobile/widgets/mobile_experience.dart';
import 'package:portfolio/features/landing_page/presentation/pages/mobile/widgets/mobile_photograph.dart';
import 'package:portfolio/features/landing_page/presentation/widgets/social_networks.dart';

class MobilePage extends StatelessWidget {
  const MobilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final heigth = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          MobileExperience(width: width, heigth: heigth),
          MobilePhotoGraph(heigth: heigth, width: width),
          SocialNetworks(heigth: heigth, width: width),
        ],
      ),
    );
  }
}
