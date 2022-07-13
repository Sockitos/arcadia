import 'package:arcadia_app/gen/gen.dart';
import 'package:arcadia_app/main.dart';
import 'package:arcadia_app/widgets/slide.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Slide22 extends ConsumerWidget {
  const Slide22({
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
      slide: 22,
      currentSlide: currentSlide,
      background:
          Assets.images.backgrounds.slide22.image(fit: BoxFit.cover).image,
      audioPath: locale.languageCode == 'en'
          ? Assets.audios.en.slide22
          : Assets.audios.pt.slide22,
      onAudioEnd: onAudioEnd,
      propsBuilder: (context, controller) {
        const reverseCurve = Interval(0, 1, curve: Curves.easeOut);
        final islandOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0, 0.2, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );
        final leftWhaleOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.2, 0.4, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );
        final rightWhaleOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.4, 0.6, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );
        final whalesSoundOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.6, 0.8, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );
        final bounceSoundOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.8, 0.9, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );

        return [
          Positioned(
            left: 250.5,
            top: 20,
            child: FadeTransition(
              opacity: islandOpacity,
              child: Assets.images.props.slide22Island
                  .image(opacity: islandOpacity),
            ),
          ),
          Positioned(
            left: 437,
            top: 346,
            child: Assets.images.props.slide22LeftWhale
                .image(opacity: leftWhaleOpacity),
          ),
          Positioned(
            left: 1352.5,
            top: 254,
            child: Assets.images.props.slide22RightWhale
                .image(opacity: rightWhaleOpacity),
          ),
          Positioned(
            left: 979,
            top: 397,
            child: Assets.images.props.slide22LeftSound
                .image(opacity: whalesSoundOpacity),
          ),
          Positioned(
            left: 1290,
            top: 293.5,
            child: Assets.images.props.slide22RightSound
                .image(opacity: whalesSoundOpacity),
          ),
          Positioned(
            left: 1260,
            top: 660,
            child: Assets.images.props.slide22SoundBounce
                .image(opacity: bounceSoundOpacity),
          ),
        ];
      },
    );
  }
}
