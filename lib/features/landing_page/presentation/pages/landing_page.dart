import 'package:flutter/material.dart';

import '../widgets/social_networks.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final heigth = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Experience(width: width, heigth: heigth),
          PhotoGraph(heigth: heigth, width: width),
          SocialNetworks(heigth: heigth, width: width),
        ],
      ),
    );
  }
}

class PhotoGraph extends StatelessWidget {
  const PhotoGraph({
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
      child: SizedBox(
        height: heigth,
        width: width * 0.5,
        child: Image.asset(
          'images/profile1.jpeg',
          scale: 0.3,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

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
    return Positioned(
      left: width * 0.5,
      child: SizedBox(
        height: heigth,
        width: width * 0.5,
        child: const Placeholder(),
      ),
    );
  }
}
