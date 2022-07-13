import 'dart:math';

import 'package:arcadia_app/gen/gen.dart';
import 'package:arcadia_app/l10n/app_localizations.dart';
import 'package:arcadia_app/main.dart';
import 'package:arcadia_app/style/colors.dart';
import 'package:arcadia_app/widgets/line.dart';
import 'package:arcadia_app/widgets/slide.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Slide01 extends ConsumerWidget {
  const Slide01({
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
      slide: 1,
      currentSlide: currentSlide,
      background:
          Assets.images.backgrounds.slide01.image(fit: BoxFit.cover).image,
      backgroundDuration: Duration.zero,
      audioPath: locale.languageCode == 'en'
          ? Assets.audios.en.slide01
          : Assets.audios.pt.slide01,
      onAudioEnd: onAudioEnd,
      propsBuilder: (context, controller) {
        const reverseCurve = Interval(0, 1, curve: Curves.easeOut);
        final circleOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0, 0.2, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );
        final mapOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.2, 0.4, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );
        final whaleOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.4, 0.6, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );
        final hereOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.6, 0.8, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );
        return [
          Center(
            child: FadeTransition(
              opacity: circleOpacity,
              child: const Padding(
                padding: EdgeInsets.only(bottom: 60),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.white,
                  ),
                  child: SizedBox(
                    width: 692,
                    height: 692,
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Assets.images.props.slide01Map.image(opacity: mapOpacity),
          ),
          Positioned(
            left: 792,
            top: 522,
            child:
                Assets.images.props.slide01Whale.image(opacity: whaleOpacity),
          ),
          Positioned(
            left: 839,
            top: 471,
            child: Assets.images.props.slide01DashedLine
                .image(opacity: whaleOpacity),
          ),
          Positioned(
            left: 817,
            top: 380,
            child: FadeTransition(
              opacity: hereOpacity,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.white,
                  border: Border.all(color: AppColors.darkBlue, width: 2),
                ),
                child: SizedBox(
                  width: 85,
                  height: 85,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text(
                        '${AppLocalizations.of(context)!.youreHere}!',
                        style: const TextStyle(
                          fontFamily: FontFamily.poppins,
                          fontWeight: FontWeight.bold,
                          fontSize: 19,
                          color: AppColors.darkBlue,
                          height: 1.1,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 881,
            top: 458,
            child: FadeTransition(
              opacity: hereOpacity,
              child: Transform.rotate(
                angle: pi / 4,
                child: const Line(
                  color: AppColors.darkBlue,
                  size: Size(28, 2),
                  axis: Axis.horizontal,
                ),
              ),
            ),
          ),
        ];
      },
    );
  }
}
