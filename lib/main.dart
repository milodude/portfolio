import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/features/landing_page/presentation/pages/desktop_page.dart';
import 'package:portfolio/features/landing_page/presentation/pages/mobile_page.dart';
import 'package:portfolio/features/landing_page/presentation/pages/responsive_layout.dart';
import 'package:portfolio/l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  static final ValueNotifier<Locale> localeNotifier =
      ValueNotifier(const Locale('es'));

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Locale>(
      valueListenable: MyApp.localeNotifier,
      builder: (context, locale, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Matias Raverta - Portfolio',
          locale: locale,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en'),
            Locale('es'),
          ],
          theme: ThemeData(
            textTheme: GoogleFonts.kalamTextTheme(
              ThemeData.light().textTheme.apply(
                    displayColor: const Color.fromARGB(255, 132, 186, 211),
                    bodyColor: Colors.blueGrey,
                  ),
            ),
          ),
          home: ResponsiveLayout(
            desktopPage: () => const DesktopPage(),
            mobilePage: () => const MobilePage(),
          ),
        );
      },
    );
  }
}
