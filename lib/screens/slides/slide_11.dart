import 'dart:math';

import 'package:arcadia_app/gen/assets.gen.dart';
import 'package:arcadia_app/gen/fonts.gen.dart';
import 'package:arcadia_app/l10n/app_localizations.dart';
import 'package:arcadia_app/style/colors.dart';
import 'package:arcadia_app/widgets/slide.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_arc_text/flutter_arc_text.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class Slide11 extends StatelessWidget {
  const Slide11({
    super.key,
    required this.currentSlide,
  });

  final ValueNotifier<int> currentSlide;

  @override
  Widget build(BuildContext context) {
    return Slide(
      showProps: currentSlide.value == 11,
      shouldStop: true,
      playAudio: false,
      propsBuilder: (context, controller) {
        final l10n = AppLocalizations.of(context)!;
        const reverseCurve = Interval(0.9, 1, curve: Curves.easeOut);

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
            left: 562,
            top: 117.3,
            child: Opacity(
              opacity: backgroundCircleOpacity.value,
              child: const DecoratedBox(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.lighterBlue,
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
            left: 965,
            child: Opacity(
              opacity: titleOpacity.value,
              child: const ArcText(
                radius: 800,
                text: 'But we must do our part!',
                textStyle: TextStyle(
                  fontFamily: FontFamily.quotesScript,
                  color: AppColors.blue,
                  fontSize: 44,
                ),
                startAngle: -pi / 13,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 80),
              Opacity(
                opacity: tipOpacity.value,
                child: const DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppColors.red,
                  ),
                  child: SizedBox(
                    width: 20,
                    height: 20,
                  ),
                ),
              ),
              Opacity(
                opacity: titleOpacity.value,
                child: const Text(
                  'touch to flip',
                  style: TextStyle(
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
                  Opacity(
                    opacity: circle1Opacity.value,
                    child: _ImageCoin(
                      image: Assets.images.props.slide11Food1.image(),
                      title: l10n.ourPart1Label,
                      content: l10n.ourPart1Text,
                    ),
                  ),
                  const SizedBox(width: 70),
                  Opacity(
                    opacity: circle2Opacity.value,
                    child: _ImageCoin(
                      image: Assets.images.props.slide11Food2.image(),
                      title: l10n.ourPart2Label,
                      content: l10n.ourPart2Text,
                    ),
                  ),
                  const SizedBox(width: 70),
                  Opacity(
                    opacity: circle3Opacity.value,
                    child: _ImageCoin(
                      image: Assets.images.props.slide11House.image(),
                      title: l10n.ourPart3Label,
                      content: l10n.ourPart3Text,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Opacity(
                    opacity: circle4Opacity.value,
                    child: _ImageCoin(
                      image: Assets.images.props.slide11Vehicles.image(),
                      title: l10n.ourPart4Label,
                      content: l10n.ourPart4Text,
                    ),
                  ),
                  const SizedBox(width: 70),
                  Opacity(
                    opacity: circle5Opacity.value,
                    child: _ImageCoin(
                      image: Assets.images.props.slide11Stuff.image(),
                      title: l10n.ourPart5Label,
                      content: l10n.ourPart5Text,
                    ),
                  ),
                  const SizedBox(width: 70),
                  Opacity(
                    opacity: circle6Opacity.value,
                    child: _ImageCoin(
                      image: Assets.images.props.slide11Hands.image(),
                      title: l10n.ourPart6Label,
                      content: l10n.ourPart6Text,
                    ),
                  ),
                ],
              )
            ],
          ),
          Positioned(
            left: 1461.5,
            top: 409,
            child: Opacity(
              opacity: whaleOpacity.value,
              child: Assets.images.props.slide11Whale.image(),
            ),
          ),
        ];
      },
    );
  }
}

class _ImageCoin extends HookWidget {
  const _ImageCoin({
    required this.image,
    required this.title,
    required this.content,
  });

  final Widget image;
  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return FlipCard(
      front: DecoratedBox(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.white,
        ),
        child: SizedBox(
          height: 236,
          width: 236,
          child: Center(
            child: image,
          ),
        ),
      ),
      back: DecoratedBox(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.white,
        ),
        child: SizedBox(
          height: 236,
          width: 236,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: FontFamily.poppins,
                  color: AppColors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 23,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                content,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: FontFamily.poppins,
                  color: AppColors.blue,
                  fontSize: 17,
                  height: 1.2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
