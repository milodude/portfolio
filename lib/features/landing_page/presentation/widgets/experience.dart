import 'package:flutter/material.dart';
import 'package:portfolio/features/landing_page/presentation/widgets/about_me.dart';
import 'package:portfolio/features/landing_page/presentation/widgets/cards_builder.dart';

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
        child: Container(
          color: const Color.fromARGB(255, 132, 186, 211),
          child: Column(
            children: [
              const Text(
                'Roque Matías Raverta',
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Ingeniero en Sistemas de Informacion',
                style: TextStyle(fontSize: 30),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(height: heigth * 0.45, child: Cardsbuilder()),
              const SizedBox(
                height: 30,
              ),
              const AboutMe(),
            ],
          ),
        ),
      ),
    );
  }
}
