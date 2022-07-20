import 'package:flutter/material.dart';

class TopMobile extends StatelessWidget {
  const TopMobile({
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
