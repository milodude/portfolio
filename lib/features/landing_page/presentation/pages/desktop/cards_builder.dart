import 'dart:math';

import 'package:flutter/material.dart';
import 'package:portfolio/features/landing_page/domain/entities/job_data.dart';

import '../../../../../core/constants/texts.dart';

class Cardsbuilder extends StatefulWidget {
  const Cardsbuilder({Key? key}) : super(key: key);

  @override
  State<Cardsbuilder> createState() => _CardsbuilderState();
}

class _CardsbuilderState extends State<Cardsbuilder>
    with SingleTickerProviderStateMixin {
  int? _index;

  late AnimationController controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 750),
  );

  final List<JobData> experience = <JobData>[
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
          '*Web application developer using flutter for tracking media files '
          'such as newspapers, radio and tv. Requirements and processes '
          'analysis. Websockets implementation in flutter to use them with '
          'SignalR (back end side) as a whole. \n'
          '*Single web page application development for financial sector using '
          'Microsoft Visual Studio as a framework. UI side implemented with '
          'AngularJs and some other useful tools as yeoman, grunt, bower and '
          'npm. Project being developed with an Agile methodology during its '
          'duration(using Jira for project managment). Used source tree for '
          'control versioning.',
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 2,
            ),
            scrollDirection: Axis.vertical,
            itemCount: experience.length,
            itemBuilder: (
              BuildContext context,
              int index,
            ) {
              return GestureDetector(
                onTap: () => showDialog(
                  context: context,
                  builder: (context) => buildExperienceDetails(
                    context,
                    experience[index],
                  ),
                ),
                child: MouseRegion(
                  onEnter: ((event) {
                    _index = index;
                    controller.forward();
                  }),
                  onExit: (event) {
                    _index = index;
                    controller.reset();
                  },
                  child: ListTile(
                    leading: AnimatedBuilder(
                      animation: controller,
                      builder: (
                        context,
                        snap,
                      ) {
                        if (index == _index) {
                          return Transform.rotate(
                            angle: 2 * pi * controller.value,
                            child: const Icon(
                              Icons.cases_outlined,
                              size: 30,
                            ),
                          );
                        }

                        return const Icon(
                          Icons.cases_outlined,
                          size: 30,
                        );
                      },
                    ),
                    title: Text(
                      'From: ${experience[index].startDate} To: ${experience[index].endDate}',
                    ),
                    subtitle: Text(
                      experience[index].description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Theme.of(context).textTheme.bodyText1?.color,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget buildExperienceDetails(BuildContext context, JobData data) {
    return Dialog(
      child: SizedBox(
        width: 550,
        child: SingleChildScrollView(
          child: Column(
            children: [
              getCompanyTitle(data),
              const SizedBox(height: 10),
              getWorkingPeriod(data),
              const SizedBox(width: 5),
              getTechStack(context, data),
              const SizedBox(width: 120, child: Divider()),
              const SizedBox(height: 10),
              getJobDescription(data),
              const SizedBox(height: 35),
              //TODO: Refactorizar y sacar afuera
              getDismissButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Padding getDismissButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () => WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.of(context).pop();
        }),
        style: ElevatedButton.styleFrom(
            fixedSize: const Size(120, 50),
            primary: Theme.of(context).textTheme.bodySmall?.color),
        child: const Text(buttonDismiss),
      ),
    );
  }

  Padding getJobDescription(JobData data) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 400,
        child: Text(
          data.description,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  Row getTechStack(BuildContext context, JobData data) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Tech Stack: '),
        const SizedBox(width: 5),
        getBadges(context, data.techs),
      ],
    );
  }

  Text getWorkingPeriod(JobData data) {
    return Text(
      'From ${data.startDate} to ${data.endDate}',
      style: const TextStyle(fontSize: 16),
    );
  }

  Text getCompanyTitle(JobData data) {
    return Text(
      data.company,
      style: const TextStyle(fontSize: 26),
    );
  }

  Widget getBadges(BuildContext context, List<String> techs) {
    return Row(
      children: techs
          .map(
            (item) => Chip(
              label: Text(item),
              backgroundColor: Theme.of(context).textTheme.bodySmall?.color,
              padding: const EdgeInsets.all(7),
            ),
          )
          .toList(),
    );
  }
}
