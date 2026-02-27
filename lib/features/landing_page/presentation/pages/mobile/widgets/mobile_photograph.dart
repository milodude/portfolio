import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/constants.dart';

class MobilePhotoGraph extends StatelessWidget {
  const MobilePhotoGraph({
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
      child: IgnorePointer(
        child: Opacity(
          opacity: 0.3,
          child: SizedBox(
            height: heigth,
            width: width,
            child: Image.asset(
              profilePath,
              fit: BoxFit.cover,
              frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                if (wasSynchronouslyLoaded) return child;
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  layoutBuilder: (currentChild, previousChildren) {
                    return Stack(
                      children: <Widget>[
                        ...previousChildren
                            .map((e) => Positioned.fill(child: e)),
                        if (currentChild != null)
                          Positioned.fill(child: currentChild),
                      ],
                    );
                  },
                  child: frame != null
                      ? SizedBox.expand(child: child)
                      : Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.grey[900]!,
                                Colors.grey[800]!,
                                Colors.grey[900]!,
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white24,
                            ),
                          ),
                        ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
