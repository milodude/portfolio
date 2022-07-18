import 'package:flutter/material.dart';

import '../widgets/experience.dart';
import '../widgets/photograph.dart';
import '../widgets/social_networks.dart';

class DesktopPage extends StatelessWidget {
  const DesktopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final heigth = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: AnimatedContainer(
        height: heigth,
        duration: const Duration(milliseconds: 200),
        child: Stack(
          children: [
            Experience(width: width, heigth: heigth),
            PhotoGraph(heigth: heigth, width: width),
            SocialNetworks(heigth: heigth, width: width),
          ],
        ),
      ),
    );
  }
}
