import 'dart:math';

import 'package:arcadia_app/gen/gen.dart';
import 'package:arcadia_app/l10n/app_localizations.dart';
import 'package:arcadia_app/main.dart';
import 'package:arcadia_app/style/colors.dart';
import 'package:arcadia_app/widgets/slide.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Slide30 extends ConsumerWidget {
  const Slide30({
    super.key,
    required this.currentSlide,
    required this.onAudioEnd,
  });

  final int currentSlide;
  final VoidCallback onAudioEnd;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeProvider);
    return Slide(
      slide: 30,
      currentSlide: currentSlide,
      background:
          Assets.images.backgrounds.slide30.image(fit: BoxFit.cover).image,
      audioPath: locale.languageCode == 'en'
          ? Assets.audios.en.slide30
          : Assets.audios.pt.slide30,
      onAudioEnd: onAudioEnd,
      propsBuilder: (context, controller) {
        final l10n = AppLocalizations.of(context)!;
        const reverseCurve = Interval(0, 1, curve: Curves.easeOut);
        final oldWhaleOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0, 0.2, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );
        final deadWhaleOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.2, 0.4, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );
        final tonsOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.4, 0.5, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );
        final infoOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.5, 0.7, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );
        return [
          Positioned(
            left: 677,
            top: 241,
            child: Assets.images.props.slide30OldWhale
                .image(opacity: oldWhaleOpacity),
          ),
          Positioned(
            left: 702,
            top: 793,
            child: Assets.images.props.slide30DeadWhale
                .image(opacity: deadWhaleOpacity),
          ),
          Positioned(
            left: 1015,
            top: 468,
            child: Assets.images.props.slide30Arrow.image(opacity: tonsOpacity),
          ),
          Positioned(
            left: 1045,
            top: 538,
            child: FadeTransition(
              opacity: tonsOpacity,
              child: Transform.rotate(
                angle: -pi / 11,
                child: Text(
                  '33 ${AppLocalizations.of(context)!.tons}!',
                  style: const TextStyle(
                    fontFamily: FontFamily.quotesScript,
                    fontSize: 45,
                    color: AppColors.red,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 1260,
            top: 446,
            child: FadeTransition(
              opacity: infoOpacity,
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.lightBlue,
                ),
                child: SizedBox(
                  width: 234,
                  height: 234,
                  child: DefaultTextStyle(
                    style: const TextStyle(
                      fontFamily: FontFamily.poppins,
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      height: 1.2,
                      color: AppColors.white,
                    ),
                    textAlign: TextAlign.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 10),
                        Text(l10n.sameCO2Captured),
                        const Text(
                          '1520',
                          style: TextStyle(
                            fontFamily: FontFamily.quotesScript,
                            fontSize: 63,
                            height: 1,
                            color: AppColors.blue,
                          ),
                          strutStyle: StrutStyle(
                            fontSize: 60,
                            height: 1,
                            forceStrutHeight: true,
                          ),
                        ),
                        Text(l10n.treesInOnYear),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ];
      },
    );
  }
}
