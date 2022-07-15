import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:simple_animations/stateless_animation/play_animation.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //Crear Modal
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PlayAnimation<double>(
            tween: Tween(begin: 0.0, end: 1.0),
            duration: const Duration(seconds: 2),
            builder: (context, child, value) {
              return Opacity(
                opacity: value,
                child: const Text(
                  'About Me',
                  style: TextStyle(
                    fontSize: 54,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            },
          ),
          const SizedBox(
            width: 20,
          ),
          SizedBox(
            width: 100,
            height: 100,
            child: Lottie.network(
                'https://assets2.lottiefiles.com/packages/lf20_9unpvaft.json'),
          ),
        ],
      ),
    );
  }
}
