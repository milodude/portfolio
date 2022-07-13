import 'package:flutter/material.dart';
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
            InkWell(
              hoverColor: Colors.transparent,
              child: Image.network(
                linkedInImage,
                width: 50,
                height: 50,
              ),
              onTap: () => _linkedin(),
            )
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
}
