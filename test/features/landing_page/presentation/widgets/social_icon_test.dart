import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:portfolio/features/landing_page/presentation/widgets/social_icon.dart';
import 'package:portfolio/core/constants/widgets_keys.dart' as constants_keys;

void main() {
  Widget widgetSetupToBeTested({required Widget child}) {
    return MaterialApp(
      home: Scaffold(body: child),
    );
  }

  group('Social Icon Tests: ', () {
    testWidgets('Should add a Social icon widget without any issues',
        (tester) async {
      //ARRANGE
      const String iconImageUrl = 'https://www.someUrl.com.ar';
      void _redirectToUrl() {}
      //ACT
      await mockNetworkImagesFor(
          () async => await tester.pumpWidget(widgetSetupToBeTested(
                  child: SocialIcon(
                iconImageUrl: iconImageUrl,
                onTapAction: _redirectToUrl,
              ))));
      await tester.pump();
      //ASSERT
      Finder socialIcon = find.byKey(const Key(constants_keys.socialIcon));
      await tester.pump(const Duration(seconds: 1));
      expect(socialIcon, findsOneWidget);
    });

    testWidgets('Should execute the function on tapping without any issues',
        (tester) async {
      //ARRANGE
      var testingBool = false;
      const String iconImageUrl = 'https://www.someUrl.com.ar';
      void _redirectToUrl() {
        testingBool = !testingBool;
      }

      //ACT
      await mockNetworkImagesFor(
          () async => await tester.pumpWidget(widgetSetupToBeTested(
                  child: SocialIcon(
                iconImageUrl: iconImageUrl,
                onTapAction: _redirectToUrl,
              ))));
      await tester.pump();
      //ASSERT
      Finder socialIcon = find.byKey(const Key(constants_keys.socialIcon));
      await tester.pump(const Duration(seconds: 1));
      await tester.tap(socialIcon);

      expect(true, testingBool);
    });
  });
}
