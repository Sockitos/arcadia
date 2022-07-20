import 'dart:math';

import 'package:arcadia_app/gen/gen.dart';
import 'package:arcadia_app/l10n/app_localizations.dart';
import 'package:arcadia_app/main.dart';
import 'package:arcadia_app/style/colors.dart';
import 'package:arcadia_app/widgets/gradient_slider.dart';
import 'package:arcadia_app/widgets/slide.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Slide16 extends ConsumerWidget {
  const Slide16({
    super.key,
    required this.currentSlide,
    required this.onAudioEnd,
  });

  final int currentSlide;
  final VoidCallback onAudioEnd;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final logger = ref.read(loggerProvider);
    final locale = ref.watch(localeProvider);
    return Slide(
      slide: 16,
      currentSlide: currentSlide,
      background:
          Assets.images.backgrounds.slide16.image(fit: BoxFit.cover).image,
      audioPath: locale.languageCode == 'en'
          ? Assets.audios.en.slide16
          : Assets.audios.pt.slide16,
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
            left: 656,
            top: 241,
            child: Assets.images.props.slide16OldWhale
                .image(opacity: oldWhaleOpacity),
          ),
          Positioned(
            left: 702,
            top: 793,
            child: Assets.images.props.slide16DeadWhale
                .image(opacity: deadWhaleOpacity),
          ),
          Positioned(
            left: 916,
            top: 472,
            child: Assets.images.props.slide16Arrow.image(opacity: tonsOpacity),
          ),
          Positioned(
            left: 948,
            top: 539,
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
            left: 1092,
            top: 470.5,
            child: Assets.images.props.slide16ArrowCurved
                .image(opacity: tonsOpacity),
          ),
          Positioned(
            left: 1165,
            top: 368,
            child: FadeTransition(
              opacity: infoOpacity,
              child: HookBuilder(
                builder: (context) {
                  final years = useState(1);
                  return Column(
                    children: [
                      DecoratedBox(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.lightBlue,
                        ),
                        child: SizedBox(
                          width: 207,
                          height: 207,
                          child: DefaultTextStyle(
                            style: const TextStyle(
                              fontFamily: FontFamily.poppins,
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              height: 1.2,
                              color: AppColors.white,
                            ),
                            textAlign: TextAlign.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(height: 10),
                                Text(l10n.sameCO2Captured),
                                Text(
                                  '${years.value * 18}',
                                  style: const TextStyle(
                                    fontFamily: FontFamily.poppins,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 55,
                                    height: 1,
                                    color: AppColors.blue,
                                  ),
                                  strutStyle: const StrutStyle(
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
                      const SizedBox(height: 25),
                      GradientSlider(
                        startColor: AppColors.lightBlue,
                        endColor: AppColors.otherBlue,
                        min: 1,
                        max: 87,
                        divisions: 86,
                        value: years.value.toDouble(),
                        onChanged: (value) {
                          logger.logSliderValue(
                            value.round().toString(),
                            slide: 16,
                          );
                          years.value = value.round();
                        },
                      ),
                      const SizedBox(height: 10),
                      DefaultTextStyle(
                        style: const TextStyle(
                          fontFamily: FontFamily.poppins,
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          height: 1.1,
                          color: AppColors.darkBlue,
                        ),
                        child: SizedBox(
                          width: 375,
                          child: Row(
                            children: [
                              Text('1 ${l10n.year}'),
                              const Spacer(),
                              Text('87 ${l10n.years}'),
                            ],
                          ),
                        ),
                      ),
                      Assets.images.props.slide16SlideArrow
                          .image(opacity: tonsOpacity),
                      Text(
                        l10n.slide,
                        style: const TextStyle(
                          fontFamily: FontFamily.poppins,
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: AppColors.red,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ];
      },
    );
  }
}
