import 'package:flutter/cupertino.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout(
      {Key? key, required this.mobilePage, required this.desktopPage})
      : super(key: key);

  final Widget mobilePage;
  final Widget desktopPage;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrains) {
      return constrains.maxWidth < 698 ? mobilePage : desktopPage;
    });
  }
}
