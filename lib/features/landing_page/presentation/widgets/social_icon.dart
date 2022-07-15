import 'package:flutter/material.dart';
import '../../../../core/constants/widgets_keys.dart';

class SocialIcon extends StatefulWidget {
  const SocialIcon({Key? key, required this.onTapAction, required this.icon})
      : super(key: key);

  final IconData icon;
  final Function onTapAction;

  @override
  State<SocialIcon> createState() => _SocialIconState();
}

class _SocialIconState extends State<SocialIcon> {
  double size = 60;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: const Key(socialIcon),
      onTap: () {
        widget.onTapAction();
      },
      child: MouseRegion(
        onEnter: (_) {
          setState(() {
            size = size + 20;
          });
        },
        onExit: (_) {
          setState(() {
            size = size - 20;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(seconds: 2),
          curve: Curves.easeIn,
          child: Icon(
            widget.icon,
            color: size == 60 ? Colors.blueGrey : Colors.redAccent,
            size: size,
          ),
        ),
      ),
    );
  }
}
