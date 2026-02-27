import 'package:portfolio/features/landing_page/domain/entities/job_data.dart';

List<JobData> getExperienceData() => <JobData>[
      JobData(
        startDate: '01-2020',
        endDate: 'In Progress',
        techs: ['Flutter', 'Dart', 'Bloc', 'Lottie', 'Audio'],
        description:
            'Lead developer for "La Bomba", a high-stakes mobile table game. '
            'Architected the state management with Bloc, implemented low-latency '
            'sound effects, and crafted immersive custom animations to enhance '
            'player engagement. Successfully published on Google Play Store.',
        company: 'Two Brains - Lead Developer',
      ),
      JobData(
        startDate: '10-2015',
        endDate: '06-2022',
        techs: ['Flutter', 'Dart', 'C#', 'Agile'],
        description:
            'Senior developer for multi-platform media monitoring systems. '
            'Implemented SignalR real-time updates and architected Angular/Flutter '
            'frontends for high-traffic financial and media tracking sectors.',
        company: 'Nuba - Fullstack Engineer',
      ),
      JobData(
        startDate: '08-2018',
        endDate: '09-2019',
        techs: ['Flutter', 'Dart', 'C#', '.NET', 'Agile'],
        description: 'Pioneered Flutter adoption for mobile entrepreneurship. '
            'Designed pixel-perfect Material interfaces and managed state with '
            'Scoped Model, integrating seamlessly with .NET REST APIs.',
        company: 'Two Brains - Founder & Dev',
      ),
      JobData(
        startDate: '03-2016',
        endDate: '08-2016',
        techs: ['C#', '.NET', 'Agile', 'AngularJS'],
        description:
            'Architected a comprehensive stock management and sales tracking '
            'SPA. Implemented CI/CD pipelines with AppVeyor and managed '
            'delivery using Agile/Trello methodologies.',
        company: 'Self Entrepreneurship',
      ),
      JobData(
        startDate: '11-2014',
        endDate: '12-2015',
        techs: ['C#', '.NET', 'Bootstrap', 'Knockout'],
        description:
            'Modernized legacy YPF web applications. Developed high-performance '
            'SPAs for Sancor using Knockout.js and optimized .NET backends '
            'for large-scale enterprise food order management.',
        company: 'Streambe - Senior Software Dev',
      ),
      JobData(
        startDate: '08-2013',
        endDate: '09-2014',
        techs: ['C#', '.NET', 'Scrum', 'Unit Testing'],
        description:
            'Consulted for the US Government on mission-critical applications. '
            'Led unit testing initiatives with MOQ and mentored external '
            'development teams within a high-velocity Scrum environment.',
        company: 'Globant - Software Engineer',
      ),
    ];
