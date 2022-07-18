import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:simple_animations/stateless_animation/play_animation.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/constants/texts.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({
    Key? key,
    required this.width,
    required this.heigth,
  }) : super(key: key);

  final double width;
  final double heigth;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showDialog(
          context: context, builder: (context) => buildAboutMe(context)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PlayAnimation<double>(
            tween: Tween(begin: 0.0, end: 1.0),
            duration: const Duration(seconds: 2),
            builder: (context, child, value) {
              return Opacity(
                opacity: value,
                child: Text(
                  'About Me',
                  style: TextStyle(
                    fontSize: width > 541 ? 54 : 34,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            },
          ),
          const SizedBox(
            width: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 55.0),
            child: SizedBox(
              width: width > 541 ? 100 : 55,
              height: width > 541 ? 100 : 55,
              child: Lottie.network(
                  'https://assets2.lottiefiles.com/packages/lf20_9unpvaft.json'),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildAboutMe(BuildContext context) {
    return Dialog(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: SizedBox(
                width: 200,
                height: 200,
                child: CircleAvatar(
                  backgroundImage: AssetImage(aboutMeImagePath),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: SizedBox(
                width: 400,
                child: Text(
                  aboutMeText,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: (() => Navigator.of(context).pop()),
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(120, 50),
                    primary: Theme.of(context).textTheme.bodySmall?.color),
                child: const Text(buttonDismiss),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
