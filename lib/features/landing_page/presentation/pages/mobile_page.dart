import 'package:flutter/material.dart';
import 'package:portfolio/features/landing_page/presentation/widgets/social_networks.dart';

import 'mobile/avatar_mobile.dart';
import 'mobile/experience_mobile.dart';
import 'mobile/top_mobile.dart';

class MobilePage extends StatelessWidget {
  const MobilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final heigth = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          TopMobile(heigth: heigth, width: width),
          MobileAvatar(width: width, heigth: heigth),
          ExperienceMobile(heigth: heigth, width: width),
          SocialNetworks(heigth: heigth, width: width),
        ],
      ),
    );
  }
}
