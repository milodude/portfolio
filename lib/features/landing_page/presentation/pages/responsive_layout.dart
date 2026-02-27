import 'package:flutter/material.dart';

import '../../../../core/constants/constrains.dart';

/// ResponsiveLayout
///
/// Widget that handles the responsiveness of the app by heading to a mobile or
/// desktop page respectively.It takes two widgets as mandatory arguments. A
///  [mobilePage] and [desktopPage].

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({
    super.key,
    required this.mobilePage,
    required this.desktopPage,
  });

  final Widget Function() mobilePage;
  final Widget Function() desktopPage;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constrains) {
        final Widget devicePage =
            constrains.isMobile ? mobilePage() : desktopPage();
        return Scaffold(body: devicePage);
      },
    );
  }
}
