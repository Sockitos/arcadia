import 'package:arcadia_app/gen/gen.dart';
import 'package:arcadia_app/l10n/app_localizations.dart';
import 'package:arcadia_app/main.dart';
import 'package:arcadia_app/style/colors.dart';
import 'package:arcadia_app/widgets/gradient_slider.dart';
import 'package:arcadia_app/widgets/slide.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_arc_text/flutter_arc_text.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Slide21 extends ConsumerWidget {
  const Slide21({
    super.key,
    required this.currentSlide,
    required this.onAudioEnd,
  });

  final int currentSlide;
  final VoidCallback onAudioEnd;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final logger = ref.read(loggerProvider);
    final locale = ref.watch(localeProvider);
    return Slide(
      slide: 21,
      currentSlide: currentSlide,
      audioPath: locale.languageCode == 'en'
          ? Assets.audios.en.slide21
          : Assets.audios.pt.slide21,
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
        final infoOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.1, 0.3, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );
        final whaleOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.3, 0.5, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );
        final whaleEffectsOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.5, 0.6, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );
        final arrowOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.6, 0.65, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );
        final weNeedToOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.65, 0.7, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );
        final weNeedTo1Opacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.7, 0.8, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );
        final weNeedTo2Opacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.8, 0.9, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );
        final weNeedTo3Opacity = Tween<double>(begin: 0, end: 1).animate(
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
                          const SizedBox(height: 20),
                          Stack(
                            children: [
                              Opacity(
                                opacity: opacity.value,
                                child: Assets.images.props.slide21Map1.image(),
                              ),
                              Opacity(
                                opacity: 1 - opacity.value,
                                child: Assets.images.props.slide21Map2.image(),
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
                                    value,
                                    slide: 21,
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
                                  width: 387,
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
                              Assets.images.props.slide21SlideArrow.image(),
                              Text(
                                l10n.slide,
                                style: const TextStyle(
                                  fontFamily: FontFamily.poppins,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 17,
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
            child:
                Assets.images.props.slide21Whale.image(opacity: whaleOpacity),
          ),
          Positioned(
            left: 354,
            top: 514,
            child: Assets.images.props.slide21WhaleEffects
                .image(opacity: whaleEffectsOpacity),
          ),
          Positioned(
            left: 1042,
            top: 251,
            child:
                Assets.images.props.slide21Arrow.image(opacity: arrowOpacity),
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
            left: 1321,
            top: 318,
            child:
                Assets.images.props.slide21Line.image(opacity: weNeedToOpacity),
          ),
          Positioned(
            left: 1184,
            top: 384,
            child: FadeTransition(
              opacity: weNeedTo1Opacity,
              child: _InfoCircle(
                radius: 93.5,
                title: l10n.needTo1Label,
                text: l10n.needTo1Text,
              ),
            ),
          ),
          Positioned(
            left: 1396,
            top: 351,
            child: FadeTransition(
              opacity: weNeedTo2Opacity,
              child: _InfoCircle(
                radius: 113.5,
                title: l10n.needTo2Label,
                text: l10n.needTo2Text,
              ),
            ),
          ),
          Positioned(
            left: 1277,
            top: 569,
            child: FadeTransition(
              opacity: weNeedTo3Opacity,
              child: _InfoCircle(
                radius: 107.5,
                title: l10n.needTo3Label,
                text: l10n.needTo3Text,
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
    required this.text,
  });

  final double radius;
  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color(0xFFD4EEF2),
        border: Border.all(
          color: AppColors.lightBlue,
          width: 4,
        ),
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
                fontSize: 21,
                height: 1.2,
                color: AppColors.darkBlue,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              text,
              style: const TextStyle(
                fontFamily: FontFamily.poppins,
                fontSize: 17,
                height: 1.2,
                color: AppColors.darkBlue,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
