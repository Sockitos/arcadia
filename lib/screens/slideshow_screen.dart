import 'dart:async';
import 'dart:math';

import 'package:arcadia_app/data/co2_emissions.dart';
import 'package:arcadia_app/data/sources.dart';
import 'package:arcadia_app/gen/gen.dart';
import 'package:arcadia_app/l10n/app_localizations.dart';
import 'package:arcadia_app/providers.dart';
import 'package:arcadia_app/style/colors.dart';
import 'package:arcadia_app/utils/hooks.dart';
import 'package:arcadia_app/widgets/animated_indicator.dart';
import 'package:arcadia_app/widgets/arrow.dart';
import 'package:arcadia_app/widgets/chat.dart';
import 'package:arcadia_app/widgets/circle_button.dart';
import 'package:arcadia_app/widgets/dropdown_button.dart';
import 'package:arcadia_app/widgets/flip_coin.dart';
import 'package:arcadia_app/widgets/gradient_slider.dart';
import 'package:arcadia_app/widgets/line.dart';
import 'package:arcadia_app/widgets/screen.dart';
import 'package:arcadia_app/widgets/slide.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_arc_text/flutter_arc_text.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:qr_flutter/qr_flutter.dart';

class SlideshowScreen extends ConsumerWidget {
  const SlideshowScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final condition = ref.watch(conditionProvider);
    final logger = ref.watch(loggerProvider);
    return Slideshow(
      slides: [
        Slide(
          background:
              Assets.images.backgrounds.slide01.image(fit: BoxFit.cover).image,
          backgroundDuration: Duration.zero,
          audioPaths: condition == 'A'
              ? {
                  'en': Assets.audios.en.a.slide1,
                  'pt': Assets.audios.pt.a.slide1,
                }
              : {
                  'en': Assets.audios.en.b.slide1,
                  'pt': Assets.audios.pt.b.slide1,
                },
          propsBuilder: (context, controller, isActive) {
            const reverseCurve = Interval(0, 1, curve: Curves.easeOut);
            final circleOpacity = Tween<double>(begin: 0, end: 1).animate(
              CurvedAnimation(
                parent: controller,
                curve: const Interval(0, 0.1, curve: Curves.easeIn),
                reverseCurve: reverseCurve,
              ),
            );
            final mapOpacity = Tween<double>(begin: 0, end: 1).animate(
              CurvedAnimation(
                parent: controller,
                curve: const Interval(0.1, 0.3, curve: Curves.easeIn),
                reverseCurve: reverseCurve,
              ),
            );
            final whaleOpacity = Tween<double>(begin: 0, end: 1).animate(
              CurvedAnimation(
                parent: controller,
                curve: const Interval(0.3, 0.5, curve: Curves.easeIn),
                reverseCurve: reverseCurve,
              ),
            );
            final hereOpacity = Tween<double>(begin: 0, end: 1).animate(
              CurvedAnimation(
                parent: controller,
                curve: const Interval(0.4, 0.6, curve: Curves.easeIn),
                reverseCurve: reverseCurve,
              ),
            );
            final bigwhaleOpacity = Tween<double>(begin: 0, end: 1).animate(
              CurvedAnimation(
                parent: controller,
                curve: const Interval(0.6, 0.8, curve: Curves.easeIn),
                reverseCurve: reverseCurve,
              ),
            );
            final smallwhaleOpacity = Tween<double>(begin: 0, end: 1).animate(
              CurvedAnimation(
                parent: controller,
                curve: const Interval(0.8, 1, curve: Curves.easeIn),
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
                child:
                    Assets.images.props.slide01Map.image(opacity: mapOpacity),
              ),
              if (condition == 'B') ...[
                Positioned(
                  left: 792,
                  top: 522,
                  child: Assets.images.props.slide01Whale
                      .image(opacity: whaleOpacity),
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
              ],
              Positioned(
                left: 1149,
                top: 397,
                child: Assets.images.props.slide01BigWhale
                    .image(opacity: bigwhaleOpacity),
              ),
              Positioned(
                left: 1433,
                top: 598,
                child: Assets.images.props.slide01SmallWhale
                    .image(opacity: smallwhaleOpacity),
              ),
            ];
          },
        ),
        Slide(
          audioPaths: condition == 'A'
              ? {
                  'en': Assets.audios.en.a.slide2,
                  'pt': Assets.audios.pt.a.slide2,
                }
              : {
                  'en': Assets.audios.en.b.slide2,
                  'pt': Assets.audios.pt.b.slide2,
                },
          propsBuilder: (context, controller, isActive) {
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
            final whalesEffectsOpacity =
                Tween<double>(begin: 0, end: 1).animate(
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
                                                const Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
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
                                                        CrossAxisAlignment
                                                            .stretch,
                                                    children: [
                                                      Assets.images.props
                                                          .slide02Chart
                                                          .image(),
                                                      const SizedBox(
                                                        height: 30,
                                                        child: Row(
                                                          children: [
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
        ),
        Slide(
          audioPaths: condition == 'A'
              ? {
                  'en': Assets.audios.en.a.slide3,
                  'pt': Assets.audios.pt.a.slide3,
                }
              : {
                  'en': Assets.audios.en.b.slide3,
                  'pt': Assets.audios.pt.b.slide3,
                },
          propsDuration: const Duration(seconds: 14),
          propsBuilder: (context, controller, isActive) {
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
                curve: const Interval(0, 0.2 * 1 / 14, curve: Curves.easeIn),
                reverseCurve: reverseCurve,
              ),
            );
            final bigWhaleOpacity = Tween<double>(begin: 0, end: 1).animate(
              CurvedAnimation(
                parent: controller,
                curve: const Interval(
                  0.2 * 1 / 14,
                  0.3 * 1 / 14,
                  curve: Curves.easeIn,
                ),
                reverseCurve: reverseCurve,
              ),
            );
            final smallWhaleOpacity = Tween<double>(begin: 0, end: 1).animate(
              CurvedAnimation(
                parent: controller,
                curve: const Interval(
                  0.3 * 1 / 14,
                  0.4 * 1 / 14,
                  curve: Curves.easeIn,
                ),
                reverseCurve: reverseCurve,
              ),
            );
            final whalesEffectsOpacity =
                Tween<double>(begin: 0, end: 1).animate(
              CurvedAnimation(
                parent: controller,
                curve: const Interval(
                  0.4 * 1 / 14,
                  0.5 * 1 / 14,
                  curve: Curves.easeIn,
                ),
                reverseCurve: reverseCurve,
              ),
            );
            final chartCircleOpacity = Tween<double>(begin: 0, end: 1).animate(
              CurvedAnimation(
                parent: controller,
                curve: const Interval(
                  0.5 * 1 / 14,
                  0.6 * 1 / 14,
                  curve: Curves.easeIn,
                ),
                reverseCurve: reverseCurve,
              ),
            );
            final chartOpacity = Tween<double>(begin: 0, end: 1).animate(
              CurvedAnimation(
                parent: controller,
                curve: const Interval(
                  0.6 * 1 / 14,
                  0.8 * 1 / 14,
                  curve: Curves.easeIn,
                ),
                reverseCurve: reverseCurve,
              ),
            );
            final chartExtraOpacity = Tween<double>(begin: 0, end: 1).animate(
              CurvedAnimation(
                parent: controller,
                curve: const Interval(
                  0.8 * 1 / 14,
                  0.9 * 1 / 14,
                  curve: Curves.easeIn,
                ),
                reverseCurve: reverseCurve,
              ),
            );
            final chartInputOpacity = Tween<double>(begin: 0, end: 1).animate(
              CurvedAnimation(
                parent: controller,
                curve: const Interval(
                  13 / 14,
                  13 / 14 + 0.2 * 1 / 14,
                  curve: Curves.easeIn,
                ),
                reverseCurve: reverseCurve,
              ),
            );

            final year = ref.watch(yearProvider);
            final player = useAudioPlayer();
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
                                Padding(
                                  padding: const EdgeInsets.only(left: 47),
                                  child: Column(
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
                                                  const Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
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
                                                          CrossAxisAlignment
                                                              .stretch,
                                                      children: [
                                                        Assets.images.props
                                                            .slide03Chart
                                                            .image(),
                                                        const SizedBox(
                                                          height: 30,
                                                          child: Row(
                                                            children: [
                                                              SizedBox(
                                                                width: 30,
                                                              ),
                                                              Text('1900'),
                                                              Spacer(),
                                                              Text('1950'),
                                                              Spacer(),
                                                              Text('2000'),
                                                              Spacer(),
                                                              Text('2050'),
                                                              SizedBox(
                                                                width: 84,
                                                              ),
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
                                ),
                                Positioned(
                                  bottom: 390,
                                  left: 210,
                                  child: FadeTransition(
                                    opacity: chartExtraOpacity,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                Positioned(
                                  bottom: 205,
                                  left: 210 + 86 * 2.12,
                                  child: FadeTransition(
                                    opacity: chartExtraOpacity,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          l10n.commercialWhalingBan,
                                          style: const TextStyle(
                                            fontFamily: FontFamily.poppins,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            height: 1.2,
                                            color: AppColors.darkBlue,
                                          ),
                                        ),
                                        const Text(
                                          '1986',
                                          style: TextStyle(
                                            fontFamily: FontFamily.poppins,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            height: 1.2,
                                            color: AppColors.red,
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        const Line(
                                          color: AppColors.darkBlue,
                                          axis: Axis.vertical,
                                          size: Size(2, 110),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                if (condition == 'B')
                                  Positioned(
                                    bottom: 205,
                                    left: 210 + 122 * 2.12,
                                    child: FadeTransition(
                                      opacity: chartExtraOpacity,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            l10n.numbersSlowlyRising,
                                            style: const TextStyle(
                                              fontFamily: FontFamily.poppins,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16,
                                              height: 1.2,
                                              color: AppColors.darkBlue,
                                            ),
                                          ),
                                          Text(
                                            l10n.today,
                                            style: const TextStyle(
                                              fontFamily: FontFamily.poppins,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              height: 1.2,
                                              color: AppColors.red,
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          const Line(
                                            color: AppColors.darkBlue,
                                            axis: Axis.vertical,
                                            size: Size(2, 60),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                if (condition == 'B')
                                  if (year != null)
                                    Positioned(
                                      top: 450,
                                      left: 210 + (year - 1900) * 2.12 + 1,
                                      child: FadeTransition(
                                        opacity: chartExtraOpacity,
                                        child: SizedBox.shrink(
                                          child: OverflowBox(
                                            maxHeight: 400,
                                            maxWidth: 400,
                                            child: Column(
                                              children: [
                                                Assets.images.props.slide03Baby
                                                    .image(),
                                                const Line(
                                                  color: AppColors.orange,
                                                  axis: Axis.vertical,
                                                  size: Size(2, 62),
                                                ),
                                                const SizedBox(height: 40),
                                                const Line(
                                                  color: AppColors.orange,
                                                  axis: Axis.vertical,
                                                  size: Size(2, 20),
                                                ),
                                                const SizedBox(height: 10),
                                                Text(
                                                  l10n.youBorn,
                                                  style: const TextStyle(
                                                    fontFamily:
                                                        FontFamily.poppins,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16,
                                                    height: 1.2,
                                                    color: AppColors.darkBlue,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                                const SizedBox(height: 2),
                                                Text(
                                                  year <= 1966
                                                      ? l10n.notLongUntilBan
                                                      : year <= 1986
                                                          ? l10n
                                                              .populationsGrowSoon
                                                          : l10n
                                                              .populationsRecovering,
                                                  style: const TextStyle(
                                                    fontFamily:
                                                        FontFamily.poppins,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 16,
                                                    height: 1.2,
                                                    color: AppColors.darkBlue,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                if (condition == 'B')
                                  Positioned(
                                    top: 20,
                                    right: 100,
                                    child: FadeTransition(
                                      opacity: chartInputOpacity,
                                      child: Column(
                                        children: [
                                          Text(
                                            l10n.whenBorn,
                                            style: const TextStyle(
                                              fontFamily: FontFamily.poppins,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16,
                                              height: 1.2,
                                              color: AppColors.darkBlue,
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          SizedBox(
                                            width: 100,
                                            child: DropdownField<int>(
                                              value: year,
                                              onChanged: (value) async {
                                                if (value != null) {
                                                  logger.logYearSelected(
                                                    value,
                                                    slide: 3,
                                                  );
                                                }
                                                ref
                                                    .read(yearProvider.notifier)
                                                    .state = value ?? year;
                                                if (value != null) {
                                                  await player.setAsset(
                                                    l10n.localeName == 'pt'
                                                        ? 'assets/audios/pt/dates/$value.mp3'
                                                        : 'assets/audios/en/dates/$value.mp3',
                                                  );
                                                  await player.play();
                                                }
                                              },
                                              options: [
                                                for (var i = 2010;
                                                    i >= 1940;
                                                    i--)
                                                  i
                                              ],
                                            ),
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
              if (condition == 'B')
                Positioned(
                  left: 1486.5,
                  top: 272.5,
                  child: AnimatedIndicator(
                    indicator: Assets.images.props.slide03InteractionArrow
                        .image(opacity: chartInputOpacity),
                  ),
                ),
              if (condition == 'B')
                Positioned(
                  left: 1547.5,
                  top: 249.5,
                  child: FadeTransition(
                    opacity: chartInputOpacity,
                    child: Text(
                      l10n.changeDate,
                      style: const TextStyle(
                        fontFamily: FontFamily.poppins,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        height: 1.2,
                        color: AppColors.red,
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
                      child: Assets.images.props.slide03Circle.image(),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 365,
                top: 559,
                child: Assets.images.props.slide03BigWhale
                    .image(opacity: bigWhaleOpacity),
              ),
              Positioned(
                left: 303.5,
                top: 373.5,
                child: Assets.images.props.slide03SmallWhale
                    .image(opacity: smallWhaleOpacity),
              ),
              Positioned(
                left: 440.5,
                top: 296.5,
                child: Assets.images.props.slide03SmallWhaleEffects
                    .image(opacity: whalesEffectsOpacity),
              ),
            ];
          },
        ),
        Slide(
          audioPaths: condition == 'A'
              ? {
                  'en': Assets.audios.en.a.slide4,
                  'pt': Assets.audios.pt.a.slide4,
                }
              : {
                  'en': Assets.audios.en.b.slide4,
                  'pt': Assets.audios.pt.b.slide4,
                },
          propsDuration: l10n.localeName == 'pt'
              ? const Duration(seconds: 39)
              : const Duration(seconds: 45),
          propsBuilder: (context, controller, isActive) {
            final duration = l10n.localeName == 'pt' ? 40 : 46;
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
                curve: Interval(0, 0.2 * 1 / duration, curve: Curves.easeIn),
                reverseCurve: reverseCurve,
              ),
            );
            final circleEnvironmentOpacity =
                Tween<double>(begin: 0, end: 1).animate(
              CurvedAnimation(
                parent: controller,
                curve: Interval(
                  0.2 * 1 / duration,
                  0.4 * 1 / duration,
                  curve: Curves.easeIn,
                ),
                reverseCurve: reverseCurve,
              ),
            );
            final whalesOpacity = Tween<double>(begin: 0, end: 1).animate(
              CurvedAnimation(
                parent: controller,
                curve: Interval(
                  0.4 * 1 / duration,
                  0.6 * 1 / duration,
                  curve: Curves.easeIn,
                ),
                reverseCurve: reverseCurve,
              ),
            );
            final circleInfoOpacity = Tween<double>(begin: 0, end: 1).animate(
              CurvedAnimation(
                parent: controller,
                curve: Interval(
                  0.6 * 1 / duration,
                  0.8 * 1 / duration,
                  curve: Curves.easeIn,
                ),
                reverseCurve: reverseCurve,
              ),
            );
            final chartBackgroundOpacity =
                Tween<double>(begin: 0, end: 1).animate(
              CurvedAnimation(
                parent: controller,
                curve: Interval(
                  17 / duration,
                  17 / duration + 0.2 * 1 / duration,
                  curve: Curves.easeIn,
                ),
                reverseCurve: reverseCurve,
              ),
            );
            final chartTitleOpacity = Tween<double>(begin: 0, end: 1).animate(
              CurvedAnimation(
                parent: controller,
                curve: Interval(
                  17 / duration + 0.2 * 1 / duration,
                  17 / duration + 0.4 * 1 / duration,
                  curve: Curves.easeIn,
                ),
                reverseCurve: reverseCurve,
              ),
            );
            final chartBubblesOpacity = Tween<double>(begin: 0, end: 1).animate(
              CurvedAnimation(
                parent: controller,
                curve: Interval(
                  17 / duration + 0.4 * 1 / duration,
                  17 / duration + 0.6 * 1 / duration,
                  curve: Curves.easeIn,
                ),
                reverseCurve: reverseCurve,
              ),
            );
            final chartInputOpacity = Tween<double>(begin: 0, end: 1).animate(
              CurvedAnimation(
                parent: controller,
                curve: Interval(
                  (duration - 1) / duration,
                  (duration - 1) / duration + 0.2 * 1 / duration,
                  curve: Curves.easeIn,
                ),
                reverseCurve: reverseCurve,
              ),
            );

            final country = ref.watch(countryProvider);
            final tons = co2Emissions[country] ?? 0;
            final player = useAudioPlayer();
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
                left: 704,
                top: 172,
                child: FadeTransition(
                  opacity: circleOpacity,
                  child: DecoratedBox(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.lightBlue20,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(2),
                      child: Assets.images.props.slide04Circle.image(),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 784.5,
                top: 328.5,
                child: Assets.images.props.slide04CircleEnvironment
                    .image(opacity: circleEnvironmentOpacity),
              ),
              Positioned(
                left: 868,
                top: 293,
                child: Assets.images.props.slide04CircleArrows
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
                child: FadeTransition(
                  opacity: whalesOpacity,
                  child: Assets.images.props.slide04BigWhale.image(),
                ),
              ),
              Positioned(
                left: 1050,
                top: 930,
                child: FadeTransition(
                  opacity: circleInfoOpacity,
                  child: ArcText(
                    radius: 150,
                    startAngle: -pi / 10,
                    startAngleAlignment: StartAngleAlignment.center,
                    text: l10n.myPoo,
                    textStyle: TextStyle(
                      fontFamily: FontFamily.quotesScript,
                      fontSize: 30,
                      color: AppColors.lightBlue.withOpacity(0.5),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 1045,
                top: 960,
                child: FadeTransition(
                  opacity: circleInfoOpacity,
                  child: ArcText(
                    radius: 200,
                    startAngle: -pi / 10,
                    startAngleAlignment: StartAngleAlignment.center,
                    placement: Placement.inside,
                    text: l10n.isImportant,
                    textStyle: TextStyle(
                      fontFamily: FontFamily.quotesScript,
                      fontSize: 30,
                      color: AppColors.lightBlue.withOpacity(0.5),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 1070.5,
                top: 807.5,
                child: Assets.images.props.slide04Important
                    .image(opacity: circleInfoOpacity),
              ),
              Positioned(
                left: 1122,
                top: 777,
                child: Assets.images.props.slide04SmallWhale
                    .image(opacity: whalesOpacity),
              ),
              Positioned(
                left: condition == 'B' ? 304 : 384,
                top: condition == 'B' ? 327 : 307,
                child: FadeTransition(
                  opacity: chartBackgroundOpacity,
                  child: DecoratedBox(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.lightBlue15,
                    ),
                    child: SizedBox(
                      height: condition == 'B' ? 570 : 470,
                      width: condition == 'B' ? 570 : 470,
                      child: Center(
                        child: Column(
                          children: [
                            FadeTransition(
                              opacity: chartTitleOpacity,
                              child: Column(
                                crossAxisAlignment: condition == 'B'
                                    ? CrossAxisAlignment.start
                                    : CrossAxisAlignment.center,
                                children: [
                                  if (condition == 'A')
                                    const SizedBox(height: 55)
                                  else
                                    const SizedBox(height: 35),
                                  if (condition == 'B')
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const DecoratedBox(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: AppColors.red,
                                          ),
                                          child: SizedBox(
                                            height: 16,
                                            width: 16,
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Text(
                                          'CO₂ ${l10n.emitted}',
                                          style: const TextStyle(
                                            fontFamily: FontFamily.poppins,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            height: 1.2,
                                            color: AppColors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  const SizedBox(height: 2),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const DecoratedBox(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: AppColors.lightBlue,
                                        ),
                                        child: SizedBox(
                                          height: 16,
                                          width: 16,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        'CO₂ ${l10n.absorbed}',
                                        style: const TextStyle(
                                          fontFamily: FontFamily.poppins,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          height: 1.2,
                                          color: AppColors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    l10n.tonsPerYear,
                                    style: const TextStyle(
                                      fontFamily: FontFamily.poppins,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 17,
                                      height: 1.1,
                                      color: AppColors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            if (condition == 'A') ...[
                              const SizedBox(height: 30),
                              FadeTransition(
                                opacity: chartBubblesOpacity,
                                child: DecoratedBox(
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.lightBlue,
                                  ),
                                  child: SizedBox(
                                    height: 258,
                                    width: 258,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          l10n.phytoplankton,
                                          style: const TextStyle(
                                            fontFamily: FontFamily.poppins,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            height: 1.2,
                                            color: AppColors.black,
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          l10n.worldwide,
                                          style: const TextStyle(
                                            fontFamily: FontFamily.poppins,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16,
                                            height: 1.2,
                                            color: AppColors.black,
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        const Text(
                                          '37,000,000,000',
                                          style: TextStyle(
                                            fontFamily: FontFamily.poppins,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 23,
                                            height: 1.2,
                                            color: AppColors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 400.6,
                top: 438.5,
                child: Assets.images.props.slide04CircleBubbles
                    .image(opacity: chartBubblesOpacity),
              ),
              if (condition == 'B')
                Positioned(
                  left: 680,
                  top: 750,
                  child: FadeTransition(
                    opacity: chartBubblesOpacity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          l10n.equivalent,
                          style: const TextStyle(
                            fontFamily: FontFamily.poppins,
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            height: 1.2,
                            color: AppColors.black,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          l10n.amazonForests,
                          style: const TextStyle(
                            fontFamily: FontFamily.poppins,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            height: 1.2,
                            color: AppColors.black,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              Positioned(
                left: 739.2,
                top: 359.2,
                child: Assets.images.props.slide04ChartArrow
                    .image(opacity: chartBubblesOpacity),
              ),
              if (condition == 'B') ...[
                Positioned(
                  left: 630.5,
                  top: 728,
                  child: Assets.images.props.slide04ChartLine1
                      .image(opacity: chartBubblesOpacity),
                ),
                Positioned(
                  left: 346,
                  top: 717.7,
                  child: FadeTransition(
                    opacity: chartBubblesOpacity,
                    child: DecoratedBox(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.lightBlue,
                      ),
                      child: SizedBox(
                        height: 129,
                        width: 129,
                        child: DefaultTextStyle(
                          style: const TextStyle(
                            fontFamily: FontFamily.poppins,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            height: 1.1,
                            color: AppColors.white,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('425'),
                              Text(l10n.billion),
                              Text(
                                l10n.trees,
                                style: const TextStyle(color: AppColors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 485.3,
                  top: 693.3,
                  child: FadeTransition(
                    opacity: chartBubblesOpacity,
                    child: DecoratedBox(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.lightBlue,
                      ),
                      child: SizedBox(
                        height: 129,
                        width: 129,
                        child: DefaultTextStyle(
                          style: const TextStyle(
                            fontFamily: FontFamily.poppins,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            height: 1.1,
                            color: AppColors.white,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('425'),
                              Text(l10n.billion),
                              Text(
                                l10n.trees,
                                style: const TextStyle(color: AppColors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 418,
                  top: 836.7,
                  child: FadeTransition(
                    opacity: chartBubblesOpacity,
                    child: DecoratedBox(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.lightBlue,
                      ),
                      child: SizedBox(
                        height: 129,
                        width: 129,
                        child: DefaultTextStyle(
                          style: const TextStyle(
                            fontFamily: FontFamily.poppins,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            height: 1.1,
                            color: AppColors.white,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('425'),
                              Text(l10n.billion),
                              Text(
                                l10n.trees,
                                style: const TextStyle(color: AppColors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 555,
                  top: 811.7,
                  child: FadeTransition(
                    opacity: chartBubblesOpacity,
                    child: DecoratedBox(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.lightBlue,
                      ),
                      child: SizedBox(
                        height: 129,
                        width: 129,
                        child: DefaultTextStyle(
                          style: const TextStyle(
                            fontFamily: FontFamily.poppins,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            height: 1.1,
                            color: AppColors.white,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('425'),
                              Text(l10n.billion),
                              Text(
                                l10n.trees,
                                style: const TextStyle(color: AppColors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
              if (condition == 'B')
                Positioned(
                  left: 589,
                  top: 468,
                  child: FadeTransition(
                    opacity: chartBubblesOpacity,
                    child: DecoratedBox(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.lightBlue,
                      ),
                      child: SizedBox(
                        height: 258,
                        width: 258,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              l10n.phytoplankton,
                              style: const TextStyle(
                                fontFamily: FontFamily.poppins,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                height: 1.2,
                                color: AppColors.black,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              l10n.worldwide,
                              style: const TextStyle(
                                fontFamily: FontFamily.poppins,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                height: 1.2,
                                color: AppColors.black,
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              '37,000,000,000',
                              style: TextStyle(
                                fontFamily: FontFamily.poppins,
                                fontWeight: FontWeight.bold,
                                fontSize: 23,
                                height: 1.2,
                                color: AppColors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              if (condition == 'B' && tons > 0) ...[
                Positioned(
                  left: 366.5,
                  top: 561,
                  child: Assets.images.props.slide04ChartLine2
                      .image(opacity: chartBubblesOpacity),
                ),
                Positioned(
                  left: 478,
                  top: 624,
                  child: FadeTransition(
                    opacity: chartInputOpacity,
                    child: SizedBox.shrink(
                      child: OverflowBox(
                        maxHeight: 1000,
                        maxWidth: 1000,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          height: max(
                            sqrt(tons * pow(129, 2) / 37000000000) * 2,
                            5,
                          ),
                          width: max(
                            sqrt(tons * pow(129, 2) / 37000000000) * 2,
                            5,
                          ),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.red,
                            backgroundBlendMode: BlendMode.multiply,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
              if (condition == 'B') ...[
                Positioned(
                  left: 267,
                  top: 431,
                  child: FadeTransition(
                    opacity: chartInputOpacity,
                    child: Column(
                      children: [
                        Text(
                          l10n.chooseCountry,
                          style: const TextStyle(
                            fontFamily: FontFamily.poppins,
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                            height: 1.2,
                            color: AppColors.black,
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: 200,
                          child: DropdownField<String>(
                            value: country,
                            onChanged: (value) async {
                              if (value != null) {
                                logger.logCountrySelected(
                                  value,
                                  slide: 4,
                                );
                              }
                              ref.read(countryProvider.notifier).state =
                                  value ?? country;
                              if (value != null) {
                                await player.setAsset(
                                  l10n.localeName == 'pt'
                                      ? 'assets/audios/pt/countries/${value.replaceAll(' ', '-')}.mp3'
                                      : 'assets/audios/en/countries/${value.replaceAll(' ', '-')}.mp3',
                                );
                                await player.play();
                              }
                            },
                            options: co2Emissions.keys.toList(),
                          ),
                        ),
                        const SizedBox(height: 20),
                        if (tons > 0)
                          Text(
                            NumberFormat.decimalPattern().format(tons),
                            style: const TextStyle(
                              fontFamily: FontFamily.poppins,
                              fontWeight: FontWeight.bold,
                              fontSize: 23,
                              height: 1.2,
                              color: AppColors.red,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 233,
                  top: 367.5,
                  child: AnimatedIndicator(
                    indicator: Assets.images.props.slide04InteractionArrow
                        .image(opacity: chartInputOpacity),
                  ),
                ),
              ],
            ];
          },
        ),
        Slide(
          audioPaths: condition == 'A'
              ? {
                  'en': Assets.audios.en.a.slide5,
                  'pt': Assets.audios.pt.a.slide5,
                }
              : {
                  'en': Assets.audios.en.b.slide5,
                  'pt': Assets.audios.pt.b.slide5,
                },
          background:
              Assets.images.backgrounds.slide05.image(fit: BoxFit.cover).image,
          propsBuilder: (context, controller, isActive) {
            const reverseCurve = Interval(0, 1, curve: Curves.easeOut);

            final whaleOpacity = Tween<double>(begin: 0, end: 1).animate(
              CurvedAnimation(
                parent: controller,
                curve: const Interval(0, 0.1, curve: Curves.easeIn),
                reverseCurve: reverseCurve,
              ),
            );
            final arrowOpacity = Tween<double>(begin: 0, end: 1).animate(
              CurvedAnimation(
                parent: controller,
                curve: const Interval(0.1, 0.2, curve: Curves.easeIn),
                reverseCurve: reverseCurve,
              ),
            );
            final fishOpacity = Tween<double>(begin: 0, end: 1).animate(
              CurvedAnimation(
                parent: controller,
                curve: const Interval(0.2, 0.3, curve: Curves.easeIn),
                reverseCurve: reverseCurve,
              ),
            );
            final cardOpacity = Tween<double>(begin: 0, end: 1).animate(
              CurvedAnimation(
                parent: controller,
                curve: const Interval(0.3, 0.4, curve: Curves.easeIn),
                reverseCurve: reverseCurve,
              ),
            );
            final whaleCardOpacity = Tween<double>(begin: 0, end: 1).animate(
              CurvedAnimation(
                parent: controller,
                curve: const Interval(0.4, 0.5, curve: Curves.easeIn),
                reverseCurve: reverseCurve,
              ),
            );
            final humanOpacity = Tween<double>(begin: 0, end: 1).animate(
              CurvedAnimation(
                parent: controller,
                curve: const Interval(0.45, 0.55, curve: Curves.easeIn),
                reverseCurve: reverseCurve,
              ),
            );
            final dinoOpacity = Tween<double>(begin: 0, end: 1).animate(
              CurvedAnimation(
                parent: controller,
                curve: const Interval(0.5, 0.6, curve: Curves.easeIn),
                reverseCurve: reverseCurve,
              ),
            );
            final sharkOpacity = Tween<double>(begin: 0, end: 1).animate(
              CurvedAnimation(
                parent: controller,
                curve: const Interval(0.55, 0.65, curve: Curves.easeIn),
                reverseCurve: reverseCurve,
              ),
            );
            final busOpacity = Tween<double>(begin: 0, end: 1).animate(
              CurvedAnimation(
                parent: controller,
                curve: const Interval(0.6, 0.7, curve: Curves.easeIn),
                reverseCurve: reverseCurve,
              ),
            );
            final youOpacity = Tween<double>(begin: 0, end: 1).animate(
              CurvedAnimation(
                parent: controller,
                curve: const Interval(0.7, 0.8, curve: Curves.easeIn),
                reverseCurve: reverseCurve,
              ),
            );
            final inputOpacity = Tween<double>(begin: 0, end: 1).animate(
              CurvedAnimation(
                parent: controller,
                curve: const Interval(0.8, 0.9, curve: Curves.easeIn),
                reverseCurve: reverseCurve,
              ),
            );
            final circleOpacity = Tween<double>(begin: 0, end: 1).animate(
              CurvedAnimation(
                parent: controller,
                curve: const Interval(0.9, 1, curve: Curves.easeIn),
                reverseCurve: reverseCurve,
              ),
            );

            final height = ref.watch(heightProvider);
            final ratio = 3000 / height;
            return [
              Positioned(
                left: 303,
                top: 565.5,
                child: Assets.images.props.slide05BigArrow
                    .image(opacity: arrowOpacity),
              ),
              Positioned(
                left: 1063,
                top: 254,
                child: FadeTransition(
                  opacity: cardOpacity,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: AppColors.lightBlue20,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(63),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FadeTransition(
                            opacity: whaleCardOpacity,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Assets.images.props.slide05SmallWhale.image(),
                                const SizedBox(height: 12),
                                const _BarBar(
                                  totalWidth: 314.2,
                                  filledWidth: 314.2,
                                ),
                                Row(
                                  children: [
                                    const SizedBox(width: 8),
                                    Text(
                                      l10n.blueWhale,
                                      style: const TextStyle(
                                        fontFamily: FontFamily.poppins,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.darkBlue,
                                        fontSize: 15,
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                    const Text(
                                      '30m',
                                      style: TextStyle(
                                        fontFamily: FontFamily.poppins,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.lightBlue,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 5),
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              FadeTransition(
                                opacity: humanOpacity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 7),
                                      child: Text(
                                        l10n.human,
                                        style: const TextStyle(
                                          fontFamily: FontFamily.poppins,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.darkBlue,
                                          fontSize: 15,
                                          height: 1.2,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 7),
                                      child: Text(
                                        '${(height / 100).toStringAsFixed(2)}m',
                                        style: const TextStyle(
                                          fontFamily: FontFamily.poppins,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.lightBlue,
                                          fontSize: 15,
                                          height: 1.2,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    _BarBar(
                                      totalWidth: 314.2,
                                      filledWidth: height * 314.2 / 3000,
                                      invert: true,
                                    ),
                                    const SizedBox(height: 15),
                                    Row(
                                      children: [
                                        Assets.images.props.slide05People
                                            .image(),
                                        const SizedBox(width: 5),
                                        const RotatedBox(
                                          quarterTurns: -1,
                                          child: _BarBar(
                                            totalWidth: 18,
                                            filledWidth: 18,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              FadeTransition(
                                opacity: dinoOpacity,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Assets.images.props.slide05Dinossaur
                                        .image(),
                                    const SizedBox(height: 12),
                                    const _BarBar(
                                      totalWidth: 314.2,
                                      filledWidth: 248,
                                    ),
                                    Row(
                                      children: [
                                        const SizedBox(width: 8),
                                        Text(
                                          l10n.brachiosaurus,
                                          style: const TextStyle(
                                            fontFamily: FontFamily.poppins,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.darkBlue,
                                            fontSize: 15,
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        const Text(
                                          '23m',
                                          style: TextStyle(
                                            fontFamily: FontFamily.poppins,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.lightBlue,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                          FadeTransition(
                            opacity: sharkOpacity,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Assets.images.props.slide05Shark.image(),
                                const SizedBox(height: 6),
                                const _BarBar(
                                  totalWidth: 314.2,
                                  filledWidth: 66,
                                ),
                                Row(
                                  children: [
                                    const SizedBox(width: 8),
                                    Text(
                                      l10n.greatWhiteShake,
                                      style: const TextStyle(
                                        fontFamily: FontFamily.poppins,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.darkBlue,
                                        fontSize: 15,
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                    const Text(
                                      '6.4m',
                                      style: TextStyle(
                                        fontFamily: FontFamily.poppins,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.lightBlue,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 19),
                          FadeTransition(
                            opacity: busOpacity,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Assets.images.props.slide05Bus.image(),
                                const SizedBox(height: 6),
                                const _BarBar(
                                  totalWidth: 314.2,
                                  filledWidth: 126.3,
                                ),
                                Row(
                                  children: [
                                    const SizedBox(width: 8),
                                    Text(
                                      l10n.bus,
                                      style: const TextStyle(
                                        fontFamily: FontFamily.poppins,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.darkBlue,
                                        fontSize: 15,
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                    const Text(
                                      '12m',
                                      style: TextStyle(
                                        fontFamily: FontFamily.poppins,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.lightBlue,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 159.8,
                top: 332,
                child: Assets.images.props.slide05BigWhale
                    .image(opacity: whaleOpacity),
              ),
              Positioned(
                left: 534,
                top: 584,
                child: FadeTransition(
                  opacity: arrowOpacity,
                  child: Transform.rotate(
                    angle: -0.060455555556 * pi,
                    child: const Text(
                      '30m',
                      style: TextStyle(
                        fontFamily: FontFamily.quotesScript,
                        color: AppColors.red,
                        fontSize: 47,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 873,
                top: 752.5,
                child:
                    Assets.images.props.slide05Fish.image(opacity: fishOpacity),
              ),
              Positioned(
                left: 905,
                top: 690,
                child: FadeTransition(
                  opacity: fishOpacity,
                  child: Transform.rotate(
                    angle: -1.9284722222 * pi,
                    child: const Text(
                      '!!!',
                      style: TextStyle(
                        fontFamily: FontFamily.quotesScript,
                        color: AppColors.lightBlue,
                        fontSize: 50,
                      ),
                    ),
                  ),
                ),
              ),
              if (condition == 'B') ...[
                Positioned(
                  left: 1460,
                  top: 455,
                  child: FadeTransition(
                    opacity: youOpacity,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.darkBlue,
                          width: 1.6,
                        ),
                      ),
                      child: SizedBox(
                        width: 55,
                        height: 55,
                        child: Center(
                          child: Text(
                            l10n.you,
                            style: const TextStyle(
                              fontFamily: FontFamily.poppins,
                              fontWeight: FontWeight.bold,
                              color: AppColors.darkBlue,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 1455,
                  top: 490,
                  child: FadeTransition(
                    opacity: youOpacity,
                    child: Transform.rotate(
                      angle: pi / 3,
                      child: const Line(
                        color: AppColors.darkBlue,
                        axis: Axis.vertical,
                        size: Size(2, 30),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 1526,
                  top: 490,
                  child: Assets.images.props.slide05Curve
                      .image(opacity: circleOpacity),
                ),
                Positioned(
                  left: 1521,
                  top: 535.5,
                  child: FadeTransition(
                    opacity: circleOpacity,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.white,
                        border: Border.all(
                          color: AppColors.darkBlue,
                          width: 2,
                        ),
                      ),
                      child: SizedBox(
                        width: 176,
                        height: 176,
                        child: DefaultTextStyle(
                          style: const TextStyle(
                            fontFamily: FontFamily.poppins,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            height: 1.2,
                            color: AppColors.black,
                          ),
                          textAlign: TextAlign.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(l10n.baltazarHas),
                              Text(
                                ratio.toStringAsFixed(1),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 23,
                                  height: 1,
                                  color: AppColors.lightBlue,
                                ),
                                strutStyle: const StrutStyle(
                                  fontSize: 23,
                                  height: 1,
                                  forceStrutHeight: true,
                                ),
                              ),
                              Text(l10n.timesLength),
                              const SizedBox(height: 4),
                              Text(
                                l10n.dontMentionWeight,
                                style: const TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 1532,
                  top: 387,
                  child: FadeTransition(
                    opacity: inputOpacity,
                    child: Column(
                      children: [
                        Text(
                          l10n.whatsYourHeight,
                          style: const TextStyle(
                            fontFamily: FontFamily.poppins,
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                            height: 1.2,
                            color: AppColors.darkBlue,
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: 110,
                          child: DropdownField<int>(
                            value: height,
                            onChanged: (value) {
                              if (value != null) {
                                logger.logHeightSelected(
                                  value,
                                  slide: 5,
                                );
                              }
                              ref.read(heightProvider.notifier).state =
                                  value ?? height;
                            },
                            options: [for (var i = 100; i <= 240; i += 5) i],
                            optionToString: (height) =>
                                '${(height / 100).toStringAsFixed(2)}m',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 1675,
                  top: 331,
                  child: AnimatedIndicator(
                    indicator: Assets.images.props.slide05InteractionArrow
                        .image(opacity: inputOpacity),
                  ),
                ),
              ],
            ];
          },
        ),
        Slide(
          audioPaths: condition == 'A'
              ? {
                  'en': Assets.audios.en.a.slide6,
                  'pt': Assets.audios.pt.a.slide6,
                }
              : {
                  'en': Assets.audios.en.b.slide6,
                  'pt': Assets.audios.pt.b.slide6,
                },
          propsBuilder: (context, controller, isActive) {
            const reverseCurve = Interval(0, 1, curve: Curves.easeOut);
            final whaleOpacity = Tween<double>(begin: 0, end: 1).animate(
              CurvedAnimation(
                parent: controller,
                curve: const Interval(0, 0.1, curve: Curves.easeIn),
                reverseCurve: reverseCurve,
              ),
            );
            final co2Opacity = Tween<double>(begin: 0, end: 1).animate(
              CurvedAnimation(
                parent: controller,
                curve: const Interval(0.1, 0.2, curve: Curves.easeIn),
                reverseCurve: reverseCurve,
              ),
            );
            final cardOpacity = Tween<double>(begin: 0, end: 1).animate(
              CurvedAnimation(
                parent: controller,
                curve: const Interval(0.2, 0.3, curve: Curves.easeIn),
                reverseCurve: reverseCurve,
              ),
            );
            final titleOpacity = Tween<double>(begin: 0, end: 1).animate(
              CurvedAnimation(
                parent: controller,
                curve: const Interval(0.3, 0.4, curve: Curves.easeIn),
                reverseCurve: reverseCurve,
              ),
            );
            final graphOpacity = Tween<double>(begin: 0, end: 1).animate(
              CurvedAnimation(
                parent: controller,
                curve: const Interval(0.4, 0.5, curve: Curves.easeIn),
                reverseCurve: reverseCurve,
              ),
            );
            final whalesOpacity = Tween<double>(begin: 0, end: 1).animate(
              CurvedAnimation(
                parent: controller,
                curve: const Interval(0.5, 0.6, curve: Curves.easeIn),
                reverseCurve: reverseCurve,
              ),
            );
            final treesOpacity = Tween<double>(begin: 0, end: 1).animate(
              CurvedAnimation(
                parent: controller,
                curve: const Interval(0.6, 0.7, curve: Curves.easeIn),
                reverseCurve: reverseCurve,
              ),
            );
            final fishOpacity = Tween<double>(begin: 0, end: 1).animate(
              CurvedAnimation(
                parent: controller,
                curve: const Interval(0.7, 0.8, curve: Curves.easeIn),
                reverseCurve: reverseCurve,
              ),
            );

            return [
              Positioned(
                left: 532.7,
                top: 85.1,
                child: Assets.images.props.slide06TopLeftArrow
                    .image(opacity: co2Opacity),
              ),
              Positioned(
                left: 517.2,
                top: 57.5,
                child: FadeTransition(
                  opacity: co2Opacity,
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        fontFamily: FontFamily.quotesScript,
                        color: AppColors.red,
                        fontSize: 32,
                      ),
                      children: [
                        const TextSpan(text: 'CO'),
                        WidgetSpan(
                          child: Transform.translate(
                            offset: const Offset(0, 2),
                            child: const Text(
                              '2',
                              style: TextStyle(
                                fontFamily: FontFamily.quotesScript,
                                color: AppColors.red,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 1503.3,
                top: 46.9,
                child: Assets.images.props.slide06TopRightTopArrow
                    .image(opacity: co2Opacity),
              ),
              Positioned(
                left: 1524.9,
                top: 10,
                child: FadeTransition(
                  opacity: co2Opacity,
                  child: Transform.rotate(
                    angle: -0.041283333333 * pi,
                    child: RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          fontFamily: FontFamily.quotesScript,
                          color: AppColors.red,
                          fontSize: 32,
                        ),
                        children: [
                          const TextSpan(text: 'CO'),
                          WidgetSpan(
                            child: Transform.translate(
                              offset: const Offset(0, 2),
                              child: const Text(
                                '2',
                                style: TextStyle(
                                  fontFamily: FontFamily.quotesScript,
                                  color: AppColors.red,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 1428.3,
                top: 105.3,
                child: Assets.images.props.slide06TopRightBottomArrow
                    .image(opacity: co2Opacity),
              ),
              Positioned(
                left: 1387.1,
                top: 120.8,
                child: FadeTransition(
                  opacity: co2Opacity,
                  child: Transform.rotate(
                    angle: -1.9744888889 * pi,
                    child: RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          fontFamily: FontFamily.quotesScript,
                          color: AppColors.red,
                          fontSize: 32,
                        ),
                        children: [
                          const TextSpan(text: 'CO'),
                          WidgetSpan(
                            child: Transform.translate(
                              offset: const Offset(0, 2),
                              child: const Text(
                                '2',
                                style: TextStyle(
                                  fontFamily: FontFamily.quotesScript,
                                  color: AppColors.red,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 981,
                top: 294,
                child: FadeTransition(
                  opacity: cardOpacity,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: AppColors.lightBlue20,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: SizedBox(
                      width: condition == 'B' ? 756 : 620,
                      height: 580,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(40, 50, 40, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 540,
                                  child: Center(
                                    child: FadeTransition(
                                      opacity: titleOpacity,
                                      child: Column(
                                        children: [
                                          Text(
                                            l10n.carbonDeepWhenTheyDie,
                                            style: const TextStyle(
                                              fontFamily: FontFamily.poppins,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.darkBlue,
                                              fontSize: 21,
                                              height: 1.2,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          Text(
                                            l10n.tonsPerYear,
                                            style: const TextStyle(
                                              fontFamily: FontFamily.poppins,
                                              color: AppColors.darkBlue,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 17,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                if (condition == 'B') const Spacer(),
                              ],
                            ),
                            Expanded(
                              child: Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 80),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 540,
                                          child: FadeTransition(
                                            opacity: graphOpacity,
                                            child: const Stack(
                                              alignment: Alignment.topCenter,
                                              children: [
                                                DecoratedBox(
                                                  decoration: BoxDecoration(
                                                    color: AppColors.lightBlue,
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: SizedBox(
                                                    width: 278,
                                                    height: 278,
                                                  ),
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    DecoratedBox(
                                                      decoration: BoxDecoration(
                                                        color:
                                                            AppColors.lightBlue,
                                                        shape: BoxShape.circle,
                                                        backgroundBlendMode:
                                                            BlendMode.multiply,
                                                      ),
                                                      child: SizedBox(
                                                        width: 121,
                                                        height: 121,
                                                        child: Center(
                                                          child: Text(
                                                            '30,000',
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  FontFamily
                                                                      .poppins,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: AppColors
                                                                  .white,
                                                              fontSize: 21,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(height: 48),
                                                    Text(
                                                      '160,000',
                                                      style: TextStyle(
                                                        fontFamily:
                                                            FontFamily.poppins,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: AppColors.white,
                                                        fontSize: 28,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        if (condition == 'B')
                                          Expanded(
                                            child: FadeTransition(
                                              opacity: graphOpacity,
                                              child: Row(
                                                children: [
                                                  const Spacer(),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Assets.images.props
                                                          .slide07FlipArrow
                                                          .image(),
                                                      const SizedBox(height: 4),
                                                      Text(
                                                        l10n.touchCircleToFlipN,
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: const TextStyle(
                                                          fontFamily: FontFamily
                                                              .poppins,
                                                          color: AppColors.red,
                                                          fontSize: 17,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            const SizedBox(height: 115),
                                            FadeTransition(
                                              opacity: whalesOpacity,
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Assets.images.props
                                                      .slide06SmallWhale
                                                      .image(),
                                                  const SizedBox(height: 9),
                                                  Text(
                                                    l10n.whalesToday,
                                                    textAlign: TextAlign.center,
                                                    style: const TextStyle(
                                                      fontFamily:
                                                          FontFamily.poppins,
                                                      color: AppColors.darkBlue,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 17,
                                                      height: 1.1,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(height: 48),
                                            FadeTransition(
                                              opacity: whalesOpacity,
                                              child: Column(
                                                children: [
                                                  Assets.images.props
                                                      .slide06GroupSmallWhales
                                                      .image(),
                                                  const SizedBox(height: 9),
                                                  Text(
                                                    l10n.ifWhalesRecovered,
                                                    textAlign: TextAlign.center,
                                                    style: const TextStyle(
                                                      fontFamily:
                                                          FontFamily.poppins,
                                                      color: AppColors.darkBlue,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 17,
                                                      height: 1.1,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(width: 278),
                                      if (condition == 'B')
                                        Expanded(
                                          flex: 2,
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  const SizedBox(height: 58),
                                                  FadeTransition(
                                                    opacity: treesOpacity,
                                                    child: Text(
                                                      l10n.equivalentToCO2,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: const TextStyle(
                                                        fontFamily:
                                                            FontFamily.poppins,
                                                        color:
                                                            AppColors.darkBlue,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 17,
                                                        height: 1.1,
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(height: 20),
                                                  FadeTransition(
                                                    opacity: treesOpacity,
                                                    child: _InfoCoin6(
                                                      id: 'tree',
                                                      shouldHint: true,
                                                      image: Assets.images.props
                                                          .slide06Tree
                                                          .image(),
                                                      title: '1,378,380',
                                                      text: l10n.trees,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 20),
                                                  FadeTransition(
                                                    opacity: treesOpacity,
                                                    child: _InfoCoin6(
                                                      id: 'trees',
                                                      image: Assets.images.props
                                                          .slide06GroupTrees
                                                          .image(),
                                                      title: '7,351,400',
                                                      text: l10n.trees,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const Spacer(),
                                            ],
                                          ),
                                        )
                                      else
                                        const Spacer(),
                                    ],
                                  ),
                                  Positioned(
                                    left: 110,
                                    top: 153,
                                    child: FadeTransition(
                                      opacity: whalesOpacity,
                                      child: const Line(
                                        size: Size(110, 2),
                                        color: AppColors.darkBlue,
                                        axis: Axis.horizontal,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 110,
                                    top: 283,
                                    child: FadeTransition(
                                      opacity: whalesOpacity,
                                      child: const Line(
                                        size: Size(52, 2),
                                        color: AppColors.darkBlue,
                                        axis: Axis.horizontal,
                                      ),
                                    ),
                                  ),
                                  if (condition == 'B') ...[
                                    Positioned(
                                      left: 304,
                                      top: 178,
                                      child: FadeTransition(
                                        opacity: treesOpacity,
                                        child: const Line(
                                          size: Size(110, 2),
                                          color: AppColors.darkGreen,
                                          axis: Axis.horizontal,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 330,
                                      top: 330,
                                      child: FadeTransition(
                                        opacity: treesOpacity,
                                        child: const Line(
                                          size: Size(84, 2),
                                          color: AppColors.darkGreen,
                                          axis: Axis.horizontal,
                                        ),
                                      ),
                                    ),
                                  ],
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 159.8,
                top: 332,
                child: Assets.images.props.slide05BigWhale
                    .image(opacity: whaleOpacity),
              ),
              Positioned(
                left: 539,
                top: 315,
                child: Assets.images.props.slide06WhaleTopArrow
                    .image(opacity: co2Opacity),
              ),
              Positioned(
                left: 482,
                top: 308,
                child: FadeTransition(
                  opacity: co2Opacity,
                  child: Transform.rotate(
                    angle: -0.11477222222 * pi,
                    child: RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          fontFamily: FontFamily.quotesScript,
                          color: AppColors.red,
                          fontSize: 32,
                        ),
                        children: [
                          const TextSpan(text: 'CO'),
                          WidgetSpan(
                            child: Transform.translate(
                              offset: const Offset(0, 2),
                              child: const Text(
                                '2',
                                style: TextStyle(
                                  fontFamily: FontFamily.quotesScript,
                                  color: AppColors.red,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 847,
                top: 519.9,
                child: Assets.images.props.slide06WhaleBottomArrow
                    .image(opacity: co2Opacity),
              ),
              Positioned(
                left: 875,
                top: 554,
                child: FadeTransition(
                  opacity: co2Opacity,
                  child: Transform.rotate(
                    angle: -0.060455555556 * pi,
                    child: RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          fontFamily: FontFamily.quotesScript,
                          color: AppColors.red,
                          fontSize: 32,
                        ),
                        children: [
                          const TextSpan(text: 'CO'),
                          WidgetSpan(
                            child: Transform.translate(
                              offset: const Offset(0, 2),
                              child: const Text(
                                '2',
                                style: TextStyle(
                                  fontFamily: FontFamily.quotesScript,
                                  color: AppColors.red,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 872.6,
                top: 763.5,
                child:
                    Assets.images.props.slide05Fish.image(opacity: fishOpacity),
              ),
              Positioned(
                left: 866.3,
                top: 735.3,
                child:
                    Assets.images.props.slide06Tiny.image(opacity: fishOpacity),
              ),
              Positioned(
                left: 834,
                top: 1040,
                child: FadeTransition(
                  opacity: fishOpacity,
                  child: ArcText(
                    radius: 300,
                    startAngle: -pi / 20,
                    text: l10n.hadNoIdea,
                    textStyle: const TextStyle(
                      fontFamily: FontFamily.quotesScript,
                      color: AppColors.lightBlue,
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
            ];
          },
        ),
        Slide(
          audioPaths: condition == 'A'
              ? {
                  'en': Assets.audios.en.a.slide7,
                  'pt': Assets.audios.pt.a.slide7,
                }
              : {
                  'en': Assets.audios.en.b.slide7,
                  'pt': Assets.audios.pt.b.slide7,
                },
          propsBuilder: (context, controller, isActive) {
            const reverseCurve = Interval(0, 1, curve: Curves.easeOut);
            final whaleOpacity = Tween<double>(begin: 0, end: 1).animate(
              CurvedAnimation(
                parent: controller,
                curve: const Interval(0, 0.2 * 1 / 18, curve: Curves.easeIn),
                reverseCurve: reverseCurve,
              ),
            );
            final backgroundCircleOpacity =
                Tween<double>(begin: 0, end: 1).animate(
              CurvedAnimation(
                parent: controller,
                curve: const Interval(0.2, 0.3, curve: Curves.easeIn),
                reverseCurve: reverseCurve,
              ),
            );
            final titleOpacity = Tween<double>(begin: 0, end: 1).animate(
              CurvedAnimation(
                parent: controller,
                curve: const Interval(0.3, 0.4, curve: Curves.easeIn),
                reverseCurve: reverseCurve,
              ),
            );
            final tipOpacity = Tween<double>(begin: 0, end: 1).animate(
              CurvedAnimation(
                parent: controller,
                curve: const Interval(0.3, 0.4, curve: Curves.easeIn),
                reverseCurve: reverseCurve,
              ),
            );
            final circle1Opacity = Tween<double>(begin: 0, end: 1).animate(
              CurvedAnimation(
                parent: controller,
                curve: const Interval(0.4, 0.5, curve: Curves.easeIn),
                reverseCurve: reverseCurve,
              ),
            );
            final circle2Opacity = Tween<double>(begin: 0, end: 1).animate(
              CurvedAnimation(
                parent: controller,
                curve: const Interval(0.5, 0.6, curve: Curves.easeIn),
                reverseCurve: reverseCurve,
              ),
            );
            final circle3Opacity = Tween<double>(begin: 0, end: 1).animate(
              CurvedAnimation(
                parent: controller,
                curve: const Interval(0.6, 0.7, curve: Curves.easeIn),
                reverseCurve: reverseCurve,
              ),
            );
            final circle4Opacity = Tween<double>(begin: 0, end: 1).animate(
              CurvedAnimation(
                parent: controller,
                curve: const Interval(0.7, 0.8, curve: Curves.easeIn),
                reverseCurve: reverseCurve,
              ),
            );
            final circle5Opacity = Tween<double>(begin: 0, end: 1).animate(
              CurvedAnimation(
                parent: controller,
                curve: const Interval(0.8, 0.9, curve: Curves.easeIn),
                reverseCurve: reverseCurve,
              ),
            );

            return [
              Positioned(
                top: 105,
                left: 0,
                right: 0,
                child: FadeTransition(
                  opacity: backgroundCircleOpacity,
                  child: const DecoratedBox(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.lightBlue20,
                    ),
                    child: SizedBox(
                      width: 796,
                      height: 796,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 1065,
                left: 0,
                right: 0,
                child: FadeTransition(
                  opacity: titleOpacity,
                  child: ArcText(
                    radius: 800,
                    text: l10n.doOurPart,
                    startAngleAlignment: StartAngleAlignment.center,
                    textStyle: const TextStyle(
                      fontFamily: FontFamily.quotesScript,
                      color: AppColors.blue,
                      fontSize: 44,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 210,
                left: 0,
                right: 0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (condition == 'B')
                      const SizedBox(height: 60)
                    else
                      const SizedBox(height: 80),
                    FadeTransition(
                      opacity: tipOpacity,
                      child: Assets.images.props.slide07FlipArrow.image(),
                    ),
                    const SizedBox(height: 4),
                    FadeTransition(
                      opacity: tipOpacity,
                      child: Text(
                        condition == 'B'
                            ? l10n.flipAlreadyDo
                            : l10n.touchCircleToFlip,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontFamily: FontFamily.poppins,
                          color: AppColors.red,
                          fontSize: 17,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FadeTransition(
                          opacity: circle1Opacity,
                          child: _InfoCoin7(
                            id: 'food_waste',
                            shouldHint: true,
                            image: Assets.images.props.slide07Food1.image(),
                            title: l10n.ourPart1Label,
                            text: l10n.ourPart1Text,
                          ),
                        ),
                        const SizedBox(width: 70),
                        FadeTransition(
                          opacity: circle2Opacity,
                          child: _InfoCoin7(
                            id: 'plant_diet',
                            image: Assets.images.props.slide07Food2.image(),
                            title: l10n.ourPart2Label,
                            text: l10n.ourPart2Text,
                          ),
                        ),
                        const SizedBox(width: 70),
                        FadeTransition(
                          opacity: circle3Opacity,
                          child: _InfoCoin7(
                            id: 'home_efficient',
                            image: Assets.images.props.slide07House.image(),
                            title: l10n.ourPart3Label,
                            text: l10n.ourPart3Text,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FadeTransition(
                          opacity: circle4Opacity,
                          child: _InfoCoin7(
                            id: 'transportation',
                            image: Assets.images.props.slide07Vehicles.image(),
                            title: l10n.ourPart4Label,
                            text: l10n.ourPart4Text,
                          ),
                        ),
                        const SizedBox(width: 70),
                        FadeTransition(
                          opacity: circle5Opacity,
                          child: _InfoCoin7(
                            id: 'buy_less',
                            image: Assets.images.props.slide07Stuff.image(),
                            title: l10n.ourPart5Label,
                            text: l10n.ourPart5Text,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                left: 1461.5,
                top: 409,
                child: Assets.images.props.slide07Whale
                    .image(opacity: whaleOpacity),
              ),
            ];
          },
        ),
        Slide(
          background:
              Assets.images.backgrounds.slide08.image(fit: BoxFit.cover).image,
          audioPaths: condition == 'A'
              ? {
                  'en': Assets.audios.en.a.slide8,
                  'pt': Assets.audios.pt.a.slide8,
                }
              : {
                  'en': Assets.audios.en.b.slide8,
                  'pt': Assets.audios.pt.b.slide8,
                },
          propsBuilder: (context, controller, isActive) {
            const reverseCurve = Interval(0, 1, curve: Curves.easeOut);
            final whaleOpacity = Tween<double>(begin: 0, end: 1).animate(
              CurvedAnimation(
                parent: controller,
                curve: const Interval(0, 0.2, curve: Curves.easeIn),
                reverseCurve: reverseCurve,
              ),
            );
            final foodOpacity = Tween<double>(begin: 0, end: 1).animate(
              CurvedAnimation(
                parent: controller,
                curve: const Interval(0.2, 0.4, curve: Curves.easeIn),
                reverseCurve: reverseCurve,
              ),
            );
            final zoomOpacity = Tween<double>(begin: 0, end: 1).animate(
              CurvedAnimation(
                parent: controller,
                curve: const Interval(0.4, 0.6, curve: Curves.easeIn),
                reverseCurve: reverseCurve,
              ),
            );
            final textOpacity = Tween<double>(begin: 0, end: 1).animate(
              CurvedAnimation(
                parent: controller,
                curve: const Interval(0.6, 0.8, curve: Curves.easeIn),
                reverseCurve: reverseCurve,
              ),
            );

            return [
              Positioned(
                left: 798.5,
                top: 225,
                child:
                    Assets.images.props.slide08Food.image(opacity: foodOpacity),
              ),
              Positioned(
                left: 210,
                top: 493.5,
                child: Assets.images.props.slide08Whale
                    .image(opacity: whaleOpacity),
              ),
              Positioned(
                left: 1091,
                top: 539,
                child: Assets.images.props.slide08FoodZoom
                    .image(opacity: zoomOpacity),
              ),
              Positioned(
                left: 1180,
                top: 560,
                child: FadeTransition(
                  opacity: textOpacity,
                  child: ArcText(
                    radius: 250,
                    startAngle: 160 * pi / 180,
                    startAngleAlignment: StartAngleAlignment.center,
                    placement: Placement.inside,
                    direction: Direction.counterClockwise,
                    text: AppLocalizations.of(context)!.krill,
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
        ),
        Slide(
          audioPaths: condition == 'A'
              ? {
                  'en': Assets.audios.en.a.slide9,
                  'pt': Assets.audios.pt.a.slide9,
                }
              : {
                  'en': Assets.audios.en.b.slide9,
                  'pt': Assets.audios.pt.b.slide9,
                },
          propsBuilder: (context, controller, isActive) {
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
                child:
                    Assets.images.props.slide09Food.image(opacity: foodOpacity),
              ),
              Positioned(
                left: 210,
                top: 493.5,
                child: Assets.images.props.slide09Whale
                    .image(opacity: whaleOpacity),
              ),
              Positioned(
                left: 1141,
                top: 335,
                child: Assets.images.props.slide09FoodZoom
                    .image(opacity: zoomOpacity),
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
        ),
        Slide(
          audioPaths: condition == 'A'
              ? {
                  'en': Assets.audios.en.a.slide10,
                  'pt': Assets.audios.pt.a.slide10,
                }
              : {
                  'en': Assets.audios.en.b.slide10,
                  'pt': Assets.audios.pt.b.slide10,
                },
          propsBuilder: (context, controller, isActive) {
            const reverseCurve = Interval(0, 1, curve: Curves.easeOut);
            final whalesOpacity = Tween<double>(begin: 0, end: 1).animate(
              CurvedAnimation(
                parent: controller,
                curve: const Interval(0, 0.1, curve: Curves.easeIn),
                reverseCurve: reverseCurve,
              ),
            );
            final trashOpacity = Tween<double>(begin: 0, end: 1).animate(
              CurvedAnimation(
                parent: controller,
                curve: const Interval(0.1, 0.2, curve: Curves.easeIn),
                reverseCurve: reverseCurve,
              ),
            );
            final zoomOpacity = Tween<double>(begin: 0, end: 1).animate(
              CurvedAnimation(
                parent: controller,
                curve: const Interval(0.2, 0.3, curve: Curves.easeIn),
                reverseCurve: reverseCurve,
              ),
            );
            final textOpacity = Tween<double>(begin: 0, end: 1).animate(
              CurvedAnimation(
                parent: controller,
                curve: const Interval(0.3, 0.4, curve: Curves.easeIn),
                reverseCurve: reverseCurve,
              ),
            );
            final arrowOpacity = Tween<double>(begin: 0, end: 1).animate(
              CurvedAnimation(
                parent: controller,
                curve: const Interval(0.4, 0.5, curve: Curves.easeIn),
                reverseCurve: reverseCurve,
              ),
            );
            final canDo2Opacity = Tween<double>(begin: 0, end: 1).animate(
              CurvedAnimation(
                parent: controller,
                curve: const Interval(0.6, 0.7, curve: Curves.easeIn),
                reverseCurve: reverseCurve,
              ),
            );
            final canDo3Opacity = Tween<double>(begin: 0, end: 1).animate(
              CurvedAnimation(
                parent: controller,
                curve: const Interval(0.7, 0.8, curve: Curves.easeIn),
                reverseCurve: reverseCurve,
              ),
            );
            final canDo4Opacity = Tween<double>(begin: 0, end: 1).animate(
              CurvedAnimation(
                parent: controller,
                curve: const Interval(0.8, 0.9, curve: Curves.easeIn),
                reverseCurve: reverseCurve,
              ),
            );
            final flipOpacity = Tween<double>(begin: 0, end: 1).animate(
              CurvedAnimation(
                parent: controller,
                curve: const Interval(0.9, 1, curve: Curves.easeIn),
                reverseCurve: reverseCurve,
              ),
            );

            return [
              Positioned(
                left: 281.5,
                top: 111,
                child: Assets.images.props.slide10Trash
                    .image(opacity: trashOpacity),
              ),
              Positioned(
                left: 138.25,
                top: 122.3,
                child: Assets.images.props.slide10Whale
                    .image(opacity: whalesOpacity),
              ),
              Positioned(
                left: 330,
                top: 340.8,
                child: Assets.images.props.slide10OtherWhale
                    .image(opacity: whalesOpacity),
              ),
              Positioned(
                left: 700,
                top: 220,
                child: Assets.images.props.slide10OtherWhaleBubbles
                    .image(opacity: whalesOpacity),
              ),
              Positioned(
                left: 635,
                top: 506,
                child: Assets.images.props.slide10TrashZoom
                    .image(opacity: zoomOpacity),
              ),
              Positioned(
                left: 900,
                top: 740,
                child: FadeTransition(
                  opacity: textOpacity,
                  child: Transform.rotate(
                    angle: -pi / 10,
                    child: const Text(
                      '22kg!!!',
                      style: TextStyle(
                        fontFamily: FontFamily.quotesScript,
                        fontSize: 36,
                        color: AppColors.red,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 1150,
                top: 810,
                child: FadeTransition(
                  opacity: arrowOpacity,
                  child: ArcText(
                    radius: 200,
                    startAngle: -pi / 8,
                    startAngleAlignment: StartAngleAlignment.center,
                    text: l10n.whatCan,
                    textStyle: const TextStyle(
                      fontFamily: FontFamily.quotesScript,
                      fontSize: 35,
                      color: AppColors.blue,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 1140,
                top: 795,
                child: FadeTransition(
                  opacity: arrowOpacity,
                  child: ArcText(
                    radius: 200,
                    startAngle: -pi / 8,
                    startAngleAlignment: StartAngleAlignment.center,
                    placement: Placement.inside,
                    text: l10n.youDo,
                    textStyle: const TextStyle(
                      fontFamily: FontFamily.quotesScript,
                      fontSize: 35,
                      color: AppColors.blue,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 1033.5,
                top: 658.6,
                child: FadeTransition(
                  opacity: arrowOpacity,
                  child: Assets.images.props.slide10Arrow.image(),
                ),
              ),
              Positioned(
                left: 1271.68,
                top: 373.1,
                child: Assets.images.props.slide10Bubbles
                    .image(opacity: whalesOpacity),
              ),
              Positioned(
                left: 1328,
                top: 298,
                child: FadeTransition(
                  opacity: canDo2Opacity,
                  child: _InfoCoin10(
                    id: 'clothes',
                    image: Assets.images.props.slide10Clothes.image(),
                    title: l10n.canDo2Label,
                    text: l10n.canDo2Text,
                    shouldHint: true,
                  ),
                ),
              ),
              Positioned(
                left: 1444,
                top: 541,
                child: FadeTransition(
                  opacity: canDo3Opacity,
                  child: _InfoCoin10(
                    id: 'recycle',
                    image: Assets.images.props.slide10Recycle.image(),
                    title: l10n.canDo5Label,
                  ),
                ),
              ),
              Positioned(
                left: 1202,
                top: 502,
                child: FadeTransition(
                  opacity: canDo4Opacity,
                  child: _InfoCoin10(
                    id: 'veggies_fruits',
                    image: Assets.images.props.slide10VeggiesFruits.image(),
                    title: l10n.canDo4Label,
                  ),
                ),
              ),
              Positioned(
                left: condition == 'B' ? 1240 : 1355,
                top: 755,
                child: FadeTransition(
                  opacity: flipOpacity,
                  child: Column(
                    children: [
                      Assets.images.props.slide11FlipArrow.image(),
                      const SizedBox(height: 2),
                      Text(
                        condition == 'B'
                            ? l10n.againFlipAlreadyDo
                            : l10n.touchToFlip,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontFamily: FontFamily.poppins,
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: AppColors.red,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ];
          },
        ),
        Slide(
          background:
              Assets.images.backgrounds.slide11.image(fit: BoxFit.cover).image,
          audioPaths: condition == 'A'
              ? {
                  'en': Assets.audios.en.a.slide11,
                  'pt': Assets.audios.pt.a.slide11,
                }
              : {
                  'en': Assets.audios.en.b.slide11,
                  'pt': Assets.audios.pt.b.slide11,
                },
          propsBuilder: (context, controller, isActive) {
            const reverseCurve = Interval(0, 1, curve: Curves.easeOut);
            final circleOpacity = Tween<double>(begin: 0, end: 1).animate(
              CurvedAnimation(
                parent: controller,
                curve: const Interval(0, 0.1, curve: Curves.easeIn),
                reverseCurve: reverseCurve,
              ),
            );
            final infoOpacity = Tween<double>(begin: 0, end: 1).animate(
              CurvedAnimation(
                parent: controller,
                curve: const Interval(0.1, 0.2, curve: Curves.easeIn),
                reverseCurve: reverseCurve,
              ),
            );
            final whaleOpacity = Tween<double>(begin: 0, end: 1).animate(
              CurvedAnimation(
                parent: controller,
                curve: const Interval(0.2, 0.3, curve: Curves.easeIn),
                reverseCurve: reverseCurve,
              ),
            );
            final whaleEffectsOpacity = Tween<double>(begin: 0, end: 1).animate(
              CurvedAnimation(
                parent: controller,
                curve: const Interval(0.3, 0.4, curve: Curves.easeIn),
                reverseCurve: reverseCurve,
              ),
            );
            final arrowOpacity = Tween<double>(begin: 0, end: 1).animate(
              CurvedAnimation(
                parent: controller,
                curve: const Interval(0.4, 0.5, curve: Curves.easeIn),
                reverseCurve: reverseCurve,
              ),
            );
            final weNeedToOpacity = Tween<double>(begin: 0, end: 1).animate(
              CurvedAnimation(
                parent: controller,
                curve: const Interval(0.5, 0.6, curve: Curves.easeIn),
                reverseCurve: reverseCurve,
              ),
            );
            final weNeedTo2Opacity = Tween<double>(begin: 0, end: 1).animate(
              CurvedAnimation(
                parent: controller,
                curve: const Interval(0.7, 0.8, curve: Curves.easeIn),
                reverseCurve: reverseCurve,
              ),
            );
            final weNeedTo3Opacity = Tween<double>(begin: 0, end: 1).animate(
              CurvedAnimation(
                parent: controller,
                curve: const Interval(0.8, 0.9, curve: Curves.easeIn),
                reverseCurve: reverseCurve,
              ),
            );
            final flipOpacity = Tween<double>(begin: 0, end: 1).animate(
              CurvedAnimation(
                parent: controller,
                curve: const Interval(0.9, 1, curve: Curves.easeIn),
                reverseCurve: reverseCurve,
              ),
            );
            return [
              Positioned(
                left: 354,
                top: 125,
                child: Stack(
                  alignment: Alignment.center,
                  fit: StackFit.passthrough,
                  children: [
                    FadeTransition(
                      opacity: circleOpacity,
                      child: const DecoratedBox(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.lightBlue20,
                        ),
                        child: SizedBox(
                          width: 728,
                          height: 728,
                        ),
                      ),
                    ),
                    FadeTransition(
                      opacity: infoOpacity,
                      child: HookBuilder(
                        builder: (context) {
                          final opacity = useState<double>(0);
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(height: 30),
                              Stack(
                                children: [
                                  Opacity(
                                    opacity: opacity.value,
                                    child:
                                        Assets.images.props.slide11Map1.image(),
                                  ),
                                  Opacity(
                                    opacity: 1 - opacity.value,
                                    child:
                                        Assets.images.props.slide11Map2.image(),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  const SizedBox(height: 40),
                                  GradientSlider(
                                    value: opacity.value,
                                    onChanged: (value) {
                                      logger.logSliderValue(
                                        value.toStringAsFixed(2),
                                        slide: 11,
                                      );
                                      opacity.value = value;
                                    },
                                  ),
                                  const SizedBox(height: 20),
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
                                          Text(
                                            l10n.migrationCorridors,
                                          ),
                                          const Spacer(),
                                          Text(
                                            l10n.shippingDensity,
                                            textAlign: TextAlign.end,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 30),
                                  Assets.images.props.slide11SlideArrow.image(),
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
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 124,
                top: 462,
                child: Assets.images.props.slide11Whale
                    .image(opacity: whaleOpacity),
              ),
              Positioned(
                left: 354,
                top: 514,
                child: Assets.images.props.slide11WhaleEffects
                    .image(opacity: whaleEffectsOpacity),
              ),
              Positioned(
                left: 1042,
                top: 251,
                child: Assets.images.props.slide11Arrow
                    .image(opacity: arrowOpacity),
              ),
              Positioned(
                top: 825,
                left: 1410,
                child: FadeTransition(
                  opacity: weNeedToOpacity,
                  child: ArcText(
                    radius: 500,
                    startAngleAlignment: StartAngleAlignment.center,
                    text: l10n.weNeedTo,
                    textStyle: const TextStyle(
                      fontFamily: FontFamily.quotesScript,
                      fontSize: 44,
                      color: AppColors.blue,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 1311,
                top: 318,
                child: Assets.images.props.slide11Line
                    .image(opacity: weNeedToOpacity),
              ),
              Positioned(
                left: 1397,
                top: 364,
                child: FadeTransition(
                  opacity: weNeedTo2Opacity,
                  child: _InfoCoin11(
                    id: 'tourism',
                    image: Assets.images.props.slide11Tourism.image(),
                    title: l10n.needTo2Label,
                    shouldHint: true,
                  ),
                ),
              ),
              Positioned(
                left: 1186,
                top: 512,
                child: FadeTransition(
                  opacity: weNeedTo3Opacity,
                  child: _InfoCoin11(
                    id: 'local_products',
                    image: Assets.images.props.slide11Local.image(),
                    title: l10n.needTo3Label,
                    text: l10n.needTo3Text,
                  ),
                ),
              ),
              Positioned(
                left: condition == 'B' ? 1255 : 1295,
                top: 755,
                child: FadeTransition(
                  opacity: flipOpacity,
                  child: Column(
                    children: [
                      Assets.images.props.slide11FlipArrow.image(),
                      const SizedBox(height: 2),
                      Text(
                        condition == 'B'
                            ? l10n.againFlipAlreadyDo
                            : l10n.touchToFlip,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontFamily: FontFamily.poppins,
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: AppColors.red,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ];
          },
        ),
        Slide(
          background:
              Assets.images.backgrounds.slide12.image(fit: BoxFit.cover).image,
          audioPaths: condition == 'A'
              ? {
                  'en': Assets.audios.en.a.slide12,
                  'pt': Assets.audios.pt.a.slide12,
                }
              : {
                  'en': Assets.audios.en.b.slide12,
                  'pt': Assets.audios.pt.b.slide12,
                },
          propsBuilder: (context, controller, isActive) {
            const reverseCurve = Interval(0, 1, curve: Curves.easeOut);
            final whaleOpacity = Tween<double>(begin: 0, end: 1).animate(
              CurvedAnimation(
                parent: controller,
                curve: const Interval(0, 0.2, curve: Curves.easeIn),
                reverseCurve: reverseCurve,
              ),
            );
            final effectsOpacity = Tween<double>(begin: 0, end: 1).animate(
              CurvedAnimation(
                parent: controller,
                curve: const Interval(0.2, 0.4, curve: Curves.easeIn),
                reverseCurve: reverseCurve,
              ),
            );

            return [
              Positioned(
                left: 569,
                top: 442,
                child: Assets.images.props.slide12Whale
                    .image(opacity: whaleOpacity),
              ),
              Positioned(
                left: 1150,
                top: 478,
                child: Assets.images.props.slide12WhaleEffects
                    .image(opacity: effectsOpacity),
              ),
            ];
          },
        ),
        Slide(
          audioPaths: condition == 'A'
              ? {
                  'en': Assets.audios.en.a.slide13,
                  'pt': Assets.audios.pt.a.slide13,
                }
              : {
                  'en': Assets.audios.en.b.slide13,
                  'pt': Assets.audios.pt.b.slide13,
                },
          propsBuilder: (context, controller, isActive) {
            const reverseCurve = Interval(0, 1, curve: Curves.easeOut);
            final titleOpacity = Tween<double>(begin: 0, end: 1).animate(
              CurvedAnimation(
                parent: controller,
                curve: const Interval(0, 0.5, curve: Curves.easeIn),
                reverseCurve: reverseCurve,
              ),
            );
            final circlesOpacity = Tween<double>(begin: 0, end: 1).animate(
              CurvedAnimation(
                parent: controller,
                curve: const Interval(0.5, 1, curve: Curves.easeIn),
                reverseCurve: reverseCurve,
              ),
            );

            return [
              Positioned(
                top: 1150,
                left: 0,
                right: 0,
                child: FadeTransition(
                  opacity: titleOpacity,
                  child: ArcText(
                    radius: 1000,
                    text: condition == 'A'
                        ? l10n.someThings
                        : l10n.reminderOfThings,
                    startAngleAlignment: StartAngleAlignment.center,
                    textStyle: const TextStyle(
                      fontFamily: FontFamily.quotesScript,
                      color: AppColors.blue,
                      fontSize: 44,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 115,
                left: 20,
                right: 0,
                child: Assets.images.props.slide13Line
                    .image(opacity: titleOpacity),
              ),
              Positioned(
                top: 330,
                left: 0,
                right: 0,
                child: Center(
                  child: SizedBox(
                    width: 1440,
                    child: Consumer(
                      builder: (context, ref, _) {
                        final coins = ref.watch(coinsProvider);
                        return FadeTransition(
                          opacity: circlesOpacity,
                          child: Wrap(
                            alignment: WrapAlignment.center,
                            runAlignment: WrapAlignment.center,
                            spacing: 40,
                            runSpacing: 40,
                            children: [
                              if (condition == 'A' ||
                                  !coins.contains('food_waste'))
                                _InfoCoin13(
                                  title: l10n.ourPart1Label,
                                  text: l10n.ourPart1Text,
                                ),
                              if (condition == 'A' ||
                                  !coins.contains('plant_diet'))
                                _InfoCoin13(
                                  title: l10n.ourPart2Label,
                                  text: l10n.ourPart2Text,
                                ),
                              if (condition == 'A' ||
                                  !coins.contains('home_efficient'))
                                _InfoCoin13(
                                  title: l10n.ourPart3Label,
                                  text: l10n.ourPart3Text,
                                ),
                              if (condition == 'A' ||
                                  !coins.contains('transportation'))
                                _InfoCoin13(
                                  title: l10n.ourPart4Label,
                                  text: l10n.ourPart4Text,
                                ),
                              if (condition == 'A' ||
                                  !coins.contains('buy_less'))
                                _InfoCoin13(
                                  title: l10n.ourPart5Label,
                                  text: l10n.ourPart5Text,
                                ),
                              if (condition == 'A' ||
                                  !coins.contains('clothes'))
                                _InfoCoin13(
                                  title: l10n.canDo2Label,
                                  text: l10n.canDo2Text,
                                ),
                              if (condition == 'A' ||
                                  !coins.contains('recycle'))
                                _InfoCoin13(
                                  title: l10n.canDo5Label,
                                ),
                              if (condition == 'A' ||
                                  !coins.contains('veggies_fruits'))
                                _InfoCoin13(
                                  title: l10n.canDo4Label,
                                ),
                              if (condition == 'A' ||
                                  !coins.contains('tourism'))
                                _InfoCoin13(
                                  title: l10n.needTo2Label,
                                ),
                              if (condition == 'A' ||
                                  !coins.contains('local_products'))
                                _InfoCoin13(
                                  title: l10n.needTo3Label,
                                  text: l10n.needTo3Text,
                                ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ];
          },
        ),
        Slide(
          background:
              Assets.images.backgrounds.slide14.image(fit: BoxFit.cover).image,
          audioPaths: condition == 'A'
              ? {
                  'en': Assets.audios.en.a.slide14,
                  'pt': Assets.audios.pt.a.slide14,
                }
              : {
                  'en': Assets.audios.en.b.slide14,
                  'pt': Assets.audios.pt.b.slide14,
                },
          propsBuilder: (context, controller, isActive) {
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
                child: Assets.images.props.slide14OldWhale
                    .image(opacity: oldWhaleOpacity),
              ),
              Positioned(
                left: 702,
                top: 793,
                child: Assets.images.props.slide14DeadWhale
                    .image(opacity: deadWhaleOpacity),
              ),
              Positioned(
                left: 916,
                top: 472,
                child: Assets.images.props.slide14Arrow
                    .image(opacity: tonsOpacity),
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
              if (condition == 'B') ...[
                Positioned(
                  left: 1092,
                  top: 470.5,
                  child: Assets.images.props.slide14ArrowCurved
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
                            Assets.images.props.slide14SlideArrow
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
              ],
            ];
          },
        ),
        Slide(
          audioPaths: condition == 'A'
              ? {
                  'en': Assets.audios.en.a.slide15,
                  'pt': Assets.audios.pt.a.slide15,
                }
              : {
                  'en': Assets.audios.en.b.slide15,
                  'pt': Assets.audios.pt.b.slide15,
                },
          propsBuilder: (context, controller, isActive) {
            const reverseCurve = Interval(0, 1, curve: Curves.easeOut);
            final textOpacity = Tween<double>(begin: 0, end: 1).animate(
              CurvedAnimation(
                parent: controller,
                curve: const Interval(0, 1, curve: Curves.easeIn),
                reverseCurve: reverseCurve,
              ),
            );

            return [
              Center(
                child: FadeTransition(
                  opacity: textOpacity,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        l10n.letsDoThis,
                        style: const TextStyle(
                          fontFamily: FontFamily.poppins,
                          fontWeight: FontWeight.bold,
                          fontSize: 100,
                          color: AppColors.darkBlue,
                          height: 1.1,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 50),
                      Text(
                        l10n.bePartOfThisJourney,
                        style: const TextStyle(
                          fontFamily: FontFamily.poppins,
                          fontSize: 25,
                          color: AppColors.darkBlue,
                          height: 1.3,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 80),
                    ],
                  ),
                ),
              )
            ];
          },
        ),
        if (condition == 'B')
          Slide(
            audioPaths: {
              'en': Assets.audios.en.b.slide16,
              'pt': Assets.audios.pt.b.slide16,
            },
            propsBuilder: (context, controller, isActive) {
              const reverseCurve = Interval(0, 1, curve: Curves.easeOut);
              final textOpacity = Tween<double>(begin: 0, end: 1).animate(
                CurvedAnimation(
                  parent: controller,
                  curve: const Interval(0, 0.5, curve: Curves.easeIn),
                  reverseCurve: reverseCurve,
                ),
              );
              final chatOpacity = Tween<double>(begin: 0, end: 1).animate(
                CurvedAnimation(
                  parent: controller,
                  curve: const Interval(0.5, 1, curve: Curves.easeIn),
                  reverseCurve: reverseCurve,
                ),
              );

              return [
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FadeTransition(
                        opacity: textOpacity,
                        child: Text(
                          l10n.questionsAnswers,
                          style: const TextStyle(
                            fontFamily: FontFamily.poppins,
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: AppColors.darkBlue,
                            height: 1.2,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 40),
                      FadeTransition(
                        opacity: chatOpacity,
                        child: const Chat(),
                      ),
                      const SizedBox(height: 80),
                    ],
                  ),
                )
              ];
            },
          ),
      ],
      stops: const [3, 4, 5, 6, 7, 10, 11, 13, 14],
    );
  }
}

class Slideshow extends HookConsumerWidget {
  const Slideshow({
    super.key,
    required this.slides,
    required this.stops,
  });

  final List<Slide> slides;
  final List<int> stops;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final logger = ref.read(loggerProvider);
    final locale = ref.read(localeProvider);

    final showSources = useState(false);
    final currentSlide = useState(1);
    final audioPlaying = useValueNotifier(true);
    useEffect(() {
      void reset() => audioPlaying.value = true;
      currentSlide.addListener(reset);
      return () => currentSlide.removeListener(reset);
    });

    void onAudioEnd() {
      audioPlaying.value = false;
      if (showSources.value) return;
      if (stops.contains(currentSlide.value)) {
        final timer = Timer(
          const Duration(minutes: 5),
          () {
            logger.logSlideTimeout(currentSlide.value);
            context.go('/');
          },
        );

        void cancel() {
          timer.cancel();
          currentSlide.removeListener(cancel);
        }

        currentSlide.addListener(cancel);
        return;
      }
      if (currentSlide.value == slides.length) {
        logger.logEnd();
        return;
      }
      logger.logAutoNextSlide(currentSlide.value);
      currentSlide.value++;
    }

    return Screen(
      body: Stack(
        children: [
          for (final (i, s) in slides.indexed)
            SlideBuilder(
              slide: i + 1,
              currentSlide: currentSlide.value,
              background: s.background,
              audioPath: s.audioPaths[locale.languageCode],
              propsBuilder: s.propsBuilder,
              onAudioEnd: onAudioEnd,
              backgroundDuration: s.backgroundDuration,
              propsDuration: s.propsDuration,
            ),
          Positioned.fill(
            bottom: 15,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleButton(
                        height: 52,
                        width: 52,
                        border: Border.all(
                          color: currentSlide.value == 1
                              ? AppColors.blue.withOpacity(0.2)
                              : AppColors.blue,
                          width: 2,
                        ),
                        onTap: currentSlide.value == 1
                            ? null
                            : () {
                                logger
                                    .logManualPreviousSlide(currentSlide.value);
                                currentSlide.value--;
                              },
                        child: Arrow(
                          size: const Size(28, 26),
                          color: currentSlide.value == 1
                              ? AppColors.blue.withOpacity(0.2)
                              : AppColors.blue,
                          direction: AxisDirection.left,
                        ),
                      ),
                      const SizedBox(width: 30),
                      ChapterIndicator(
                        slideCount: slides.length,
                        stops: stops,
                        currentSlide: currentSlide.value,
                        onSlideTap: (slide) {
                          logger.logJumpSlide(currentSlide.value, slide);
                          currentSlide.value = slide;
                        },
                      ),
                      const SizedBox(width: 30),
                      HookBuilder(
                        builder: (context) {
                          final isAudioPlaying =
                              useListenable(audioPlaying).value;
                          final controller = useAnimationController(
                            duration: const Duration(milliseconds: 500),
                          );
                          final animation = Tween<Offset>(
                            begin: Offset.zero,
                            end: const Offset(0, -0.5),
                          ).animate(
                            CurvedAnimation(
                              parent: controller,
                              curve: Curves.easeInOutBack,
                            ),
                          );
                          useEffect(
                            () {
                              var forceStop = false;
                              void repeat(AnimationStatus status) {
                                if (isAudioPlaying) return;
                                if (status == AnimationStatus.completed) {
                                  controller.reverse();
                                } else if (status ==
                                    AnimationStatus.dismissed) {
                                  Future.delayed(
                                    const Duration(seconds: 3),
                                    () {
                                      if (forceStop) return;
                                      controller.forward();
                                    },
                                  );
                                }
                              }

                              if (!isAudioPlaying &&
                                  currentSlide.value != slides.length) {
                                controller.forward();
                                controller.addStatusListener(repeat);
                                return () {
                                  controller.removeStatusListener(repeat);
                                  forceStop = true;
                                  controller.reset();
                                };
                              }
                              return () => forceStop = true;
                            },
                            [isAudioPlaying],
                          );
                          return SlideTransition(
                            position: animation,
                            child: HookBuilder(
                              builder: (context) {
                                final forceEnable = useState(false);
                                useEffect(() {
                                  void reset() => forceEnable.value = false;
                                  currentSlide.addListener(reset);
                                  return () =>
                                      currentSlide.removeListener(reset);
                                });
                                final isEnabled =
                                    !isAudioPlaying || forceEnable.value;
                                return CircleButton(
                                  height: 52,
                                  width: 52,
                                  border: Border.all(
                                    color: isEnabled
                                        ? AppColors.blue
                                        : AppColors.blue.withOpacity(0.2),
                                    width: 2,
                                  ),
                                  onTap: isEnabled
                                      ? () {
                                          if (currentSlide.value ==
                                              slides.length) {
                                            logger.logLeave(currentSlide.value);
                                            context.go('/');
                                            return;
                                          }
                                          logger.logManualNextSlide(
                                            currentSlide.value,
                                          );
                                          currentSlide.value++;
                                        }
                                      : () => forceEnable.value = true,
                                  child: Arrow(
                                    size: const Size(28, 26),
                                    color: isEnabled
                                        ? AppColors.blue
                                        : AppColors.blue.withOpacity(0.2),
                                    direction: AxisDirection.right,
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 16,
                        width: 16,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.lightBlue,
                            width: 2,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        l10n.stopsToExplore,
                        style: const TextStyle(
                          fontFamily: FontFamily.poppins,
                          fontSize: 16,
                          color: AppColors.darkBlue,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  TextButton(
                    onPressed: () {
                      logger.logLeave(currentSlide.value);
                      context.go('/');
                    },
                    style: TextButton.styleFrom(
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      foregroundColor: AppColors.darkBlue,
                      minimumSize: const Size(0, 36),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(8),
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          l10n.leave,
                          style: const TextStyle(
                            fontFamily: FontFamily.poppins,
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                            height: 1.2,
                            color: AppColors.darkBlue,
                          ),
                        ),
                        const SizedBox(width: 5),
                        const Icon(
                          Icons.close,
                          size: 22,
                          color: AppColors.darkBlue,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          if (showSources.value)
            ModalBarrier(
              onDismiss: () {
                logger.logSources(currentSlide.value);
                showSources.value = false;
              },
            ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            top: 0,
            bottom: 0,
            right: showSources.value ? 0 : -500,
            child: Row(
              children: [
                RotatedBox(
                  quarterTurns: -1,
                  child: Builder(
                    builder: (context) {
                      return ElevatedButton(
                        onPressed: () => showSources.value = !showSources.value,
                        style: ElevatedButton.styleFrom(
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          backgroundColor: AppColors.white,
                          foregroundColor: AppColors.darkBlue,
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
                            Text(showSources.value ? l10n.close : l10n.sources),
                      );
                    },
                  ),
                ),
                Material(
                  color: AppColors.white,
                  elevation: 4,
                  child: SizedBox(
                    width: 500,
                    child: Center(
                      child: ListView(
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(30),
                        children: [
                          for (final s
                              in sources[currentSlide.value] ?? <Source>[])
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: Column(
                                children: [
                                  Text(
                                    s.title,
                                    style: const TextStyle(
                                      fontFamily: FontFamily.poppins,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      height: 1.2,
                                      color: AppColors.black,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 15),
                                  QrImageView(
                                    data: s.url,
                                    size: 200,
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 10,
            top: 10,
            child: Consumer(
              builder: (context, ref, _) {
                final count = ref.watch(countProvider);
                final condition = ref.watch(conditionProvider);
                return Text(
                  '$count - $condition',
                  style: const TextStyle(
                    fontFamily: FontFamily.poppins,
                    fontSize: 17,
                    height: 1,
                    color: AppColors.darkBlue,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ChapterIndicator extends StatelessWidget {
  const ChapterIndicator({
    super.key,
    required this.slideCount,
    required this.stops,
    required this.currentSlide,
    required this.onSlideTap,
  });

  final int slideCount;
  final List<int> stops;
  final int currentSlide;
  final ValueChanged<int> onSlideTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => onSlideTap(1),
          child: Container(
            height: 18,
            width: 18,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: 1 <= currentSlide ? AppColors.blue : AppColors.lightBlue,
            ),
          ),
        ),
        for (var i = 2; i < slideCount; i++) ...[
          Container(
            color: i <= currentSlide ? AppColors.blue : AppColors.lightBlue,
            width: 10,
            height: 2,
          ),
          GestureDetector(
            onTap: () => onSlideTap(i),
            child: Container(
              height: stops.contains(i) ? 16 : 12,
              width: stops.contains(i) ? 16 : 12,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: stops.contains(i)
                    ? null
                    : i <= currentSlide
                        ? AppColors.blue
                        : AppColors.lightBlue,
                border: Border.all(
                  color:
                      i <= currentSlide ? AppColors.blue : AppColors.lightBlue,
                  width: 2,
                ),
              ),
            ),
          ),
        ],
        Container(
          color:
              slideCount <= currentSlide ? AppColors.blue : AppColors.lightBlue,
          width: 10,
          height: 2,
        ),
        GestureDetector(
          onTap: () => onSlideTap(slideCount),
          child: Container(
            height: 18,
            width: 18,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: slideCount <= currentSlide
                  ? AppColors.blue
                  : AppColors.lightBlue,
            ),
          ),
        ),
      ],
    );
  }
}

class _BarBar extends StatelessWidget {
  const _BarBar({
    required this.totalWidth,
    required this.filledWidth,
    this.invert = false,
  });

  final double totalWidth;
  final double filledWidth;
  final bool invert;

  @override
  Widget build(BuildContext context) {
    final bars = [
      for (var i = 1; i <= (totalWidth / filledWidth); i++) ...[
        if (i == 1)
          Padding(
            padding: const EdgeInsets.only(bottom: 3),
            child: ColoredBox(
              color: AppColors.lightBlue,
              child: SizedBox(
                width: filledWidth,
                height: 6,
              ),
            ),
          )
        else
          Padding(
            padding: i.isEven
                ? const EdgeInsets.only(top: 3)
                : const EdgeInsets.only(bottom: 3),
            child: ColoredBox(
              color: AppColors.lightBlue40,
              child: SizedBox(
                width: filledWidth,
                height: 6,
              ),
            ),
          ),
        if (i + 1 > (totalWidth / filledWidth))
          Padding(
            padding: (i + 1).isEven
                ? const EdgeInsets.only(top: 3)
                : const EdgeInsets.only(bottom: 3),
            child: ColoredBox(
              color: AppColors.lightBlue40,
              child: SizedBox(
                width: totalWidth - (i * filledWidth),
                height: 6,
              ),
            ),
          ),
      ]
    ];
    return Row(
      children: (invert ? bars.reversed : bars).toList(),
    );
  }
}

class _InfoCoin6 extends ConsumerWidget {
  const _InfoCoin6({
    required this.id,
    required this.image,
    required this.title,
    required this.text,
    this.shouldHint = false,
  });

  final String id;
  final Widget image;
  final String title;
  final String text;
  final bool shouldHint;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FlipCoin(
      onFlip: () {
        ref.read(loggerProvider).logCoinFlip(id, slide: 6);
      },
      shouldHint: shouldHint,
      radius: 65,
      front: image,
      back: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 2),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: FontFamily.poppins,
              color: AppColors.green,
              fontWeight: FontWeight.bold,
              fontSize: 21,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: FontFamily.poppins,
              fontWeight: FontWeight.bold,
              color: AppColors.darkBlue,
              fontSize: 17,
              height: 1.2,
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoCoin7 extends ConsumerWidget {
  const _InfoCoin7({
    required this.id,
    required this.image,
    required this.title,
    required this.text,
    this.shouldHint = false,
  });

  final String id;
  final Widget image;
  final String title;
  final String text;
  final bool shouldHint;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSelectable = ref.watch(conditionProvider) == 'B';
    final isSelected =
        ref.watch(coinsProvider.select((coins) => coins.contains(id)));
    return FlipCoin(
      onFlip: () {
        ref.read(loggerProvider).logCoinFlip(id, slide: 7);
        if (isSelectable) {
          ref.read(coinsProvider.notifier).flip(id);
        }
      },
      shouldHint: shouldHint,
      radius: 128,
      side: isSelectable
          ? isSelected
              ? CardSide.BACK
              : CardSide.FRONT
          : CardSide.BACK,
      back: image,
      front: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: FontFamily.poppins,
              color: AppColors.darkBlue,
              fontWeight: FontWeight.bold,
              fontSize: 23,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: FontFamily.poppins,
              color: AppColors.darkBlue,
              fontSize: 17,
              height: 1.2,
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoCoin10 extends ConsumerWidget {
  const _InfoCoin10({
    required this.id,
    required this.image,
    required this.title,
    this.text,
    this.shouldHint = false,
  });

  final String id;
  final Widget image;
  final String title;
  final String? text;
  final bool shouldHint;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSelectable = ref.watch(conditionProvider) == 'B';
    final isSelected =
        ref.watch(coinsProvider.select((coins) => coins.contains(id)));
    return FlipCoin(
      onFlip: () {
        ref.read(loggerProvider).logCoinFlip(id, slide: 10);
        if (isSelectable) {
          ref.read(coinsProvider.notifier).flip(id);
        }
      },
      shouldHint: shouldHint,
      radius: 110,
      side: isSelectable
          ? isSelected
              ? CardSide.BACK
              : CardSide.FRONT
          : CardSide.BACK,
      back: image,
      front: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: FontFamily.poppins,
              color: AppColors.darkBlue,
              fontWeight: FontWeight.bold,
              fontSize: 20,
              height: 1.2,
            ),
          ),
          if (text != null) ...[
            const SizedBox(height: 5),
            Text(
              text!,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: FontFamily.poppins,
                color: AppColors.darkBlue,
                fontSize: 16,
                height: 1.2,
              ),
            ),
          ]
        ],
      ),
    );
  }
}

class _InfoCoin11 extends ConsumerWidget {
  const _InfoCoin11({
    required this.id,
    required this.image,
    required this.title,
    this.text,
    this.shouldHint = false,
  });

  final String id;
  final Image image;
  final String title;
  final String? text;
  final bool shouldHint;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSelectable = ref.watch(conditionProvider) == 'B';
    final isSelected =
        ref.watch(coinsProvider.select((coins) => coins.contains(id)));
    return FlipCoin(
      onFlip: () {
        ref.read(loggerProvider).logCoinFlip(id, slide: 10);
        if (isSelectable) {
          ref.read(coinsProvider.notifier).flip(id);
        }
      },
      shouldHint: shouldHint,
      radius: 114,
      side: isSelectable
          ? isSelected
              ? CardSide.BACK
              : CardSide.FRONT
          : CardSide.BACK,
      back: image,
      front: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              fontFamily: FontFamily.poppins,
              fontWeight: FontWeight.bold,
              fontSize: 21,
              height: 1.2,
              color: AppColors.darkBlue,
            ),
            textAlign: TextAlign.center,
          ),
          if (text != null) ...[
            const SizedBox(height: 8),
            Text(
              text!,
              style: const TextStyle(
                fontFamily: FontFamily.poppins,
                fontSize: 17,
                height: 1.2,
                color: AppColors.darkBlue,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ],
      ),
    );
  }
}

class _InfoCoin13 extends ConsumerWidget {
  const _InfoCoin13({
    required this.title,
    this.text,
  });

  final String title;
  final String? text;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Material(
      type: MaterialType.circle,
      color: AppColors.white,
      child: SizedBox(
        height: 256,
        width: 256,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: FontFamily.poppins,
                  color: AppColors.darkBlue,
                  fontWeight: FontWeight.bold,
                  fontSize: 23,
                  height: 1.2,
                ),
              ),
              if (text != null) ...[
                const SizedBox(height: 10),
                Text(
                  text!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: FontFamily.poppins,
                    color: AppColors.darkBlue,
                    fontSize: 17,
                    height: 1.2,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
