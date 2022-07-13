import 'dart:math';

import 'package:arcadia_app/data/plastic_created.dart';
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

class Slide15 extends HookConsumerWidget {
  const Slide15({
    super.key,
    required this.currentSlide,
    required this.onAudioEnd,
  });

  final int currentSlide;
  final VoidCallback onAudioEnd;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final country = useState('Portugal');
    final tons = plasticCreated[country.value] ?? 0;
    final elephants = (tons / 5896.7).round();
    final logger = ref.read(loggerProvider);
    final locale = ref.watch(localeProvider);
    return Slide(
      slide: 15,
      currentSlide: currentSlide,
      audioPath: locale.languageCode == 'en'
          ? Assets.audios.en.slide15
          : Assets.audios.pt.slide15,
      onAudioEnd: onAudioEnd,
      propsBuilder: (context, controller) {
        final l10n = AppLocalizations.of(context)!;
        const reverseCurve = Interval(0, 1, curve: Curves.easeOut);
        final countryOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0, 0.1, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );
        final tonsOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.1, 0.2, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );
        final elephantsOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.2, 0.3, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );
        final whatCanDoOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.3, 0.4, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );
        final whatCan1DoOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.4, 0.5, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );
        final whatCan2DoOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.5, 0.6, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );
        final whatCan3DoOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.6, 0.7, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );
        final whatCan4DoOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.7, 0.8, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );
        final whatCan5DoOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.8, 0.9, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );
        final whatCan6DoOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.9, 1, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );

        return [
          Positioned(
            left: 338,
            top: 206,
            child: FadeTransition(
              opacity: countryOpacity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.plasticWasteCreate,
                    style: const TextStyle(
                      fontFamily: FontFamily.poppins,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      height: 1.2,
                      color: AppColors.darkBlue,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      l10n.whereYouFrom,
                      style: const TextStyle(
                        fontFamily: FontFamily.poppins,
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                        height: 1.2,
                        color: AppColors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    width: 200,
                    child: DropdownField<String>(
                      value: country.value,
                      onChanged: (value) {
                        if (value != null) {
                          logger.logCountrySelected(
                            value,
                            slide: 15,
                          );
                        }
                        country.value = value ?? country.value;
                      },
                      options: plasticCreated.keys.toList()
                        ..sort((a, b) => a.compareTo(b)),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 359.8,
            top: 360.7,
            child: Assets.images.props.slide15Line.image(opacity: tonsOpacity),
          ),
          Positioned(
            left: 405,
            top: 340,
            child: FadeTransition(
              opacity: tonsOpacity,
              child: Row(
                children: [
                  DecoratedBox(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.orange,
                    ),
                    child: SizedBox(
                      height: 180,
                      width: 180,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 10),
                          Text(
                            NumberFormat.decimalPattern().format(tons),
                            style: const TextStyle(
                              fontFamily: FontFamily.poppins,
                              fontWeight: FontWeight.bold,
                              fontSize: 28,
                              height: 1.2,
                              color: AppColors.darkBlue,
                            ),
                          ),
                          Text(
                            l10n.tons,
                            style: const TextStyle(
                              fontFamily: FontFamily.poppins,
                              fontWeight: FontWeight.bold,
                              fontSize: 23,
                              height: 1.1,
                              color: AppColors.darkBlue,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 25),
                  Container(
                    height: 15,
                    width: 16,
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: AppColors.darkBlue,
                          width: 4,
                        ),
                        bottom: BorderSide(
                          color: AppColors.darkBlue,
                          width: 4,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 22),
                        child: Assets.images.props.slide15Elephant.image(),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '$elephants',
                        style: const TextStyle(
                          fontFamily: FontFamily.poppins,
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                          height: 1.2,
                          color: AppColors.darkBlue,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        l10n.adultAfricanElephants,
                        style: const TextStyle(
                          fontFamily: FontFamily.poppins,
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                          height: 1.2,
                          color: AppColors.darkBlue,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 58),
                    ],
                  )
                ],
              ),
            ),
          ),
          if (elephants > 0)
            Positioned(
              left: 633,
              top: 561,
              child: FadeTransition(
                opacity: elephantsOpacity,
                child: _Elephants(elephants: elephants),
              ),
            ),
          Positioned(
            left: 980,
            top: 630,
            child: FadeTransition(
              opacity: whatCanDoOpacity,
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
            left: 970,
            top: 610,
            child: FadeTransition(
              opacity: whatCanDoOpacity,
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
            left: 852.4,
            top: 454.6,
            child: FadeTransition(
              opacity: whatCanDoOpacity,
              child: Assets.images.props.slide15Arrow.image(),
            ),
          ),
          Positioned(
            left: 1077,
            top: 236,
            child: FadeTransition(
              opacity: whatCan3DoOpacity,
              child: Assets.images.props.slide15Bubbles.image(),
            ),
          ),
          Positioned(
            left: 1025,
            top: 388,
            child: FadeTransition(
              opacity: whatCan1DoOpacity,
              child: _InfoCircle(
                radius: 90,
                title: l10n.canDo1Label,
              ),
            ),
          ),
          Positioned(
            left: 1183,
            top: 231,
            child: FadeTransition(
              opacity: whatCan2DoOpacity,
              child: _InfoCircle(
                radius: 109,
                title: l10n.canDo2Label,
                text: l10n.canDo2Text,
              ),
            ),
          ),
          Positioned(
            left: 1422,
            top: 306,
            child: FadeTransition(
              opacity: whatCan3DoOpacity,
              child: _InfoCircle(
                radius: 108,
                title: l10n.canDo3Label,
                text: l10n.canDo3Text,
              ),
            ),
          ),
          Positioned(
            left: 1093,
            top: 582,
            child: FadeTransition(
              opacity: whatCan4DoOpacity,
              child: _InfoCircle(
                radius: 89,
                title: l10n.canDo4Label,
              ),
            ),
          ),
          Positioned(
            left: 1251.5,
            top: 464,
            child: FadeTransition(
              opacity: whatCan5DoOpacity,
              child: _InfoCircle(
                radius: 89,
                title: l10n.canDo5Label,
              ),
            ),
          ),
          Positioned(
            left: 1308,
            top: 653,
            child: FadeTransition(
              opacity: whatCan6DoOpacity,
              child: _InfoCircle(
                radius: 110,
                title: l10n.canDo6Label,
              ),
            ),
          ),
        ];
      },
    );
  }
}

class _InfoCircle extends StatelessWidget {
  const _InfoCircle({
    required this.radius,
    required this.title,
    this.text,
  });

  final double radius;
  final String title;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.white,
      ),
      child: SizedBox(
        width: radius * 2,
        height: radius * 2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontFamily: FontFamily.poppins,
                fontWeight: FontWeight.bold,
                fontSize: 20,
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
                  fontSize: 16,
                  height: 1.2,
                  color: AppColors.darkBlue,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _Elephants extends StatelessWidget {
  const _Elephants({
    required this.elephants,
  });

  final int elephants;

  @override
  Widget build(BuildContext context) {
    final columns = max(10, sqrt(elephants).ceil());
    final rows = (elephants / columns).ceil();

    final size = 300 / (1.8 * columns - 0.8);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var r = 0; r < rows; r++) ...[
          Row(
            children: [
              for (var c = 1; c <= columns; c++)
                if (r * columns + c <= elephants) ...[
                  DecoratedBox(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF998D84),
                    ),
                    child: SizedBox(
                      height: size,
                      width: size,
                    ),
                  ),
                  SizedBox(width: 0.8 * size),
                ],
            ],
          ),
          SizedBox(height: 0.8 * size),
        ]
      ],
    );
  }
}
