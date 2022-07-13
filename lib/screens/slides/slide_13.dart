import 'dart:math';

import 'package:arcadia_app/gen/gen.dart';
import 'package:arcadia_app/l10n/app_localizations.dart';
import 'package:arcadia_app/main.dart';
import 'package:arcadia_app/style/colors.dart';
import 'package:arcadia_app/widgets/slide.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_arc_text/flutter_arc_text.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Slide13 extends ConsumerWidget {
  const Slide13({
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
      slide: 13,
      currentSlide: currentSlide,
      audioPath: locale.languageCode == 'en'
          ? Assets.audios.en.slide13
          : Assets.audios.pt.slide13,
      onAudioEnd: onAudioEnd,
      propsBuilder: (context, controller) {
        const reverseCurve = Interval(0, 1, curve: Curves.easeOut);
        final whaleOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0, 0, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );
        final foodOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0, 0, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );
        final zoomOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.2, 0.4, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );
        final textOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.4, 0.6, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );

        return [
          Positioned(
            left: 798.5,
            top: 225,
            child: Assets.images.props.slide13Food.image(opacity: foodOpacity),
          ),
          Positioned(
            left: 210,
            top: 493.5,
            child:
                Assets.images.props.slide13Whale.image(opacity: whaleOpacity),
          ),
          Positioned(
            left: 1141,
            top: 335,
            child:
                Assets.images.props.slide13FoodZoom.image(opacity: zoomOpacity),
          ),
          Positioned(
            left: 1240,
            top: 230,
            child: FadeTransition(
              opacity: textOpacity,
              child: ArcText(
                radius: 300,
                startAngle: 150 * pi / 180,
                startAngleAlignment: StartAngleAlignment.center,
                placement: Placement.inside,
                direction: Direction.counterClockwise,
                text: AppLocalizations.of(context)!.microplastics,
                textStyle: TextStyle(
                  fontFamily: FontFamily.quotesScript,
                  fontSize: 40,
                  color: AppColors.lightBlue.withOpacity(0.5),
                ),
              ),
            ),
          ),
        ];
      },
    );
  }
}
