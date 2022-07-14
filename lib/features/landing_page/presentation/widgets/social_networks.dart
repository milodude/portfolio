import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/features/landing_page/presentation/widgets/social_icon.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/constants/constants.dart';

class SocialNetworks extends StatelessWidget {
  const SocialNetworks({
    Key? key,
    required this.heigth,
    required this.width,
  }) : super(key: key);

  final double heigth;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      top: heigth * 0.9,
      child: SizedBox(
        height: heigth * 0.1,
        width: width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SocialIcon(onTapAction: _linkedin, icon: FontAwesomeIcons.linkedin),
            const SizedBox(
              width: 20,
            ),
            SocialIcon(onTapAction: _github, icon: FontAwesomeIcons.github),
            const SizedBox(
              width: 20,
            ),
            SocialIcon(onTapAction: _twitter, icon: FontAwesomeIcons.twitter),
          ],
        ),
      ),
    );
  }

  _linkedin() async {
    Uri url = Uri.https(
      'www.linkedin.com',
      '/in/roquematiasraverta',
    ); // or add your URL here
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }

  _github() async {
    Uri url = Uri.https(
      'www.github.com',
      '/milodude',
    ); // or add your URL here
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }

  _twitter() async {
    Uri url = Uri.https(
      'https://twitter.com',
      '/MatiasAK',
    ); // or add your URL here
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }
}
