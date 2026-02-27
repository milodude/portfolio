import 'package:portfolio/features/landing_page/domain/entities/job_data.dart';
import 'package:portfolio/l10n/app_localizations.dart';

List<JobData> getExperienceData(AppLocalizations l10n) => <JobData>[
      JobData(
        startDate: l10n.exp1Date,
        endDate: l10n.exp1EndDate,
        techs: [
          'Flutter',
          'Dart',
          'Firebase',
          'Cloud Functions',
          'Fastlane',
          'Clean Architecture'
        ],
        description: l10n.exp1Desc,
        company: l10n.exp1Role,
      ),
      JobData(
        startDate: l10n.exp2Date,
        endDate: l10n.exp2EndDate,
        techs: [
          'Arquitectura de software',
          'Flutter',
          'Clean Architecture',
          'Modularización',
          'Unit Testing'
        ],
        description: l10n.exp2Desc,
        company: l10n.exp2Role,
      ),
      JobData(
        startDate: l10n.exp3Date,
        endDate: l10n.exp3EndDate,
        techs: [
          'Bloc',
          'Flutter',
          'Offline-first',
          'Sembast',
          'REST API',
          'SOLID',
          'Unit Testing'
        ],
        description: l10n.exp3Desc,
        company: l10n.exp3Role,
      ),
      JobData(
        startDate: l10n.exp4Date,
        endDate: l10n.exp4EndDate,
        techs: [
          'Flutter',
          'Clean Architecture',
          'Multiplataforma',
          'Unit Testing',
          'B2B'
        ],
        description: l10n.exp4Desc,
        company: l10n.exp4Role,
      ),
      JobData(
        startDate: l10n.exp5Date,
        endDate: l10n.exp5EndDate,
        techs: [
          'Flutter',
          'Firebase',
          'NoSQL',
          'Marketplace',
          'Realtime Database'
        ],
        description: l10n.exp5Desc,
        company: l10n.exp5Role,
      ),
      JobData(
        startDate: l10n.exp6Date,
        endDate: l10n.exp6EndDate,
        techs: [
          'Flutter',
          'BLoC',
          'Animaciones',
          'UI/UX',
          'Cloud Firestore',
          'Google Play'
        ],
        description: l10n.exp6Desc,
        company: l10n.exp6Role,
      ),
    ];
