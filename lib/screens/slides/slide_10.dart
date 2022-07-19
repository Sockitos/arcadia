import 'dart:math';

import 'package:arcadia_app/gen/gen.dart';
import 'package:arcadia_app/l10n/app_localizations.dart';
import 'package:arcadia_app/main.dart';
import 'package:arcadia_app/style/colors.dart';
import 'package:arcadia_app/widgets/flip_coin.dart';
import 'package:arcadia_app/widgets/slide.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_arc_text/flutter_arc_text.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Slide10 extends ConsumerWidget {
  const Slide10({
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
      slide: 10,
      currentSlide: currentSlide,
      audioPath: locale.languageCode == 'en'
          ? Assets.audios.en.slide10
          : Assets.audios.pt.slide10,
      onAudioEnd: onAudioEnd,
      propsBuilder: (context, controller) {
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
            child:
                Assets.images.props.slide10Trash.image(opacity: trashOpacity),
          ),
          Positioned(
            left: 138.25,
            top: 122.3,
            child:
                Assets.images.props.slide10Whale.image(opacity: whalesOpacity),
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
            child: Assets.images.props.slide10Bubbles
                .image(opacity: whalesOpacity),
          ),
          Positioned(
            left: 1199,
            top: 386,
            child: FadeTransition(
              opacity: canDo1Opacity,
              child: _InfoCoin(
                id: 'bag',
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
              child: _InfoCoin(
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
              child: _InfoCoin(
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
              child: _InfoCoin(
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
              child: _InfoCoin(
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
    );
  }
}

class _InfoCoin extends ConsumerWidget {
  const _InfoCoin({
    required this.id,
    required this.radius,
    required this.image,
    required this.title,
    this.text,
  });

  final String id;
  final double radius;
  final Widget image;
  final String title;
  final String? text;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final logger = ref.read(loggerProvider);
    return FlipCoin(
      onFlip: () => logger.logCoinFlip(id, slide: 10),
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
