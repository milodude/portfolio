import 'package:flutter/material.dart';
import 'package:portfolio/features/landing_page/presentation/widgets/language_switcher.dart';
import 'package:portfolio/l10n/app_localizations.dart';

class TopMobile extends StatelessWidget {
  const TopMobile({
    Key? key,
    required this.heigth,
    required this.width,
  }) : super(key: key);

  final double heigth;
  final double width;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Positioned(
      left: 0,
      child: SizedBox(
        height: heigth * 0.2,
        width: width,
        child: Container(
          color: Theme.of(context).textTheme.bodySmall?.color,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              const LanguageSwitcher(),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Text(
                  l10n.name,
                  style: const TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
