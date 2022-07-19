import 'package:arcadia_app/gen/gen.dart';
import 'package:arcadia_app/l10n/app_localizations.dart';
import 'package:arcadia_app/main.dart';
import 'package:arcadia_app/style/colors.dart';
import 'package:arcadia_app/utils/hooks.dart';
import 'package:arcadia_app/widgets/gradient_slider.dart';
import 'package:arcadia_app/widgets/slide.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:just_audio/just_audio.dart';

class Slide13 extends ConsumerWidget {
  const Slide13({
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
      slide: 13,
      currentSlide: currentSlide,
      audioPath: locale.languageCode == 'en'
          ? Assets.audios.en.slide13
          : Assets.audios.pt.slide13,
      onAudioEnd: onAudioEnd,
      propsBuilder: (context, controller) {
        final l10n = AppLocalizations.of(context)!;
        const reverseCurve = Interval(0, 1, curve: Curves.easeOut);
        final boatsOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0, 0.2, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );
        final noiseOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.2, 0.4, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );
        final whaleOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.4, 0.6, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );
        final whaleEffectsOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.6, 0.8, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );
        final sliderOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.8, 1, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );

        return [
          Positioned(
            left: 367,
            top: -3,
            child:
                Assets.images.props.slide13Cargo.image(opacity: boatsOpacity),
          ),
          Positioned(
            left: 306,
            top: 224.5,
            child: FadeTransition(
              opacity: noiseOpacity,
              child: Assets.images.props.slide13CargoNoise
                  .image(opacity: boatsOpacity),
            ),
          ),
          Positioned(
            left: 1527,
            top: 150,
            child: FadeTransition(
              opacity: boatsOpacity,
              child: Container(
                width: 9,
                height: 640,
                color: AppColors.blueGreen,
              ),
            ),
          ),
          Positioned(
            left: 1253.5,
            top: 22,
            child: Assets.images.props.slide13Oil.image(opacity: boatsOpacity),
          ),
          Positioned(
            left: 1331,
            top: 221,
            child: Assets.images.props.slide13OilNoise
                .image(opacity: noiseOpacity),
          ),
          Positioned(
            left: 1392.5,
            top: 676.5,
            child: Assets.images.props.slide13BottomNoise
                .image(opacity: noiseOpacity),
          ),
          Positioned(
            left: 437,
            top: 347,
            child:
                Assets.images.props.slide13Whale.image(opacity: whaleOpacity),
          ),
          Positioned(
            left: 818,
            top: 388,
            child: Assets.images.props.slide13WhaleEffects
                .image(opacity: whaleEffectsOpacity),
          ),
          Positioned(
            left: 934.5,
            top: 666,
            child: FadeTransition(
              opacity: sliderOpacity,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  HookBuilder(
                    builder: (context) {
                      final sound = useState<double>(0);
                      final naturalPlayer = useAudioPlayer();
                      final noisePlayer = useAudioPlayer();
                      useEffect(
                        () {
                          if (currentSlide == 13) {
                            naturalPlayer.setAsset(Assets.audios.oceanNatural);
                            naturalPlayer.setLoopMode(LoopMode.all);
                            naturalPlayer.setVolume(1 - sound.value);
                            noisePlayer.setAsset(Assets.audios.oceanNoise);
                            noisePlayer.setLoopMode(LoopMode.all);
                            noisePlayer.setVolume(sound.value);
                            naturalPlayer.play();
                            noisePlayer.play();
                          } else {
                            naturalPlayer
                                .stop()
                                .then((_) => naturalPlayer.seek(Duration.zero));
                            noisePlayer
                                .stop()
                                .then((_) => noisePlayer.seek(Duration.zero));
                          }
                          return;
                        },
                        [currentSlide],
                      );

                      useEffect(
                        () {
                          void updateSound() {
                            naturalPlayer.setVolume(1 - sound.value);
                            noisePlayer.setVolume(sound.value);
                          }

                          sound.addListener(updateSound);
                          return () => sound.removeListener(updateSound);
                        },
                        [sound],
                      );
                      return GradientSlider(
                        value: sound.value,
                        onChanged: (value) {
                          logger.logSliderValue(
                            value.toStringAsFixed(2),
                            slide: 13,
                          );
                          sound.value = value;
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 12),
                  Text(
                    l10n.noiceVolume,
                    style: const TextStyle(
                      fontFamily: FontFamily.poppins,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: AppColors.darkBlue,
                    ),
                  ),
                  Text(
                    l10n.realOceanNoice,
                    style: const TextStyle(
                      fontFamily: FontFamily.poppins,
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                      color: AppColors.darkBlue,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Assets.images.props.slide16SlideArrow.image(),
                  Text(
                    l10n.slide,
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
