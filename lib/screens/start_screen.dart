import 'dart:developer';

import 'package:arcadia_app/gen/gen.dart';
import 'package:arcadia_app/l10n/app_localizations.dart';
import 'package:arcadia_app/main.dart';
import 'package:arcadia_app/style/colors.dart';
import 'package:arcadia_app/widgets/circle_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class StartScreen extends HookWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final showCredits = useState(false);
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
                  l10n.whalesDoWhat,
                  style: const TextStyle(
                    fontFamily: FontFamily.poppins,
                    fontWeight: FontWeight.bold,
                    fontSize: 120,
                    color: AppColors.darkBlue,
                    height: 1.2,
                  ),
                  textAlign: TextAlign.center,
                ),
                Consumer(
                  builder: (context, ref, _) {
                    return CircleButton(
                      height: 270,
                      width: 270,
                      backgroundColor: AppColors.white,
                      border: Border.all(
                        color: AppColors.darkBlue,
                        width: 6,
                      ),
                      onTap: () {
                        ref.read(loggerProvider).logStart();
                        context.go('/slideshow');
                      },
                      child: Text(
                        l10n.start,
                        style: const TextStyle(
                          fontFamily: FontFamily.poppins,
                          fontWeight: FontWeight.bold,
                          fontSize: 45,
                          color: AppColors.darkBlue,
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 80),
              ],
            ),
          ),
          if (showCredits.value)
            ModalBarrier(
              onDismiss: () => showCredits.value = false,
            ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            top: 0,
            bottom: 0,
            right: showCredits.value ? 0 : -630,
            child: Row(
              children: [
                RotatedBox(
                  quarterTurns: -1,
                  child: Builder(
                    builder: (context) {
                      return ElevatedButton(
                        onPressed: () => showCredits.value = !showCredits.value,
                        style: ElevatedButton.styleFrom(
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          primary: AppColors.white,
                          onPrimary: AppColors.darkBlue,
                          minimumSize: const Size(0, 36),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(8),
                            ),
                          ),
                          textStyle: const TextStyle(
                            fontFamily: FontFamily.poppins,
                            fontSize: 13,
                          ),
                        ).copyWith(elevation: MaterialStateProperty.all(0)),
                        child:
                            Text(showCredits.value ? l10n.close : l10n.credits),
                      );
                    },
                  ),
                ),
                Material(
                  color: AppColors.white,
                  elevation: 4,
                  child: SizedBox(
                    width: 630,
                    child: Padding(
                      padding: const EdgeInsets.all(75),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            l10n.credits,
                            style: const TextStyle(
                              fontFamily: FontFamily.poppins,
                              fontWeight: FontWeight.bold,
                              fontSize: 21,
                              height: 1.2,
                            ),
                          ),
                          const SizedBox(height: 40),
                          Credit(
                            label: l10n.projectBy,
                            content: 'Marta Ferreira',
                          ),
                          const SizedBox(height: 22),
                          Credit(
                            label: l10n.supervisedBy,
                            content: 'Nuno J. Nunes ${l10n.and} Valentina Nisi',
                          ),
                          const SizedBox(height: 22),
                          Credit(
                            label: l10n.development,
                            content: 'João Nogueira',
                          ),
                          Credit(
                            label: l10n.marineBiologyAdvisor,
                            content: 'Marc Fernandez',
                          ),
                          Credit(
                            label: l10n.narration,
                            content:
                                'Vanda Robalo (PT) ${l10n.and} Anna Hobbiss (EN)',
                          ),
                          const SizedBox(height: 22),
                          Credit(
                            label: l10n.standDesign,
                            content: 'D-Hive',
                          ),
                          Credit(
                            label: l10n.standProduction,
                            content:
                                'Extruplás\n${l10n.madeFromRecycledPlastic}',
                          ),
                          const SizedBox(height: 22),
                          Credit(
                            label: l10n.specialThanks,
                            content:
                                '\nPedro Ferreira, Ricardo Oliveira (D-Hive), Paulo Bala, Mara Dionísio, Sandra Olim',
                          ),
                          const SizedBox(height: 90),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Assets.images.iti.image(),
                              Assets.images.fct.image(),
                            ],
                          ),
                          const SizedBox(height: 100),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Credit extends StatelessWidget {
  const Credit({
    super.key,
    required this.label,
    this.content = '',
  });

  final String label;
  final String content;

  @override
  Widget build(BuildContext context) {
    log(MediaQuery.of(context).size.toString());
    return RichText(
      text: TextSpan(
        style: const TextStyle(
          fontFamily: FontFamily.poppins,
          fontWeight: FontWeight.w500,
          fontSize: 17,
          height: 1.3,
        ),
        children: [
          TextSpan(
            text: '$label: ',
            style: const TextStyle(color: AppColors.lightBlue),
          ),
          TextSpan(
            text: content,
            style: const TextStyle(color: AppColors.black),
          ),
        ],
      ),
    );
  }
}
