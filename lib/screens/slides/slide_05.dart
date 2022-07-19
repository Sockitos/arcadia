import 'dart:math';

import 'package:arcadia_app/gen/gen.dart';
import 'package:arcadia_app/l10n/app_localizations.dart';
import 'package:arcadia_app/main.dart';
import 'package:arcadia_app/style/colors.dart';
import 'package:arcadia_app/widgets/dropdown_button.dart';
import 'package:arcadia_app/widgets/line.dart';
import 'package:arcadia_app/widgets/slide.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Slide05 extends HookConsumerWidget {
  const Slide05({
    super.key,
    required this.currentSlide,
    required this.onAudioEnd,
  });

  final int currentSlide;
  final VoidCallback onAudioEnd;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = useState(170);
    final ratio = 3000 / height.value;
    final logger = ref.read(loggerProvider);
    final locale = ref.watch(localeProvider);
    return Slide(
      slide: 5,
      currentSlide: currentSlide,
      audioPath: locale.languageCode == 'en'
          ? Assets.audios.en.slide05
          : Assets.audios.pt.slide05,
      background:
          Assets.images.backgrounds.slide05.image(fit: BoxFit.cover).image,
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
                                    '${(height.value / 100).toStringAsFixed(2)}m',
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
                                  filledWidth: height.value * 314.2 / 3000,
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
            child:
                Assets.images.props.slide05Curve.image(opacity: circleOpacity),
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
                      value: height.value,
                      onChanged: (value) {
                        if (value != null) {
                          logger.logHeightSelected(
                            value,
                            slide: 4,
                          );
                        }
                        height.value = value ?? height.value;
                      },
                      options: [for (var i = 50; i <= 300; i += 5) i],
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
            child: Assets.images.props.slide05InteractionArrow
                .image(opacity: inputOpacity),
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
            child: _ColoredBox(
              height: 6,
              width: totalWidth - (i * filledWidth),
              color: AppColors.lightBlue40,
            ),
          ),
      ]
    ];
    return Row(
      children: (invert ? bars.reversed : bars).toList(),
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
