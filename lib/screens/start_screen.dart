import 'package:arcadia_app/gen/gen.dart';
import 'package:arcadia_app/l10n/app_localizations.dart';
import 'package:arcadia_app/main.dart';
import 'package:arcadia_app/style/colors.dart';
import 'package:arcadia_app/widgets/circle_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: Assets.images.backgrounds.start.image(fit: BoxFit.cover),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Consumer(
                  builder: (context, ref, _) {
                    final locale = ref.watch(localeProvider);
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleButton(
                          height: 62,
                          width: 62,
                          backgroundColor: locale.languageCode == 'en'
                              ? AppColors.darkBlue
                              : null,
                          border: Border.all(
                            color: AppColors.darkBlue,
                            width: 2,
                          ),
                          onTap: () => ref.read(localeProvider.state).state =
                              const Locale('en'),
                          child: Text(
                            'EN',
                            style: TextStyle(
                              fontFamily: FontFamily.poppins,
                              fontSize: 28,
                              color: locale.languageCode == 'en'
                                  ? AppColors.white
                                  : AppColors.darkBlue,
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        CircleButton(
                          height: 62,
                          width: 62,
                          backgroundColor: locale.languageCode == 'pt'
                              ? AppColors.darkBlue
                              : null,
                          border: Border.all(
                            color: AppColors.darkBlue,
                            width: 2,
                          ),
                          onTap: () => ref.read(localeProvider.state).state =
                              const Locale('pt'),
                          child: Text(
                            'PT',
                            style: TextStyle(
                              fontFamily: FontFamily.poppins,
                              fontSize: 28,
                              color: locale.languageCode == 'pt'
                                  ? AppColors.white
                                  : AppColors.darkBlue,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
                Text(
                  AppLocalizations.of(context)!.oceansDoWhat,
                  style: const TextStyle(
                    fontFamily: FontFamily.poppins,
                    fontWeight: FontWeight.bold,
                    fontSize: 120,
                    color: AppColors.darkBlue,
                    height: 1.2,
                  ),
                  textAlign: TextAlign.center,
                ),
                CircleButton(
                  height: 270,
                  width: 270,
                  backgroundColor: AppColors.white,
                  border: Border.all(
                    color: AppColors.darkBlue,
                    width: 6,
                  ),
                  onTap: () => context.go('/slideshow'),
                  child: Text(
                    AppLocalizations.of(context)!.start,
                    style: const TextStyle(
                      fontFamily: FontFamily.poppins,
                      fontWeight: FontWeight.bold,
                      fontSize: 45,
                      color: AppColors.darkBlue,
                    ),
                  ),
                ),
                const SizedBox(height: 80),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
