import 'package:flutter/material.dart';

import '../../../../main.dart';

class LanguageSwitcher extends StatelessWidget {
  const LanguageSwitcher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Locale>(
      valueListenable: MyApp.localeNotifier,
      builder: (context, currentLocale, child) {
        final isSpanish = currentLocale.languageCode == 'es';
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _LanguageButton(
                label: 'ES',
                isActive: isSpanish,
                onTap: () => MyApp.localeNotifier.value = const Locale('es'),
              ),
              const SizedBox(width: 8),
              Text(
                '/',
                style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.3), fontSize: 12),
              ),
              const SizedBox(width: 8),
              _LanguageButton(
                label: 'EN',
                isActive: !isSpanish,
                onTap: () => MyApp.localeNotifier.value = const Locale('en'),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _LanguageButton extends StatelessWidget {
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const _LanguageButton({
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Text(
          label,
          style: TextStyle(
            color:
                isActive ? Colors.white : Colors.white.withValues(alpha: 0.5),
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            fontSize: 14,
            letterSpacing: 1.5,
          ),
        ),
      ),
    );
  }
}
