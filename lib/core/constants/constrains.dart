import 'package:flutter/material.dart';

const int mobileWidth = 690;

extension BoxConstraintsExtension on BoxConstraints {
  bool get isMobile => maxWidth < mobileWidth;
}
