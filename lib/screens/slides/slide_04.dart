import 'dart:math';

import 'package:arcadia_app/data/co2_emissions.dart';
import 'package:arcadia_app/gen/gen.dart';
import 'package:arcadia_app/l10n/app_localizations.dart';
import 'package:arcadia_app/main.dart';
import 'package:arcadia_app/style/colors.dart';
import 'package:arcadia_app/widgets/dropdown_button.dart';
import 'package:arcadia_app/widgets/slide.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_arc_text/flutter_arc_text.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class Slide04 extends HookConsumerWidget {
  const Slide04({
    super.key,
    required this.currentSlide,
    required this.onAudioEnd,
  });

  final int currentSlide;
  final VoidCallback onAudioEnd;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final country = useState('Portugal');
    final tons = co2Emissions[country.value] ?? 0;
    final logger = ref.read(loggerProvider);
    final locale = ref.watch(localeProvider);
    return Slide(
      slide: 4,
      currentSlide: currentSlide,
      audioPath: locale.languageCode == 'en'
          ? Assets.audios.en.slide04
          : Assets.audios.pt.slide04,
      onAudioEnd: onAudioEnd,
      propsDuration: const Duration(seconds: 18),
      propsBuilder: (context, controller) {
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
        final circleEnvironmentOpacity =
            Tween<double>(begin: 0, end: 1).animate(
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
        final chartInputOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              17 / 18 + 0.6 * 1 / 18,
              17 / 18 + 0.8 * 1 / 18,
              curve: Curves.easeIn,
            ),
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
            left: 366.5,
            top: 359,
            child: Assets.images.props.slide04ChartArrows
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
          Positioned(
            left: 478,
            top: 624,
            child: FadeTransition(
              opacity: chartBubblesOpacity,
              child: SizedBox.shrink(
                child: OverflowBox(
                  maxHeight: 1000,
                  maxWidth: 1000,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    height: max(sqrt(tons * pow(129, 2) / 37000000000) * 2, 5),
                    width: max(sqrt(tons * pow(129, 2) / 37000000000) * 2, 5),
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
                      value: country.value,
                      onChanged: (value) {
                        if (value != null) {
                          logger.logCountrySelected(
                            value,
                            slide: 6,
                          );
                        }
                        country.value = value ?? country.value;
                      },
                      options: co2Emissions.keys.toList(),
                    ),
                  ),
                  const SizedBox(height: 20),
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
            child: Assets.images.props.slide04InteractionArrow
                .image(opacity: chartInputOpacity),
          ),
        ];
      },
    );
  }
}
