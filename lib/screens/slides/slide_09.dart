import 'dart:math';

import 'package:arcadia_app/gen/gen.dart';
import 'package:arcadia_app/l10n/app_localizations.dart';
import 'package:arcadia_app/style/colors.dart';
import 'package:arcadia_app/widgets/slide.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Slide09 extends StatelessWidget {
  const Slide09({
    super.key,
    required this.currentSlide,
  });

  final ValueNotifier<int> currentSlide;

  @override
  Widget build(BuildContext context) {
    return Slide(
      showProps: currentSlide.value == 9,
      audioPath: Assets.audios.en.slide09,
      background: Assets.images.backgrounds.slide09,
      showBackground: currentSlide.value >= 9,
      playAudio: currentSlide.value == 9,
      onAudioEnd: () => currentSlide.value++,
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

        final arrowOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.2, 0.3, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );

        final fishOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.3, 0.4, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );

        final cardOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.4, 0.5, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );

        final whaleCardOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.5, 0.6, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );

        final dinoOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.6, 0.7, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );

        final sharkOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.7, 0.8, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );

        final busOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.8, 0.9, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );

        final youOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.9, 1, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );

        return [
          Positioned(
            left: 336,
            top: 565,
            child: Opacity(
              opacity: arrowOpacity.value,
              child: Assets.images.props.slide09BigArrow.image(),
            ),
          ),
          Positioned(
            left: 1096,
            top: 254,
            child: Opacity(
              opacity: cardOpacity.value,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: AppColors.lighterBlue,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(63),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Opacity(
                        opacity: whaleCardOpacity.value,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Assets.images.props.slide09SmallWhale.image(),
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
                                const Text(
                                  ' 30m',
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
                      Opacity(
                        opacity: dinoOpacity.value,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              alignment: Alignment.bottomLeft,
                              children: [
                                Column(
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
                                        ),
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(right: 7),
                                      child: Text(
                                        ' 1.7m',
                                        style: TextStyle(
                                          fontFamily: FontFamily.poppins,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.darkBlue,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                    const _BarBar(
                                      totalWidth: 314.2,
                                      filledWidth: 18,
                                    ),
                                    const SizedBox(height: 15),
                                    Row(
                                      children: [
                                        Assets.images.props.slide09People
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
                                Assets.images.props.slide09Dinossaur.image(),
                              ],
                            ),
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
                                const Text(
                                  ' 23m',
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
                      const SizedBox(height: 30),
                      Opacity(
                        opacity: sharkOpacity.value,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Assets.images.props.slide09Shark.image(),
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
                                const Text(
                                  ' 6.4m',
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
                      Opacity(
                        opacity: busOpacity.value,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Assets.images.props.slide09Bus.image(),
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
                                const Text(
                                  ' 12m',
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
            left: 192.4,
            top: 331.6,
            child: Opacity(
              opacity: whaleOpacity.value,
              child: Assets.images.props.slide09BigWhale.image(),
            ),
          ),
          Positioned(
            left: 535.7,
            top: 584.7,
            child: Opacity(
              opacity: arrowOpacity.value,
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
            left: 906,
            top: 753,
            child: Opacity(
              opacity: fishOpacity.value,
              child: Assets.images.props.slide09Fish.image(),
            ),
          ),
          Positioned(
            left: 924.4,
            top: 687.2,
            child: Opacity(
              opacity: fishOpacity.value,
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
          Positioned(
            left: 1487.4,
            top: 431.3,
            child: Opacity(
              opacity: youOpacity.value,
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
        ];
      },
    );
  }
}

class _BarBar extends StatelessWidget {
  const _BarBar({
    required this.totalWidth,
    required this.filledWidth,
  });

  final double totalWidth;
  final double filledWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (var i = 1; i <= (totalWidth / filledWidth); i++) ...[
          if (i == 1)
            Padding(
              padding: const EdgeInsets.only(bottom: 3),
              child: Row(
                children: [
                  // const _ColoredBox(
                  //   width: 1,
                  //   height: 12,
                  //   color: AppColors.lightBlue,
                  // ),
                  _ColoredBox(
                    width: filledWidth, // - 2,
                    height: 6,
                    color: AppColors.lightBlue,
                  ),
                  // const _ColoredBox(
                  //   width: 1,
                  //   height: 12,
                  //   color: AppColors.lightBlue,
                  // ),
                ],
              ),
            )
          else
            Padding(
              padding: i.isEven
                  ? const EdgeInsets.only(top: 3)
                  : const EdgeInsets.only(bottom: 3),
              child: _ColoredBox(
                width: filledWidth,
                height: 6,
                color: AppColors.evenLighterBlue,
              ),
            ),
          if (i + 1 > (totalWidth / filledWidth))
            Padding(
              padding: (i + 1).isEven
                  ? const EdgeInsets.only(top: 3)
                  : const EdgeInsets.only(bottom: 3),
              child: _ColoredBox(
                height: 6,
                width: totalWidth - (i * filledWidth),
                color: AppColors.evenLighterBlue,
              ),
            ),
        ]
      ],
    );
  }
}

class _ColoredBox extends StatelessWidget {
  const _ColoredBox({
    required this.width,
    required this.height,
    required this.color,
  });
  final double width;
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: color,
      ),
      child: SizedBox(
        width: width,
        height: height,
      ),
    );
  }
}
