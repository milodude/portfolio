import 'dart:math';

import 'package:flutter/material.dart';
import 'package:portfolio/features/landing_page/domain/entities/job_data.dart';

import '../../../../../core/constants/texts.dart';
import '../../../../../core/data/experience_data.dart';

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

  final List<JobData> experience = getExperienceData();

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
