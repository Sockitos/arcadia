import 'dart:math';

import 'package:arcadia_app/gen/gen.dart';
import 'package:arcadia_app/l10n/app_localizations.dart';
import 'package:arcadia_app/style/colors.dart';
import 'package:arcadia_app/widgets/line.dart';
import 'package:arcadia_app/widgets/slide.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_arc_text/flutter_arc_text.dart';

class Slide10 extends StatelessWidget {
  const Slide10({
    super.key,
    required this.currentSlide,
  });

  final ValueNotifier<int> currentSlide;

  @override
  Widget build(BuildContext context) {
    return Slide(
      showProps: currentSlide.value == 10,
      audioPath: Assets.audios.en.slide10,
      playAudio: currentSlide.value == 10,
      onAudioEnd: () => currentSlide.value++,
      propsBuilder: (context, controller) {
        final l10n = AppLocalizations.of(context)!;

        const reverseCurve = Interval(0.9, 1, curve: Curves.easeOut);

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

        final smallWhaleOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.5, 0.6, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );

        final smallWhalesOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.6, 0.7, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );

        final treeOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.7, 0.8, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );

        final treesOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.8, 0.9, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );

        final fishOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.9, 1, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );

        return [
          Positioned(
            left: 532.7,
            top: 85.1,
            child: Opacity(
              opacity: co2Opacity.value,
              child: Assets.images.props.slide10TopLeftArrow.image(),
            ),
          ),
          Positioned(
            left: 517.2,
            top: 57.5,
            child: Opacity(
              opacity: co2Opacity.value,
              child: const Text(
                'CO₂',
                style: TextStyle(
                  fontFamily: FontFamily.quotesScript,
                  color: AppColors.red,
                  fontSize: 32,
                ),
              ),
            ),
          ),
          Positioned(
            left: 1503.3,
            top: 46.9,
            child: Opacity(
              opacity: co2Opacity.value,
              child: Assets.images.props.slide10TopRightTopArrow.image(),
            ),
          ),
          Positioned(
            left: 1524.9,
            top: 16.1,
            child: Opacity(
              opacity: co2Opacity.value,
              child: Transform.rotate(
                angle: -0.041283333333 * pi,
                child: const Text(
                  'CO₂',
                  style: TextStyle(
                    fontFamily: FontFamily.quotesScript,
                    color: AppColors.red,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 1428.3,
            top: 105.3,
            child: Opacity(
              opacity: co2Opacity.value,
              child: Assets.images.props.slide10TopRightBottomArrow.image(),
            ),
          ),
          Positioned(
            left: 1387.1,
            top: 120.8,
            child: Opacity(
              opacity: co2Opacity.value,
              child: Transform.rotate(
                angle: -1.9744888889 * pi,
                child: const Text(
                  'CO₂',
                  style: TextStyle(
                    fontFamily: FontFamily.quotesScript,
                    color: AppColors.red,
                    fontSize: 32,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 1014,
            top: 294,
            child: Opacity(
              opacity: cardOpacity.value,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: AppColors.lighterBlue,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: SizedBox(
                  width: 671,
                  height: 563,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 40,
                      top: 50,
                      right: 40,
                      bottom: 50,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Opacity(
                          opacity: titleOpacity.value,
                          child: Row(
                            children: [
                              const Spacer(flex: 2),
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
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
                              const Spacer(flex: 3),
                            ],
                          ),
                        ),
                        const SizedBox(height: 73),
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Column(
                                  children: [
                                    const Spacer(),
                                    Opacity(
                                      opacity: smallWhaleOpacity.value,
                                      child: Column(
                                        children: [
                                          Assets.images.props.slide10SmallWhale
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
                                    const Spacer(flex: 2),
                                    Opacity(
                                      opacity: smallWhalesOpacity.value,
                                      child: Column(
                                        children: [
                                          Assets.images.props
                                              .slide10GroupSmallWhales
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
                                    const Spacer(),
                                  ],
                                ),
                              ),
                              Opacity(
                                opacity: graphOpacity.value,
                                child: Stack(
                                  alignment: Alignment.topCenter,
                                  children: [
                                    const DecoratedBox(
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
                                      children: const [
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
                                                  fontWeight: FontWeight.bold,
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
                                            fontFamily: FontFamily.poppins,
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
                              Expanded(
                                flex: 3,
                                child: Column(
                                  children: [
                                    Opacity(
                                      opacity: treeOpacity.value,
                                      child: Text(
                                        l10n.equivalentToCO2,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontFamily: FontFamily.poppins,
                                          color: AppColors.darkBlue,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 17,
                                          height: 1.1,
                                        ),
                                      ),
                                    ),
                                    const Spacer(),
                                    Opacity(
                                      opacity: treeOpacity.value,
                                      child: Column(
                                        children: [
                                          Assets.images.props.slide10Tree
                                              .image(),
                                          const SizedBox(height: 10),
                                          const Text(
                                            '1,378,380',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontFamily: FontFamily.poppins,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.green,
                                              fontSize: 21,
                                              height: 1.1,
                                            ),
                                          ),
                                          Text(
                                            l10n.trees,
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                              fontFamily: FontFamily.poppins,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.darkBlue,
                                              fontSize: 17,
                                              height: 1.1,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Spacer(flex: 2),
                                    Opacity(
                                      opacity: treesOpacity.value,
                                      child: Column(
                                        children: [
                                          Assets.images.props.slide10GroupTrees
                                              .image(),
                                          const SizedBox(height: 10),
                                          const Text(
                                            '7,351,400',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontFamily: FontFamily.poppins,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.green,
                                              fontSize: 21,
                                              height: 1.1,
                                            ),
                                          ),
                                          Text(
                                            l10n.trees,
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                              fontFamily: FontFamily.poppins,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.darkBlue,
                                              fontSize: 17,
                                              height: 1.1,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Spacer(flex: 3),
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
          ),
          Positioned(
            left: 192.4,
            top: 332,
            child: Opacity(
              opacity: whaleOpacity.value,
              child: Assets.images.props.slide09BigWhale.image(),
            ),
          ),
          Positioned(
            left: 539,
            top: 315,
            child: Opacity(
              opacity: co2Opacity.value,
              child: Assets.images.props.slide10WhaleTopArrow.image(),
            ),
          ),
          Positioned(
            left: 479.2,
            top: 307.6,
            child: Opacity(
              opacity: co2Opacity.value,
              child: Transform.rotate(
                angle: -0.11477222222 * pi,
                child: const Text(
                  'CO₂',
                  style: TextStyle(
                    fontFamily: FontFamily.quotesScript,
                    color: AppColors.red,
                    fontSize: 32,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 847,
            top: 519.9,
            child: Opacity(
              opacity: co2Opacity.value,
              child: Assets.images.props.slide10WhaleBottomArrow.image(),
            ),
          ),
          Positioned(
            left: 872.9,
            top: 554,
            child: Opacity(
              opacity: co2Opacity.value,
              child: Transform.rotate(
                angle: -0.060455555556 * pi,
                child: const Text(
                  'CO₂',
                  style: TextStyle(
                    fontFamily: FontFamily.quotesScript,
                    color: AppColors.red,
                    fontSize: 32,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 905.6,
            top: 763.5,
            child: Opacity(
              opacity: fishOpacity.value,
              child: Assets.images.props.slide09Fish.image(),
            ),
          ),
          Positioned(
            left: 880,
            top: 1040,
            child: Opacity(
              opacity: fishOpacity.value,
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
          Positioned(
            left: 1160,
            top: 560,
            child: Opacity(
              opacity: smallWhaleOpacity.value,
              child: const Line(
                size: Size(105, 1),
                color: AppColors.darkBlue,
                axis: Axis.horizontal,
                strokeWidth: 1,
              ),
            ),
          ),
          Positioned(
            left: 1160,
            top: 695,
            child: Opacity(
              opacity: smallWhalesOpacity.value,
              child: const Line(
                size: Size(52, 1),
                color: AppColors.darkBlue,
                axis: Axis.horizontal,
                strokeWidth: 1,
              ),
            ),
          ),
          Positioned(
            left: 1345,
            top: 600,
            child: Opacity(
              opacity: treeOpacity.value,
              child: const Line(
                size: Size(140, 1),
                color: AppColors.darkGreen,
                axis: Axis.horizontal,
                strokeWidth: 1,
              ),
            ),
          ),
          Positioned(
            left: 1405,
            top: 720,
            child: Opacity(
              opacity: treesOpacity.value,
              child: const Line(
                size: Size(75, 1),
                color: AppColors.darkGreen,
                axis: Axis.horizontal,
                strokeWidth: 1,
              ),
            ),
          ),
        ];
      },
    );
  }
}
