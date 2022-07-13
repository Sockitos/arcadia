import 'dart:math';

import 'package:arcadia_app/gen/gen.dart';
import 'package:arcadia_app/l10n/app_localizations.dart';
import 'package:arcadia_app/main.dart';
import 'package:arcadia_app/style/colors.dart';
import 'package:arcadia_app/widgets/slide.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_arc_text/flutter_arc_text.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Slide05 extends ConsumerWidget {
  const Slide05({
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
      slide: 5,
      currentSlide: currentSlide,
      audioPath: locale.languageCode == 'en'
          ? Assets.audios.en.slide05
          : Assets.audios.pt.slide05,
      onAudioEnd: onAudioEnd,
      propsBuilder: (context, controller) {
        final l10n = AppLocalizations.of(context)!;
        const reverseCurve = Interval(0, 1, curve: Curves.easeOut);
        final fishesOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0, 0, curve: Curves.easeIn),
          ),
        );
        final circleOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0, 0.2, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );
        final circleEnvironmentOpacity =
            Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.2, 0.3, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );
        final whalesOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.3, 0.5, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );
        final circleInfoOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.5, 0.7, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );

        return [
          Positioned(
            left: 183,
            top: 133,
            child: Assets.images.props.slide02Fishes1
                .image(opacity: fishesOpacity),
          ),
          Positioned(
            left: 1523,
            top: 877,
            child: Assets.images.props.slide02Fishes3
                .image(opacity: fishesOpacity),
          ),
          Positioned(
            left: 706,
            top: 175,
            child: FadeTransition(
              opacity: circleOpacity,
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.lightBlue20,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: Assets.images.props.slide05Circle.image(),
                ),
              ),
            ),
          ),
          Positioned(
            left: 784.5,
            top: 328.5,
            child: Assets.images.props.slide05CircleEnvironment
                .image(opacity: circleEnvironmentOpacity),
          ),
          Positioned(
            left: 868,
            top: 293,
            child: Assets.images.props.slide05CircleArrows
                .image(opacity: circleInfoOpacity),
          ),
          Positioned(
            left: 790,
            top: 272,
            child: FadeTransition(
              opacity: circleInfoOpacity,
              child: Transform.rotate(
                angle: -pi / 10,
                child: Text(
                  l10n.carbon,
                  style: const TextStyle(
                    fontFamily: FontFamily.quotesScript,
                    fontSize: 30,
                    color: AppColors.red,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 922,
            top: 270,
            child: FadeTransition(
              opacity: circleInfoOpacity,
              child: Transform.rotate(
                angle: pi / 10,
                child: Text(
                  l10n.oxygen,
                  style: const TextStyle(
                    fontFamily: FontFamily.quotesScript,
                    fontSize: 30,
                    color: Color(0xFF007DBB),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 1220,
            top: 600,
            child: FadeTransition(
              opacity: circleInfoOpacity,
              child: ArcText(
                radius: 200,
                startAngle: -pi / 4,
                text: l10n.breathing,
                textStyle: TextStyle(
                  fontFamily: FontFamily.quotesScript,
                  fontSize: 38,
                  color: AppColors.lightBlue.withOpacity(0.5),
                ),
              ),
            ),
          ),
          Positioned(
            left: 1000,
            top: 500,
            child: FadeTransition(
              opacity: circleInfoOpacity,
              child: ArcText(
                radius: 200,
                startAngle: pi,
                placement: Placement.inside,
                direction: Direction.counterClockwise,
                text: l10n.feeding,
                textStyle: TextStyle(
                  fontFamily: FontFamily.quotesScript,
                  fontSize: 38,
                  color: AppColors.lightBlue.withOpacity(0.5),
                ),
              ),
            ),
          ),
          Positioned(
            left: 1178,
            top: 457,
            child: Assets.images.props.slide05BigWhale
                .image(opacity: whalesOpacity),
          ),
          Positioned(
            left: 1122,
            top: 777,
            child: Assets.images.props.slide05SmallWhale
                .image(opacity: whalesOpacity),
          ),
        ];
      },
    );
  }
}
