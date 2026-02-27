import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/core/data/experience_data.dart';
import 'package:portfolio/features/landing_page/domain/entities/job_data.dart';
import 'package:portfolio/l10n/app_localizations.dart';

class BuildExperienceSnapCards extends StatefulWidget {
  const BuildExperienceSnapCards({Key? key}) : super(key: key);

  @override
  State<BuildExperienceSnapCards> createState() =>
      _BuildExperienceSnapCardsState();
}

class _BuildExperienceSnapCardsState extends State<BuildExperienceSnapCards> {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final List<JobData> data = getExperienceData(l10n);

    return CarouselSlider.builder(
        options: CarouselOptions(),
        itemCount: data.length,
        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      '${l10n.from}: ${data[itemIndex].startDate} ${l10n.to}: ${data[itemIndex].endDate}',
                    ),
                    SizedBox(
                      height: 10,
                      width: 250,
                      child: Divider(
                        color: Theme.of(context).textTheme.bodyLarge?.color,
                      ),
                    ),
                    Text(
                      data[itemIndex].description,
                      maxLines: 15,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Theme.of(context).textTheme.bodyLarge?.color,
                      ),
                    ),
                  ],
                ),
              ),
            ));
  }
}
