import 'package:flutter/material.dart';

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
