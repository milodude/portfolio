import 'package:flutter/material.dart';

import '../../../../../core/constants/constants.dart';

class MobileAvatar extends StatelessWidget {
  const MobileAvatar({
    Key? key,
    required this.width,
    required this.heigth,
  }) : super(key: key);

  final double width;
  final double heigth;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: width * 0.4,
      top: heigth * 0.12,
      child: const SizedBox(
        height: 100,
        width: 100,
        child: CircleAvatar(
          backgroundImage: AssetImage(profilePath),
        ),
      ),
    );
  }
}
