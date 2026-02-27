import 'package:flutter/material.dart';

import '../../../../core/constants/constants.dart';
import '../widgets/social_networks.dart';
import 'desktop/experience.dart';
import 'desktop/photograph.dart';

class DesktopPage extends StatefulWidget {
  const DesktopPage({Key? key}) : super(key: key);

  @override
  State<DesktopPage> createState() => _DesktopPageState();
}

class _DesktopPageState extends State<DesktopPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(const AssetImage(profilePath), context);
  }

  @override
  Widget build(BuildContext context) {
    final heigth = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: AnimatedContainer(
        height: heigth,
        duration: const Duration(milliseconds: 200),
        child: Stack(
          children: [
            Experience(width: width, heigth: heigth),
            PhotoGraph(heigth: heigth, width: width),
            SocialNetworks(heigth: heigth, width: width),
          ],
        ),
      ),
    );
  }
}
