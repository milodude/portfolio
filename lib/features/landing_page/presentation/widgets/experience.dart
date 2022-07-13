import 'package:flutter/material.dart';

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
