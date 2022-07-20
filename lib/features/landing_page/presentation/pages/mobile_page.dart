import 'package:flutter/material.dart';
import 'package:portfolio/features/landing_page/presentation/widgets/about_me.dart';
import 'package:portfolio/features/landing_page/presentation/widgets/social_networks.dart';

import '../../../../core/constants/constants.dart';
import '../widgets/experience.dart';

class MobilePage extends StatelessWidget {
  const MobilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final heigth = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 0,
            child: SizedBox(
              height: heigth * 0.2,
              width: width,
              child: Container(
                color: Theme.of(context).textTheme.bodySmall?.color,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(bottom: 50.0),
                      child: Text(
                        'Roque Matias Raverta',
                        style: TextStyle(fontSize: 24),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: width * 0.4,
            top: heigth * 0.12,
            child: const SizedBox(
              height: 100,
              width: 100,
              child: CircleAvatar(
                backgroundImage: AssetImage(aboutMeImagePath),
              ),
            ),
          ),
          Positioned(
              height: heigth * 0.8,
              width: width,
              top: heigth * 0.2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: heigth * 0.47,
                    width: width * 0.9,
                    child: Container(color: Colors.amberAccent),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AboutMe(width: width, heigth: heigth),
                    ],
                  )
                ],
              )),
          SocialNetworks(heigth: heigth, width: width),
        ],
      ),
    );
  }
}
