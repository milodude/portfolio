import 'package:flutter/material.dart';
import '../../../../core/constants/widgets_keys.dart';

class SocialIcon extends StatelessWidget {
  const SocialIcon({Key? key, required this.onTapAction, required this.icon})
      : super(key: key);

  final IconData icon;
  final Function onTapAction;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: const Key(socialIcon),
      onTap: () {
        onTapAction();
      },
      child: Icon(
        icon,
        color: Colors.blueGrey,
        size: 60,
      ),
    );
  }
}
