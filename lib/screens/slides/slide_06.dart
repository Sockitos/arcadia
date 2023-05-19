import 'dart:math';

import 'package:arcadia_app/gen/gen.dart';
import 'package:arcadia_app/l10n/app_localizations.dart';
import 'package:arcadia_app/main.dart';
import 'package:arcadia_app/style/colors.dart';
import 'package:arcadia_app/widgets/flip_coin.dart';
import 'package:arcadia_app/widgets/line.dart';
import 'package:arcadia_app/widgets/slide.dart';
import 'package:flutter/material.dart';
import 'package:flutter_arc_text/flutter_arc_text.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Slide06 extends ConsumerWidget {
  const Slide06({
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
      slide: 6,
      currentSlide: currentSlide,
      audioPath: locale.languageCode == 'en'
          ? Assets.audios.en.slide06
          : Assets.audios.pt.slide06,
      onAudioEnd: onAudioEnd,
      propsBuilder: (context, controller) {
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
                                                          fontFamily: FontFamily
                                                              .poppins,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color:
                                                              AppColors.white,
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
                                    Expanded(
                                      child: FadeTransition(
                                        opacity: graphOpacity,
                                        child: Row(
                                          children: [
                                            const Spacer(),
                                            Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Assets.images.props
                                                    .slide07FlipArrow
                                                    .image(),
                                                const SizedBox(height: 4),
                                                Text(
                                                  l10n.touchCircleToFlipN,
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                    fontFamily:
                                                        FontFamily.poppins,
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
                                                  fontFamily:
                                                      FontFamily.poppins,
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
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                  fontFamily:
                                                      FontFamily.poppins,
                                                  color: AppColors.darkBlue,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 17,
                                                  height: 1.1,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 20),
                                            FadeTransition(
                                              opacity: treesOpacity,
                                              child: _InfoCoin(
                                                id: 'tree',
                                                shouldHint: true,
                                                image: Assets
                                                    .images.props.slide06Tree
                                                    .image(),
                                                title: '1,378,380',
                                                text: l10n.trees,
                                              ),
                                            ),
                                            const SizedBox(height: 20),
                                            FadeTransition(
                                              opacity: treesOpacity,
                                              child: _InfoCoin(
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
                                  ),
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
    );
  }
}

class _InfoCoin extends ConsumerWidget {
  const _InfoCoin({
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
      onFlip: () => logger.logCoinFlip(id, slide: 6),
      shouldHint: shouldHint,
      height: 130,
      width: 130,
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
