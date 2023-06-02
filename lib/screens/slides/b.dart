import 'dart:math';

import 'package:arcadia_app/gen/assets.gen.dart';
import 'package:arcadia_app/gen/fonts.gen.dart';
import 'package:arcadia_app/l10n/app_localizations.dart';
import 'package:arcadia_app/providers.dart';
import 'package:arcadia_app/style/colors.dart';
import 'package:arcadia_app/utils/hooks.dart';
import 'package:arcadia_app/widgets/flip_coin.dart';
import 'package:arcadia_app/widgets/gradient_slider.dart';
import 'package:arcadia_app/widgets/line.dart';
import 'package:arcadia_app/widgets/slide.dart';
import 'package:flutter/material.dart';
import 'package:flutter_arc_text/flutter_arc_text.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:just_audio/just_audio.dart';

const stops = [2, 3, 4, 5, 6, 9, 10, 12, 15];

final slides = [
  Slide(
    background:
        Assets.images.backgrounds.slide01.image(fit: BoxFit.cover).image,
    backgroundDuration: Duration.zero,
    audioPaths: {
      'en': Assets.audios.en.slide01,
      'pt': Assets.audios.pt.slide01,
    },
    propsBuilder: (context, controller, isActive, logger) {
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
          child: Assets.images.props.slide01Map.image(opacity: mapOpacity),
        ),
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
    audioPaths: {
      'en': Assets.audios.en.slide03,
      'pt': Assets.audios.pt.slide03,
    },
    propsBuilder: (context, controller, isActive, logger) {
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
      final bigWhaleOpacity = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
          parent: controller,
          curve: const Interval(0.2, 0.3, curve: Curves.easeIn),
          reverseCurve: reverseCurve,
        ),
      );
      final smallWhaleOpacity = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
          parent: controller,
          curve: const Interval(0.3, 0.4, curve: Curves.easeIn),
          reverseCurve: reverseCurve,
        ),
      );
      final whalesEffectsOpacity = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
          parent: controller,
          curve: const Interval(0.4, 0.5, curve: Curves.easeIn),
          reverseCurve: reverseCurve,
        ),
      );
      final chartCircleOpacity = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
          parent: controller,
          curve: const Interval(0.5, 0.6, curve: Curves.easeIn),
          reverseCurve: reverseCurve,
        ),
      );
      final chartOpacity = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
          parent: controller,
          curve: const Interval(0.6, 0.8, curve: Curves.easeIn),
          reverseCurve: reverseCurve,
        ),
      );
      final chartExtraOpacity = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
          parent: controller,
          curve: const Interval(0.8, 0.9, curve: Curves.easeIn),
          reverseCurve: reverseCurve,
        ),
      );

      return [
        Positioned(
          left: 183,
          top: 133,
          child:
              Assets.images.props.slide02Fishes1.image(opacity: fishesOpacity),
        ),
        Positioned(
          left: 1523,
          top: 877,
          child:
              Assets.images.props.slide02Fishes3.image(opacity: fishesOpacity),
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
                                                    CrossAxisAlignment.stretch,
                                                children: [
                                                  Assets
                                                      .images.props.slide03Chart
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
                                                        SizedBox(width: 84),
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
                          Positioned(
                            bottom: 205,
                            left: 210 + 86 * 2.12,
                            child: FadeTransition(
                              opacity: chartExtraOpacity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                          Positioned(
                            bottom: 205,
                            left: 210 + 122 * 2.12,
                            child: FadeTransition(
                              opacity: chartExtraOpacity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
    audioPaths: {
      'en': Assets.audios.en.slide04,
      'pt': Assets.audios.pt.slide04,
    },
    propsDuration: const Duration(seconds: 18),
    propsBuilder: (context, controller, isActive, logger) {
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
          curve: const Interval(0, 0.2 * 1 / 18, curve: Curves.easeIn),
          reverseCurve: reverseCurve,
        ),
      );
      final circleEnvironmentOpacity = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
          parent: controller,
          curve: const Interval(
            0.2 * 1 / 18,
            0.4 * 1 / 18,
            curve: Curves.easeIn,
          ),
          reverseCurve: reverseCurve,
        ),
      );
      final whalesOpacity = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
          parent: controller,
          curve: const Interval(
            0.4 * 1 / 18,
            0.6 * 1 / 18,
            curve: Curves.easeIn,
          ),
          reverseCurve: reverseCurve,
        ),
      );
      final circleInfoOpacity = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
          parent: controller,
          curve: const Interval(
            0.6 * 1 / 18,
            0.8 * 1 / 18,
            curve: Curves.easeIn,
          ),
          reverseCurve: reverseCurve,
        ),
      );
      final chartBackgroundOpacity = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
          parent: controller,
          curve: const Interval(
            17 / 18,
            17 / 18 + 0.2 * 1 / 18,
            curve: Curves.easeIn,
          ),
          reverseCurve: reverseCurve,
        ),
      );
      final chartTitleOpacity = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
          parent: controller,
          curve: const Interval(
            17 / 18 + 0.2 * 1 / 18,
            17 / 18 + 0.4 * 1 / 18,
            curve: Curves.easeIn,
          ),
          reverseCurve: reverseCurve,
        ),
      );
      final chartBubblesOpacity = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
          parent: controller,
          curve: const Interval(
            17 / 18 + 0.4 * 1 / 18,
            17 / 18 + 0.6 * 1 / 18,
            curve: Curves.easeIn,
          ),
          reverseCurve: reverseCurve,
        ),
      );

      return [
        Positioned(
          left: 183,
          top: 133,
          child:
              Assets.images.props.slide02Fishes1.image(opacity: fishesOpacity),
        ),
        Positioned(
          left: 1523,
          top: 877,
          child:
              Assets.images.props.slide02Fishes3.image(opacity: fishesOpacity),
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
          left: 304,
          top: 327,
          child: FadeTransition(
            opacity: chartBackgroundOpacity,
            child: DecoratedBox(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.lightBlue15,
              ),
              child: SizedBox(
                height: 570,
                width: 570,
                child: Center(
                  child: FadeTransition(
                    opacity: chartTitleOpacity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 35),
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
                        )
                      ],
                    ),
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
        Positioned(
          left: 366.5,
          top: 359,
          child: Assets.images.props.slide04ChartArrows
              .image(opacity: chartBubblesOpacity),
        ),
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
      ];
    },
  ),
  Slide(
    audioPaths: {
      'en': Assets.audios.en.slide05,
      'pt': Assets.audios.pt.slide05,
    },
    background:
        Assets.images.backgrounds.slide05.image(fit: BoxFit.cover).image,
    propsBuilder: (context, controller, isActive, logger) {
      final l10n = AppLocalizations.of(context)!;
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

      return [
        Positioned(
          left: 303,
          top: 565.5,
          child:
              Assets.images.props.slide05BigArrow.image(opacity: arrowOpacity),
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
                                  '${(170 / 100).toStringAsFixed(2)}m',
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
                              const _BarBar(
                                totalWidth: 314.2,
                                filledWidth: 170 * 314.2 / 3000,
                                invert: true,
                              ),
                              const SizedBox(height: 15),
                              Row(
                                children: [
                                  Assets.images.props.slide05People.image(),
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
                              Assets.images.props.slide05Dinossaur.image(),
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
          child:
              Assets.images.props.slide05BigWhale.image(opacity: whaleOpacity),
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
          child: Assets.images.props.slide05Fish.image(opacity: fishOpacity),
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
      ];
    },
  ),
  Slide(
    audioPaths: {
      'en': Assets.audios.en.slide06,
      'pt': Assets.audios.pt.slide06,
    },
    propsBuilder: (context, controller, isActive, logger) {
      final l10n = AppLocalizations.of(context)!;
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
                width: 756,
                height: 580,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(40, 50, 40, 0),
                  child: Column(
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
                          const Spacer(),
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
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              DecoratedBox(
                                                decoration: BoxDecoration(
                                                  color: AppColors.lightBlue,
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
                                                            FontFamily.poppins,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: AppColors.white,
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
                                                  fontWeight: FontWeight.bold,
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
                                  const Spacer(),
                                ],
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
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
                                            Assets
                                                .images.props.slide06SmallWhale
                                                .image(),
                                            const SizedBox(height: 9),
                                            Text(
                                              l10n.whalesToday,
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                fontFamily: FontFamily.poppins,
                                                color: AppColors.darkBlue,
                                                fontWeight: FontWeight.w500,
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
                                                fontFamily: FontFamily.poppins,
                                                color: AppColors.darkBlue,
                                                fontWeight: FontWeight.w500,
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
                                const Spacer(flex: 2),
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
          child:
              Assets.images.props.slide05BigWhale.image(opacity: whaleOpacity),
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
          child: Assets.images.props.slide05Fish.image(opacity: fishOpacity),
        ),
        Positioned(
          left: 866.3,
          top: 735.3,
          child: Assets.images.props.slide06Tiny.image(opacity: fishOpacity),
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
    propsBuilder: (context, controller, isActive, logger) {
      final l10n = AppLocalizations.of(context)!;
      const reverseCurve = Interval(0, 1, curve: Curves.easeOut);
      final whaleOpacity = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
          parent: controller,
          curve: const Interval(0, 0.2, curve: Curves.easeIn),
          reverseCurve: reverseCurve,
        ),
      );
      final backgroundCircleOpacity = Tween<double>(begin: 0, end: 1).animate(
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
      final circle6Opacity = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
          parent: controller,
          curve: const Interval(0.9, 1, curve: Curves.easeIn),
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
              const SizedBox(height: 80),
              FadeTransition(
                opacity: tipOpacity,
                child: Assets.images.props.slide07FlipArrow.image(),
              ),
              const SizedBox(height: 4),
              FadeTransition(
                opacity: tipOpacity,
                child: Text(
                  l10n.touchCircleToFlip,
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
                  const SizedBox(width: 70),
                  FadeTransition(
                    opacity: circle6Opacity,
                    child: _InfoCoin7(
                      id: 'equality',
                      image: Assets.images.props.slide07Hands.image(),
                      title: l10n.ourPart6Label,
                      text: l10n.ourPart6Text,
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
          child: Assets.images.props.slide07Whale.image(opacity: whaleOpacity),
        ),
      ];
    },
  ),
  Slide(
    background:
        Assets.images.backgrounds.slide08.image(fit: BoxFit.cover).image,
    audioPaths: {
      'en': Assets.audios.en.slide08,
      'pt': Assets.audios.pt.slide08,
    },
    propsBuilder: (context, controller, isActive, logger) {
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
          child: Assets.images.props.slide08Food.image(opacity: foodOpacity),
        ),
        Positioned(
          left: 210,
          top: 493.5,
          child: Assets.images.props.slide08Whale.image(opacity: whaleOpacity),
        ),
        Positioned(
          left: 1091,
          top: 539,
          child:
              Assets.images.props.slide08FoodZoom.image(opacity: zoomOpacity),
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
    audioPaths: {
      'en': Assets.audios.en.slide09,
      'pt': Assets.audios.pt.slide09,
    },
    propsBuilder: (context, controller, isActive, logger) {
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
          child: Assets.images.props.slide09Food.image(opacity: foodOpacity),
        ),
        Positioned(
          left: 210,
          top: 493.5,
          child: Assets.images.props.slide09Whale.image(opacity: whaleOpacity),
        ),
        Positioned(
          left: 1141,
          top: 335,
          child:
              Assets.images.props.slide09FoodZoom.image(opacity: zoomOpacity),
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
    audioPaths: {
      'en': Assets.audios.en.slide10,
      'pt': Assets.audios.pt.slide10,
    },
    propsBuilder: (context, controller, isActive, logger) {
      final l10n = AppLocalizations.of(context)!;
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
      final canDo1Opacity = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
          parent: controller,
          curve: const Interval(0.5, 0.6, curve: Curves.easeIn),
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
      final canDo5Opacity = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
          parent: controller,
          curve: const Interval(0.9, 1, curve: Curves.easeIn),
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
          child: Assets.images.props.slide10Trash.image(opacity: trashOpacity),
        ),
        Positioned(
          left: 138.25,
          top: 122.3,
          child: Assets.images.props.slide10Whale.image(opacity: whalesOpacity),
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
          child:
              Assets.images.props.slide10TrashZoom.image(opacity: zoomOpacity),
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
          top: 750,
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
          top: 730,
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
          left: 1022.4,
          top: 574.6,
          child: FadeTransition(
            opacity: arrowOpacity,
            child: Assets.images.props.slide10Arrow.image(),
          ),
        ),
        Positioned(
          left: 1366.68,
          top: 299.1,
          child:
              Assets.images.props.slide10Bubbles.image(opacity: whalesOpacity),
        ),
        Positioned(
          left: 1199,
          top: 386,
          child: FadeTransition(
            opacity: canDo1Opacity,
            child: _InfoCoin10(
              id: 'bag',
              shouldHint: true,
              radius: 90,
              image: Assets.images.props.slide10Bag.image(),
              title: l10n.canDo1Label,
            ),
          ),
        ),
        Positioned(
          left: 1344,
          top: 224,
          child: FadeTransition(
            opacity: canDo2Opacity,
            child: _InfoCoin10(
              id: 'clothes',
              radius: 108,
              image: Assets.images.props.slide10Clothes.image(),
              title: l10n.canDo2Label,
              text: l10n.canDo2Text,
            ),
          ),
        ),
        Positioned(
          left: 1556,
          top: 340,
          child: FadeTransition(
            opacity: canDo3Opacity,
            child: _InfoCoin10(
              id: 'plastic',
              radius: 89,
              image: Assets.images.props.slide10Plastic.image(),
              title: l10n.canDo3Label,
            ),
          ),
        ),
        Positioned(
          left: 1228,
          top: 580,
          child: FadeTransition(
            opacity: canDo4Opacity,
            child: _InfoCoin10(
              id: 'veggies_fruits',
              radius: 89,
              image: Assets.images.props.slide10VeggiesFruits.image(),
              title: l10n.canDo4Label,
            ),
          ),
        ),
        Positioned(
          left: 1424,
          top: 510,
          child: FadeTransition(
            opacity: canDo5Opacity,
            child: _InfoCoin10(
              id: 'recycle',
              radius: 110,
              image: Assets.images.props.slide10Recycle.image(),
              title: l10n.canDo5Label,
            ),
          ),
        ),
        Positioned(
          left: 1422,
          top: 755.5,
          child: FadeTransition(
            opacity: flipOpacity,
            child: Column(
              children: [
                Assets.images.props.slide11FlipArrow.image(),
                const SizedBox(height: 2),
                Text(
                  l10n.touchToFlip,
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
    audioPaths: {
      'en': Assets.audios.en.slide11,
      'pt': Assets.audios.pt.slide11,
    },
    propsBuilder: (context, controller, isActive, logger) {
      final l10n = AppLocalizations.of(context)!;
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
      final weNeedTo1Opacity = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
          parent: controller,
          curve: const Interval(0.6, 0.7, curve: Curves.easeIn),
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
                              child: Assets.images.props.slide11Map1.image(),
                            ),
                            Opacity(
                              opacity: 1 - opacity.value,
                              child: Assets.images.props.slide11Map2.image(),
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
          child: Assets.images.props.slide11Whale.image(opacity: whaleOpacity),
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
          child: Assets.images.props.slide11Arrow.image(opacity: arrowOpacity),
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
          child:
              Assets.images.props.slide11Line.image(opacity: weNeedToOpacity),
        ),
        Positioned(
          left: 1166,
          top: 370,
          child: FadeTransition(
            opacity: weNeedTo1Opacity,
            child: _InfoCoin11(
              id: 'fishing',
              shouldHint: true,
              radius: 103.5,
              image: Assets.images.props.slide11Fishing.image(),
              title: l10n.needTo1Label,
            ),
          ),
        ),
        Positioned(
          left: 1396,
          top: 351,
          child: FadeTransition(
            opacity: weNeedTo2Opacity,
            child: _InfoCoin11(
              id: 'tourism',
              radius: 113.5,
              image: Assets.images.props.slide11Tourism.image(),
              title: l10n.needTo2Label,
            ),
          ),
        ),
        Positioned(
          left: 1277,
          top: 569,
          child: Column(
            children: [
              FadeTransition(
                opacity: weNeedTo3Opacity,
                child: _InfoCoin11(
                  id: 'local_products',
                  radius: 107.5,
                  image: Assets.images.props.slide11Local.image(),
                  title: l10n.needTo3Label,
                  text: l10n.needTo3Text,
                ),
              ),
              const SizedBox(height: 20),
              FadeTransition(
                opacity: flipOpacity,
                child: Column(
                  children: [
                    Assets.images.props.slide11FlipArrow.image(),
                    const SizedBox(height: 2),
                    Text(
                      l10n.touchToFlip,
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
            ],
          ),
        ),
      ];
    },
  ),
  Slide(
    background:
        Assets.images.backgrounds.slide12.image(fit: BoxFit.cover).image,
    audioPaths: {
      'en': Assets.audios.en.slide12,
      'pt': Assets.audios.pt.slide12,
    },
    propsBuilder: (context, controller, isActive, logger) {
      const reverseCurve = Interval(0, 1, curve: Curves.easeOut);
      final islandOpacity = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
          parent: controller,
          curve: const Interval(0, 0.2, curve: Curves.easeIn),
          reverseCurve: reverseCurve,
        ),
      );
      final leftWhaleOpacity = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
          parent: controller,
          curve: const Interval(0.2, 0.4, curve: Curves.easeIn),
          reverseCurve: reverseCurve,
        ),
      );
      final rightWhaleOpacity = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
          parent: controller,
          curve: const Interval(0.4, 0.6, curve: Curves.easeIn),
          reverseCurve: reverseCurve,
        ),
      );
      final whalesSoundOpacity = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
          parent: controller,
          curve: const Interval(0.6, 0.8, curve: Curves.easeIn),
          reverseCurve: reverseCurve,
        ),
      );
      final bounceSoundOpacity = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
          parent: controller,
          curve: const Interval(0.8, 0.9, curve: Curves.easeIn),
          reverseCurve: reverseCurve,
        ),
      );

      return [
        Positioned(
          left: 250.5,
          top: 20,
          child: FadeTransition(
            opacity: islandOpacity,
            child:
                Assets.images.props.slide12Island.image(opacity: islandOpacity),
          ),
        ),
        Positioned(
          left: 437,
          top: 346,
          child: Assets.images.props.slide12LeftWhale
              .image(opacity: leftWhaleOpacity),
        ),
        Positioned(
          left: 1352.5,
          top: 254,
          child: Assets.images.props.slide12RightWhale
              .image(opacity: rightWhaleOpacity),
        ),
        Positioned(
          left: 979,
          top: 397,
          child: Assets.images.props.slide12LeftSound
              .image(opacity: whalesSoundOpacity),
        ),
        Positioned(
          left: 1290,
          top: 293.5,
          child: Assets.images.props.slide12RightSound
              .image(opacity: whalesSoundOpacity),
        ),
        Positioned(
          left: 1260,
          top: 660,
          child: Assets.images.props.slide12SoundBounce
              .image(opacity: bounceSoundOpacity),
        ),
      ];
    },
  ),
  Slide(
    audioPaths: {
      'en': Assets.audios.en.slide13,
      'pt': Assets.audios.pt.slide13,
    },
    propsBuilder: (context, controller, isActive, logger) {
      final l10n = AppLocalizations.of(context)!;
      const reverseCurve = Interval(0, 1, curve: Curves.easeOut);
      final boatsOpacity = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
          parent: controller,
          curve: const Interval(0, 0.2, curve: Curves.easeIn),
          reverseCurve: reverseCurve,
        ),
      );
      final noiseOpacity = Tween<double>(begin: 0, end: 1).animate(
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
      final whaleEffectsOpacity = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
          parent: controller,
          curve: const Interval(0.6, 0.8, curve: Curves.easeIn),
          reverseCurve: reverseCurve,
        ),
      );
      final sliderOpacity = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
          parent: controller,
          curve: const Interval(0.8, 1, curve: Curves.easeIn),
          reverseCurve: reverseCurve,
        ),
      );

      return [
        Positioned(
          left: 367,
          top: -3,
          child: Assets.images.props.slide13Cargo.image(opacity: boatsOpacity),
        ),
        Positioned(
          left: 306,
          top: 224.5,
          child: FadeTransition(
            opacity: noiseOpacity,
            child: Assets.images.props.slide13CargoNoise
                .image(opacity: boatsOpacity),
          ),
        ),
        Positioned(
          left: 1527,
          top: 150,
          child: FadeTransition(
            opacity: boatsOpacity,
            child: Container(
              width: 9,
              height: 640,
              color: AppColors.blueGreen,
            ),
          ),
        ),
        Positioned(
          left: 1253.5,
          top: 22,
          child: Assets.images.props.slide13Oil.image(opacity: boatsOpacity),
        ),
        Positioned(
          left: 1331,
          top: 221,
          child:
              Assets.images.props.slide13OilNoise.image(opacity: noiseOpacity),
        ),
        Positioned(
          left: 1392.5,
          top: 676.5,
          child: Assets.images.props.slide13BottomNoise
              .image(opacity: noiseOpacity),
        ),
        Positioned(
          left: 437,
          top: 347,
          child: Assets.images.props.slide13Whale.image(opacity: whaleOpacity),
        ),
        Positioned(
          left: 818,
          top: 388,
          child: Assets.images.props.slide13WhaleEffects
              .image(opacity: whaleEffectsOpacity),
        ),
        Positioned(
          left: 934.5,
          top: 666,
          child: FadeTransition(
            opacity: sliderOpacity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                HookBuilder(
                  builder: (context) {
                    final sound = useState<double>(0);
                    final naturalPlayer = useAudioPlayer();
                    final noisePlayer = useAudioPlayer();
                    useEffect(
                      () {
                        if (isActive) {
                          naturalPlayer.setAsset(Assets.audios.oceanNatural);
                          naturalPlayer.setLoopMode(LoopMode.all);
                          naturalPlayer.setVolume(1 - sound.value);
                          noisePlayer.setAsset(Assets.audios.oceanNoise);
                          noisePlayer.setLoopMode(LoopMode.all);
                          noisePlayer.setVolume(sound.value);
                          naturalPlayer.play();
                          noisePlayer.play();
                        } else {
                          naturalPlayer
                              .stop()
                              .then((_) => naturalPlayer.seek(Duration.zero));
                          noisePlayer
                              .stop()
                              .then((_) => noisePlayer.seek(Duration.zero));
                        }
                        return;
                      },
                      [isActive],
                    );

                    useEffect(
                      () {
                        void updateSound() {
                          naturalPlayer.setVolume(1 - sound.value);
                          noisePlayer.setVolume(sound.value);
                        }

                        sound.addListener(updateSound);
                        return () => sound.removeListener(updateSound);
                      },
                      [sound],
                    );
                    return GradientSlider(
                      value: sound.value,
                      onChanged: (value) {
                        logger.logSliderValue(
                          value.toStringAsFixed(2),
                          slide: 13,
                        );
                        sound.value = value;
                      },
                    );
                  },
                ),
                const SizedBox(height: 12),
                Text(
                  l10n.noiceVolume,
                  style: const TextStyle(
                    fontFamily: FontFamily.poppins,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: AppColors.darkBlue,
                  ),
                ),
                Text(
                  l10n.realOceanNoice,
                  style: const TextStyle(
                    fontFamily: FontFamily.poppins,
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                    color: AppColors.darkBlue,
                  ),
                ),
                const SizedBox(height: 20),
                Assets.images.props.slide16SlideArrow.image(),
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
          ),
        ),
      ];
    },
  ),
  Slide(
    background:
        Assets.images.backgrounds.slide14.image(fit: BoxFit.cover).image,
    audioPaths: {
      'en': Assets.audios.en.slide14,
      'pt': Assets.audios.pt.slide14,
    },
    propsBuilder: (context, controller, isActive, logger) {
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
          child: Assets.images.props.slide14Whale.image(opacity: whaleOpacity),
        ),
        Positioned(
          left: 1150,
          top: 478,
          child: Assets.images.props.slide14WhaleEffects
              .image(opacity: effectsOpacity),
        ),
      ];
    },
  ),
  Slide(
    audioPaths: {
      'en': Assets.audios.en.slide15,
      'pt': Assets.audios.pt.slide15,
    },
    propsBuilder: (context, controller, isActive, logger) {
      const reverseCurve = Interval(0, 1, curve: Curves.easeOut);
      final cargoOpacity = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
          parent: controller,
          curve: const Interval(0, 0.2, curve: Curves.easeIn),
          reverseCurve: reverseCurve,
        ),
      );
      final leftWhaleOpacity = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
          parent: controller,
          curve: const Interval(0.2, 0.4, curve: Curves.easeIn),
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
      final dividerOpacity = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
          parent: controller,
          curve: const Interval(0.5, 0.6, curve: Curves.easeIn),
          reverseCurve: reverseCurve,
        ),
      );
      final boatOpacity = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
          parent: controller,
          curve: const Interval(0.6, 0.8, curve: Curves.easeIn),
          reverseCurve: reverseCurve,
        ),
      );
      final sharkOpacity = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
          parent: controller,
          curve: const Interval(0.8, 0.9, curve: Curves.easeIn),
          reverseCurve: reverseCurve,
        ),
      );
      final rightWhaleOpacity = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
          parent: controller,
          curve: const Interval(0.9, 1, curve: Curves.easeIn),
          reverseCurve: reverseCurve,
        ),
      );

      return [
        Positioned(
          left: 250,
          top: 60,
          child: Assets.images.props.slide15Cargo.image(opacity: cargoOpacity),
        ),
        Positioned(
          left: 155,
          top: 497.5,
          child: Assets.images.props.slide15WhaleLeft
              .image(opacity: leftWhaleOpacity),
        ),
        Positioned(
          left: 89,
          top: 360,
          child: Assets.images.props.slide15Arrow.image(opacity: arrowOpacity),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: 80,
          child: FadeTransition(
            opacity: dividerOpacity,
            child: const Line(
              color: AppColors.darkBlue,
              axis: Axis.vertical,
              strokeWidth: 3,
              size: Size(3, 820),
            ),
          ),
        ),
        Positioned(
          left: 1199.5,
          top: 191,
          child: Assets.images.props.slide15BoatPlastic
              .image(opacity: boatOpacity),
        ),
        Positioned(
          left: 1056,
          top: 466.5,
          child: Assets.images.props.slide15Shark.image(opacity: sharkOpacity),
        ),
        Positioned(
          left: 1386,
          top: 487,
          child: Assets.images.props.slide15WhaleRight
              .image(opacity: rightWhaleOpacity),
        ),
      ];
    },
  ),
  Slide(
    background:
        Assets.images.backgrounds.slide16.image(fit: BoxFit.cover).image,
    audioPaths: {
      'en': Assets.audios.en.slide16,
      'pt': Assets.audios.pt.slide16,
    },
    propsBuilder: (context, controller, isActive, logger) {
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
      ];
    },
  ),
  Slide(
    audioPaths: {
      'en': Assets.audios.en.slide17,
      'pt': Assets.audios.pt.slide17,
    },
    propsBuilder: (context, controller, isActive, logger) {
      final l10n = AppLocalizations.of(context)!;
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
                  l10n.bePartOfThisStory,
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
];

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
    final logger = ref.read(loggerProvider);
    return FlipCoin(
      onFlip: () => logger.logCoinFlip(id, slide: 7),
      shouldHint: shouldHint,
      height: 236,
      width: 236,
      front: image,
      back: Column(
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
    required this.radius,
    required this.image,
    required this.title,
    this.text,
    this.shouldHint = false,
  });

  final String id;
  final double radius;
  final Widget image;
  final String title;
  final String? text;
  final bool shouldHint;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final logger = ref.read(loggerProvider);
    return FlipCoin(
      onFlip: () => logger.logCoinFlip(id, slide: 10),
      shouldHint: shouldHint,
      height: radius * 2,
      width: radius * 2,
      front: image,
      back: Column(
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
    required this.radius,
    required this.image,
    required this.title,
    this.text,
    this.shouldHint = false,
  });

  final String id;
  final double radius;
  final Image image;
  final String title;
  final String? text;
  final bool shouldHint;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final logger = ref.read(loggerProvider);
    return FlipCoin(
      onFlip: () => logger.logCoinFlip(id, slide: 11),
      shouldHint: shouldHint,
      height: radius * 2,
      width: radius * 2,
      front: image,
      back: Column(
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
