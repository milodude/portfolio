import 'package:portfolio/features/landing_page/domain/entities/job_data.dart';

List<JobData> getExperienceData() => <JobData>[
      JobData(
        startDate: '01-2020',
        endDate: 'In Progress',
        techs: ['Flutter', 'Dart'],
        description: 'Mobile application development for a table game using '
            'Flutter SDK called “La Bomba”. State management was implemented using '
            'Bloc. Animations and sound effects were implemented. The app has '
            'been published in the android play store.',
        company: 'Two Brains- Self Entrepreneurship',
      ),
      JobData(
        startDate: '10-2015',
        endDate: '06-2022',
        techs: ['Flutter', 'Dart', 'C#', 'Agile'],
        description:
            '*Small Web application developer using flutter for tracking media files '
            'such as newspapers, radio and tv. Requirements and processes '
            'analysis. Websockets implementation in flutter for using SignalR.\n'
            '*Single web page application development for financial sector using '
            'Microsoft Visual Studio as a framework. UI side implemented with '
            'AngularJs. The project was developed with an Agile methodology '
            'Used Jira for project managment. Used source tree for control versioning.',
        company: 'Nuba',
      ),
      JobData(
        startDate: '08-2018',
        endDate: '09-2019',
        techs: ['Flutter', 'Dart', 'C#', '.NET', 'Agile'],
        description: 'Worked as a mobile developer using flutter sdk for '
            'android. Design of user interface was created using the material '
            'package. State management was handled using the scoped model library. '
            'Back end was developed in .NET using REST API.',
        company: 'Two Brains- Self Entrepreneurship',
      ),
      JobData(
        startDate: '03-2016',
        endDate: '08-2016',
        techs: ['C#', '.NET', 'Agile'],
        description: 'Single web application to manage mobile devices stocks '
            'and keep tracking of sales so stocks could be followed and maintained '
            'properly. Project management is being done using trello following an '
            'Agile methodology. Control versioning was done using source tree. '
            'Continuous integration for the back end side was done using AppVeyor.'
            'UI side was done using angularJs. Back end side was done using Visual '
            'Studio IDE using C# language.',
        company: 'Self Entrepreneurship',
      ),
      JobData(
        startDate: '11-2014',
        endDate: '12-2015',
        techs: ['C#', '.NET'],
        description: 'YPF web application maintenance using Microsoft Visual '
            'Studio as framework. Front end was developed using knockout and '
            'bootstrap. Requirement analysis and single page web application '
            'development for Sancor. Application was intended to be able to manage '
            'food orders for Sancor employees. Back end was programmed in Microsoft '
            'Visual Studio framework 2013. The UI side was developed using '
            'Javascript, CSS and bootstrap.',
        company: 'Streambe',
      ),
      JobData(
        startDate: '08-2013',
        endDate: '09-2014',
        techs: ['C#', '.NET'],
        description: 'Application development and maintenance for the '
            'Government of the US. Worked with Visual Studio 2012 and c# as a '
            'programming language. Unit testing using MOQ. The UI side was developed'
            'using javascript and jquery. Had to support external developers. '
            'Development was done using scrum methodology. Tasks estimation and '
            'planning. Project management was done using TFS (Team foundation server)'
            'Control versioning was done using subversion.',
        company: 'Globant',
      ),
    ];
