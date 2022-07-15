import 'package:flutter/material.dart';
import 'package:portfolio/features/landing_page/domain/entities/job_data.dart';

class Cardsbuilder extends StatelessWidget {
  Cardsbuilder({Key? key}) : super(key: key);

  final List<JobData> experience = <JobData>[
    JobData(
        startDate: '10-2015',
        endDate: '06-2022',
        techs: ['Flutter', 'Dart', 'C#', 'Agile'],
        description:
            '''Web application developer using flutter for tracking media files 
            such as newspapers, radio and tv. Requirements and proceses 
            analysis. Websockets implementation in flutter to use them with 
            SignalR (back end side) as a whole.
            Single web page application development for financial sector using 
            Microsoft Visual Studio as a framework. UI side implemented with 
            AngularJs and some other useful tools as yeoman, grunt, bower and 
            npm. Project being developed with an Agile methodology during its 
            duration(using Jira for project managment). Used source tree for 
            control versioning.''',
        company: 'Nuba'),
    JobData(
      startDate: '01-2020',
      endDate: 'Today',
      techs: ['Flutter', 'Dart'],
      description: '''Mobile application development for a table game using 
      Flutter SDK called “La Bomba”. State management was implemented using 
      Bloc. Animations and sound effects were implemented. The app has 
      been published in the android play store.''',
      company: 'Two Brains- Self Entrepreneurship',
    ),
    JobData(
        startDate: '08-2018',
        endDate: '09-2019',
        techs: ['Flutter', 'Dart', 'C#', '.NET', 'Agile'],
        description: '''Worked as a mobile developer app using flutter sdk for 
        android. Design of user interface was created using the material 
        package. State management was handled using the scoped model library. 
        Back end was developed in .NET using REST API.''',
        company: 'Two Brains- Self Entrepreneurship'),
    JobData(
        startDate: '03-2016',
        endDate: '08-2016',
        techs: ['C#', '.NET', 'Agile'],
        description: '''Single web application to manage mobile devices stocks 
        and keep tracking of sales so stocks could be followed and maintained 
        properly. Project management is being done using trello following an 
        Agile methodology. Control versioning was done using source tree. 
        Continuous integration for the back end side was done using AppVeyor. 
        UI side was done using angularJs. Back end side was done using Visual 
        Studio IDE using C# language.''',
        company: 'Self Entrepreneurship'),
    JobData(
        startDate: '11-2014',
        endDate: '12-2015',
        techs: ['Flutter', 'Dart'],
        description: 'a descr',
        company: 'XXX'),
    JobData(
        startDate: '11-2014',
        endDate: '12-2015',
        techs: ['Flutter', 'Dart'],
        description: 'a descr',
        company: 'XXX'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, childAspectRatio: 2),
              scrollDirection: Axis.vertical,
              itemCount: experience.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: const Icon(
                    Icons.cases_outlined,
                    color: Colors.white,
                  ),
                  title: Text(
                    'From: ${experience[index].startDate} To: ${experience[index].endDate}',
                    style: const TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(
                    experience[index].description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.white),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
