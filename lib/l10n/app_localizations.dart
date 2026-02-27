import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es')
  ];

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Roque Matías Raverta'**
  String get name;

  /// No description provided for @title.
  ///
  /// In en, this message translates to:
  /// **'Senior Software Engineer'**
  String get title;

  /// No description provided for @aboutMe.
  ///
  /// In en, this message translates to:
  /// **'About Me'**
  String get aboutMe;

  /// No description provided for @dismiss.
  ///
  /// In en, this message translates to:
  /// **'Dismiss'**
  String get dismiss;

  /// No description provided for @details.
  ///
  /// In en, this message translates to:
  /// **'DETAILS'**
  String get details;

  /// No description provided for @techStack.
  ///
  /// In en, this message translates to:
  /// **'TECH STACK'**
  String get techStack;

  /// No description provided for @from.
  ///
  /// In en, this message translates to:
  /// **'From'**
  String get from;

  /// No description provided for @to.
  ///
  /// In en, this message translates to:
  /// **'To'**
  String get to;

  /// No description provided for @presentation.
  ///
  /// In en, this message translates to:
  /// **'Senior Software Engineer with over 14 years of experience building scalable mobile solutions. Specialized in Flutter development, system architecture, and performance optimization for production applications.'**
  String get presentation;

  /// No description provided for @presentationClosure.
  ///
  /// In en, this message translates to:
  /// **'Currently open to part-time remote opportunities (20–30 hrs/week) paid in USD, collaborating with startups and product teams.'**
  String get presentationClosure;

  /// No description provided for @aboutMeFull.
  ///
  /// In en, this message translates to:
  /// **'Senior Software Engineer with over 14 years of experience building scalable mobile solutions.\nSpecialized in Flutter development, system architecture, and performance optimization for production applications.\n\nI have helped companies to:\n\n🚀 build multiplatform applications from scratch\n⚡ optimize Firebase costs and performance\n🏗️ design clean and maintainable architectures\n🔔 implement real-time features and notifications\n\nTech Stack: Flutter, Dart, Firebase, REST APIs, CI/CD, Clean Architecture.\n\nCurrently open to part-time remote opportunities (20–30 hrs/week) paid in USD, collaborating with startups and product teams that value clean and scalable solutions.'**
  String get aboutMeFull;

  /// No description provided for @exp1Role.
  ///
  /// In en, this message translates to:
  /// **'Engineer - Psi turnos'**
  String get exp1Role;

  /// No description provided for @exp1Date.
  ///
  /// In en, this message translates to:
  /// **'Nov. 2025'**
  String get exp1Date;

  /// No description provided for @exp1EndDate.
  ///
  /// In en, this message translates to:
  /// **'Present'**
  String get exp1EndDate;

  /// No description provided for @exp1Desc.
  ///
  /// In en, this message translates to:
  /// **'Led the development of a cross-platform mobile application for mental health professionals. Designed and implemented a scalable mobile architecture using Flutter and Firebase. Optimized Firestore queries, reducing operational costs and improving performance. Developed backend logic with Cloud Functions for reminders and targeted push notifications. Implemented CI/CD with Fastlane and managed the full cycle until publication on the Google Play Store.'**
  String get exp1Desc;

  /// No description provided for @exp2Role.
  ///
  /// In en, this message translates to:
  /// **'Engineer - Freelogic'**
  String get exp2Role;

  /// No description provided for @exp2Date.
  ///
  /// In en, this message translates to:
  /// **'Sept. 2024'**
  String get exp2Date;

  /// No description provided for @exp2EndDate.
  ///
  /// In en, this message translates to:
  /// **'Present'**
  String get exp2EndDate;

  /// No description provided for @exp2Desc.
  ///
  /// In en, this message translates to:
  /// **'Led architectural improvements in existing mobile and backend applications, increasing scalability and maintainability. Defined and implemented modular architecture patterns, reducing technical debt and improving code reuse. Introduced unit and integration testing strategies, increasing system reliability. Established and promoted clean code best practices within development teams. Collaborated with multidisciplinary teams in Agile/Scrum environments.'**
  String get exp2Desc;

  /// No description provided for @exp3Role.
  ///
  /// In en, this message translates to:
  /// **'Engineer - Nini Mayorista'**
  String get exp3Role;

  /// No description provided for @exp3Date.
  ///
  /// In en, this message translates to:
  /// **'Sept. 2023'**
  String get exp3Date;

  /// No description provided for @exp3EndDate.
  ///
  /// In en, this message translates to:
  /// **'Present'**
  String get exp3EndDate;

  /// No description provided for @exp3Desc.
  ///
  /// In en, this message translates to:
  /// **'Designed and developed an offline-first mobile order management system. Implemented Clean Architecture principles, ensuring scalability and clear separation of concerns. Managed local persistence using Sembast, optimizing synchronization and storage performance. Integrated secure backend communication via REST APIs, handling data synchronization and error control.'**
  String get exp3Desc;

  /// No description provided for @exp4Role.
  ///
  /// In en, this message translates to:
  /// **'Engineer - HyF'**
  String get exp4Role;

  /// No description provided for @exp4Date.
  ///
  /// In en, this message translates to:
  /// **'Sept. 2025'**
  String get exp4Date;

  /// No description provided for @exp4EndDate.
  ///
  /// In en, this message translates to:
  /// **'Feb. 2026'**
  String get exp4EndDate;

  /// No description provided for @exp4Desc.
  ///
  /// In en, this message translates to:
  /// **'Implemented key features in multi-platform Flutter applications for a wholesale distributor. Designed and applied Clean Architecture, improving maintainability, scalability, and team productivity. Participated in the development of mobile and web Flutter apps used by salespeople in production environments. Developed and maintained unit tests.'**
  String get exp4Desc;

  /// No description provided for @exp5Role.
  ///
  /// In en, this message translates to:
  /// **'Engineer - Two brains'**
  String get exp5Role;

  /// No description provided for @exp5Date.
  ///
  /// In en, this message translates to:
  /// **'Apr. 2024'**
  String get exp5Date;

  /// No description provided for @exp5EndDate.
  ///
  /// In en, this message translates to:
  /// **'Feb. 2026'**
  String get exp5EndDate;

  /// No description provided for @exp5Desc.
  ///
  /// In en, this message translates to:
  /// **'Designed and developed a service marketplace mobile application. Built the app using Flutter for Android and iOS. Implemented a scalable backend with Firebase Realtime Database for real-time synchronization. Developed key features such as service discovery, user matching, and real-time updates.'**
  String get exp5Desc;

  /// No description provided for @exp6Role.
  ///
  /// In en, this message translates to:
  /// **'Engineer - La bomba'**
  String get exp6Role;

  /// No description provided for @exp6Date.
  ///
  /// In en, this message translates to:
  /// **'Jan. 2020'**
  String get exp6Date;

  /// No description provided for @exp6EndDate.
  ///
  /// In en, this message translates to:
  /// **'Aug. 2023'**
  String get exp6EndDate;

  /// No description provided for @exp6Desc.
  ///
  /// In en, this message translates to:
  /// **'Developed a tabletop game mobile application using the Flutter SDK. Implemented state management using the BLoC pattern. Designed and integrated custom animations and sound effects. Optimized rendering performance to ensure smooth interactions on Android devices. Successfully published the application on the Google Play Store.'**
  String get exp6Desc;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
