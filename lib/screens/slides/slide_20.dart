import 'dart:math';

import 'package:arcadia_app/gen/gen.dart';
import 'package:arcadia_app/l10n/app_localizations.dart';
import 'package:arcadia_app/main.dart';
import 'package:arcadia_app/style/colors.dart';
import 'package:arcadia_app/widgets/line.dart';
import 'package:arcadia_app/widgets/slide.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

enum LocationOption {
  newYork,
  nairobi,
  kabul,
}

class Slide20 extends HookConsumerWidget {
  const Slide20({
    super.key,
    required this.currentSlide,
    required this.onAudioEnd,
  });

  final int currentSlide;
  final VoidCallback onAudioEnd;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final location = useState<LocationOption?>(null);
    final locale = ref.watch(localeProvider);
    return Slide(
      slide: 20,
      currentSlide: currentSlide,
      background:
          Assets.images.backgrounds.slide20.image(fit: BoxFit.cover).image,
      audioPath: locale.languageCode == 'en'
          ? Assets.audios.en.slide20
          : Assets.audios.pt.slide20,
      onAudioEnd: onAudioEnd,
      propsBuilder: (context, controller) {
        final l10n = AppLocalizations.of(context)!;
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
        final routeOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.3, 0.4, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );
        final routeInfoOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.4, 0.5, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );
        final arrowOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.5, 0.6, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );

        final pinsOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.6, 0.8, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );

        return [
          Positioned(
            left: 0,
            right: 0,
            top: 120,
            child: FadeTransition(
              opacity: circleOpacity,
              child: Center(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(500),
                    color: AppColors.lightBlue20,
                  ),
                  child: const SizedBox(
                    width: 1288,
                    height: 762,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 288,
            top: 158,
            child: Assets.images.props.slide20Map.image(opacity: mapOpacity),
          ),
          Positioned(
            left: 727.4,
            top: 295.7,
            child: Assets.images.props.slide20WhaleRoute
                .image(opacity: routeOpacity),
          ),
          Positioned(
            left: 700,
            top: 219,
            child: FadeTransition(
              opacity: routeInfoOpacity,
              child: Container(
                height: 60,
                width: 136,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  border: Border.all(
                    color: AppColors.red,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    l10n.feedingGrounds,
                    style: const TextStyle(
                      fontFamily: FontFamily.poppins,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      height: 1.1,
                      color: AppColors.darkBlue,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 796,
            top: 287,
            child: FadeTransition(
              opacity: routeInfoOpacity,
              child: Transform.rotate(
                angle: pi / 4,
                child: const Line(
                  color: AppColors.red,
                  size: Size(38, 2),
                  axis: Axis.horizontal,
                ),
              ),
            ),
          ),
          Positioned(
            left: 636,
            top: 492,
            child: FadeTransition(
              opacity: routeInfoOpacity,
              child: Container(
                height: 60,
                width: 150,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  border: Border.all(
                    color: AppColors.red,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    l10n.breedingGround,
                    style: const TextStyle(
                      fontFamily: FontFamily.poppins,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      height: 1.1,
                      color: AppColors.darkBlue,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 750,
            top: 485,
            child: FadeTransition(
              opacity: routeInfoOpacity,
              child: Transform.rotate(
                angle: -pi / 4,
                child: const Line(
                  color: AppColors.red,
                  size: Size(38, 2),
                  axis: Axis.horizontal,
                ),
              ),
            ),
          ),
          Positioned(
            left: 816.7,
            top: 461.1,
            child: Assets.images.props.slide20Arrow
                .image(opacity: routeInfoOpacity),
          ),
          Positioned(
            left: 700,
            top: 750,
            child: FadeTransition(
              opacity: arrowOpacity,
              child: Transform.rotate(
                angle: -pi / 18,
                child: Text(
                  l10n.baltazarMigration,
                  style: const TextStyle(
                    fontFamily: FontFamily.quotesScript,
                    color: AppColors.blue,
                    fontSize: 35,
                    height: 1.2,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          if (location.value == LocationOption.newYork) ...[
            Positioned(
              left: 615.9,
              top: 388.5,
              child: Assets.images.props.slide20Ny.image(),
            ),
            Positioned(
              left: 685,
              top: 350,
              child: Transform.rotate(
                angle: -pi / 25,
                child: const Text(
                  '5,435 km',
                  style: TextStyle(
                    fontFamily: FontFamily.quotesScript,
                    color: AppColors.blue,
                    fontSize: 28,
                    height: 1.2,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
          if (location.value == LocationOption.nairobi) ...[
            Positioned(
              left: 899.9,
              top: 421.4,
              child: Assets.images.props.slide20N.image(),
            ),
            Positioned(
              left: 992,
              top: 457,
              child: Transform.rotate(
                angle: -pi / 25,
                child: const Text(
                  '6,455 km',
                  style: TextStyle(
                    fontFamily: FontFamily.quotesScript,
                    color: AppColors.blue,
                    fontSize: 28,
                    height: 1.2,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
          if (location.value == LocationOption.kabul) ...[
            Positioned(
              left: 899.4,
              top: 405.8,
              child: Assets.images.props.slide20K.image(),
            ),
            Positioned(
              left: 1035,
              top: 368,
              child: Transform.rotate(
                angle: -pi / 25,
                child: const Text(
                  '6,798 km',
                  style: TextStyle(
                    fontFamily: FontFamily.quotesScript,
                    color: AppColors.blue,
                    fontSize: 28,
                    height: 1.2,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
          Positioned(
            left: 1080,
            top: 750,
            child: FadeTransition(
              opacity: pinsOpacity,
              child: Column(
                children: [
                  Assets.images.props.slide20Click.image(),
                  const SizedBox(height: 8),
                  Text(
                    l10n.clickToSeeDistance,
                    style: const TextStyle(
                      fontFamily: FontFamily.poppins,
                      fontSize: 16,
                      height: 1.2,
                      color: AppColors.red,
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
          Positioned(
            left: 894,
            top: 418,
            child: FadeTransition(
              opacity: pinsOpacity,
              child: Container(
                height: 9,
                width: 9,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.blue,
                ),
              ),
            ),
          ),
          Positioned(
            left: 601.5,
            top: 374,
            child: FadeTransition(
              opacity: pinsOpacity,
              child: InkWell(
                onTap: () {
                  if (location.value == LocationOption.newYork) {
                    location.value = null;
                  } else {
                    location.value = LocationOption.newYork;
                  }
                },
                child: Assets.images.props.slide20Pin.image(),
              ),
            ),
          ),
          Positioned(
            left: 522,
            top: 401,
            child: FadeTransition(
              opacity: pinsOpacity,
              child: const Text(
                'New York',
                style: TextStyle(
                  fontFamily: FontFamily.poppins,
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  height: 1.2,
                  color: AppColors.darkBlue,
                ),
              ),
            ),
          ),
          Positioned(
            left: 1034.5,
            top: 561,
            child: FadeTransition(
              opacity: pinsOpacity,
              child: InkWell(
                onTap: () {
                  if (location.value == LocationOption.nairobi) {
                    location.value = null;
                  } else {
                    location.value = LocationOption.nairobi;
                  }
                },
                child: Assets.images.props.slide20Pin.image(),
              ),
            ),
          ),
          Positioned(
            left: 1059.5,
            top: 590,
            child: FadeTransition(
              opacity: pinsOpacity,
              child: const Text(
                'Nairobi',
                style: TextStyle(
                  fontFamily: FontFamily.poppins,
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  height: 1.2,
                  color: AppColors.darkBlue,
                ),
              ),
            ),
          ),
          Positioned(
            left: 1157.5,
            top: 409,
            child: FadeTransition(
              opacity: pinsOpacity,
              child: InkWell(
                onTap: () {
                  if (location.value == LocationOption.kabul) {
                    location.value = null;
                  } else {
                    location.value = LocationOption.kabul;
                  }
                },
                child: Assets.images.props.slide20Pin.image(),
              ),
            ),
          ),
          Positioned(
            left: 1182.5,
            top: 438,
            child: FadeTransition(
              opacity: pinsOpacity,
              child: const Text(
                'Kabul',
                style: TextStyle(
                  fontFamily: FontFamily.poppins,
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  height: 1.2,
                  color: AppColors.darkBlue,
                ),
              ),
            ),
          ),
          Positioned(
            left: 1471.5,
            top: 364,
            child:
                Assets.images.props.slide20Whale.image(opacity: whaleOpacity),
          ),
        ];
      },
    );
  }
}
