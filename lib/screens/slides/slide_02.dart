import 'dart:math';

import 'package:arcadia_app/gen/gen.dart';
import 'package:arcadia_app/l10n/app_localizations.dart';
import 'package:arcadia_app/main.dart';
import 'package:arcadia_app/style/colors.dart';
import 'package:arcadia_app/widgets/line.dart';
import 'package:arcadia_app/widgets/slide.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Slide02 extends ConsumerWidget {
  const Slide02({
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
      slide: 2,
      currentSlide: currentSlide,
      audioPath: locale.languageCode == 'en'
          ? Assets.audios.en.slide02
          : Assets.audios.pt.slide02,
      onAudioEnd: onAudioEnd,
      propsBuilder: (context, controller) {
        final l10n = AppLocalizations.of(context)!;
        const reverseCurve = Interval(0, 1, curve: Curves.easeOut);
        final fishesOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0, 0.2, curve: Curves.easeIn),
          ),
        );
        final circleOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.1, 0.3, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );
        final bigWhaleOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.3, 0.4, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );
        final smallWhaleOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.4, 0.5, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );
        final twoLeggedOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.5, 0.6, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );
        final whalesEffectsOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.6, 0.7, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );
        final chartCircleOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.6, 0.7, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );
        final chartOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.7, 0.9, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );
        final chartExtraOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.9, 1, curve: Curves.easeIn),
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
            left: 914,
            top: 184,
            child: FadeTransition(
              opacity: chartCircleOpacity,
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.lightBlue20,
                ),
                child: SizedBox(
                  width: 683,
                  height: 683,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 80),
                      FadeTransition(
                        opacity: chartCircleOpacity,
                        child: Text(
                          l10n.populationOverTime,
                          style: const TextStyle(
                            fontFamily: FontFamily.poppins,
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            height: 1.2,
                            color: AppColors.darkBlue,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        child: Stack(
                          children: [
                            Column(
                              children: [
                                const Spacer(),
                                FadeTransition(
                                  opacity: chartOpacity,
                                  child: DefaultTextStyle(
                                    style: const TextStyle(
                                      fontFamily: FontFamily.poppins,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 17,
                                      height: 1.2,
                                      color: AppColors.darkBlue,
                                    ),
                                    child: IntrinsicHeight(
                                      child: Center(
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: const [
                                                SizedBox(height: 6),
                                                Text('100,000'),
                                                Spacer(),
                                                Text('40,000'),
                                                SizedBox(height: 39),
                                                Text('0'),
                                                SizedBox(height: 33),
                                              ],
                                            ),
                                            const SizedBox(width: 6),
                                            IntrinsicWidth(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.stretch,
                                                children: [
                                                  Assets
                                                      .images.props.slide02Chart
                                                      .image(),
                                                  SizedBox(
                                                    height: 30,
                                                    child: Row(
                                                      children: const [
                                                        SizedBox(width: 30),
                                                        Text('1900'),
                                                        Spacer(),
                                                        Text('1950'),
                                                        Spacer(),
                                                        Text('2000'),
                                                        Spacer(),
                                                        Text('2050'),
                                                        SizedBox(width: 37),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 170),
                              ],
                            ),
                            Positioned(
                              bottom: 390,
                              left: 210,
                              child: FadeTransition(
                                opacity: chartExtraOpacity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      l10n.commercialWhalingPeak,
                                      style: const TextStyle(
                                        fontFamily: FontFamily.poppins,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        height: 1.2,
                                        color: AppColors.darkBlue,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    const DecoratedBox(
                                      decoration: BoxDecoration(
                                        border: Border(
                                          top: BorderSide(
                                            color: AppColors.darkBlue,
                                            width: 2,
                                          ),
                                          left: BorderSide(
                                            color: AppColors.darkBlue,
                                            width: 2,
                                          ),
                                          right: BorderSide(
                                            color: AppColors.darkBlue,
                                            width: 2,
                                          ),
                                        ),
                                      ),
                                      child: SizedBox(
                                        height: 6,
                                        width: 80,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 205,
                              left: 210 + 46 * 2.12,
                              child: FadeTransition(
                                opacity: chartExtraOpacity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      l10n.nearExtinction,
                                      style: const TextStyle(
                                        fontFamily: FontFamily.poppins,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        height: 1.2,
                                        color: AppColors.darkBlue,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    const Line(
                                      color: AppColors.darkBlue,
                                      axis: Axis.vertical,
                                      size: Size(2, 192),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 458,
            top: 217,
            child: FadeTransition(
              opacity: circleOpacity,
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.lightBlue20,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: Assets.images.props.slide02Circle.image(),
                ),
              ),
            ),
          ),
          Positioned(
            left: 600,
            top: 275,
            child: FadeTransition(
              opacity: twoLeggedOpacity,
              child: Transform.rotate(
                angle: -pi / 10,
                child: Text(
                  l10n.twoLeggedCreatures,
                  style: const TextStyle(
                    fontFamily: FontFamily.quotesScript,
                    fontSize: 35,
                    height: 1.1,
                    color: AppColors.lightBlue,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 682,
            top: 348,
            child: Assets.images.props.slide02Arrow
                .image(opacity: twoLeggedOpacity),
          ),
          Positioned(
            left: 365,
            top: 559,
            child: Assets.images.props.slide02BigWhale
                .image(opacity: bigWhaleOpacity),
          ),
          Positioned(
            left: 304.5,
            top: 373.5,
            child: Assets.images.props.slide02SmallWhale
                .image(opacity: smallWhaleOpacity),
          ),
          Positioned(
            left: 646,
            top: 660,
            child: Assets.images.props.slide02BigWhaleEffects
                .image(opacity: whalesEffectsOpacity),
          ),
          Positioned(
            left: 440.5,
            top: 296.5,
            child: Assets.images.props.slide02SmallWhaleEffects
                .image(opacity: whalesEffectsOpacity),
          ),
        ];
      },
    );
  }
}
