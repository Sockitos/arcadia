import 'package:arcadia_app/gen/gen.dart';
import 'package:arcadia_app/main.dart';
import 'package:arcadia_app/widgets/slide.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Slide17 extends ConsumerWidget {
  const Slide17({
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
      slide: 17,
      currentSlide: currentSlide,
      audioPath: locale.languageCode == 'en'
          ? Assets.audios.en.slide17
          : Assets.audios.pt.slide17,
      onAudioEnd: onAudioEnd,
      propsBuilder: (context, controller) {
        const reverseCurve = Interval(0, 1, curve: Curves.easeOut);
        final leftWhaleOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0, 0.2, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );
        final rightWhaleOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.2, 0.4, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );
        final whaleEffectsOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.4, 0.6, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );
        return [
          Positioned(
            left: 176,
            top: 171,
            child: Assets.images.props.slide17LeftWhale
                .image(opacity: leftWhaleOpacity),
          ),
          Positioned(
            left: 608.5,
            top: 258.5,
            child: Assets.images.props.slide17LeftWhaleEffects
                .image(opacity: whaleEffectsOpacity),
          ),
          Positioned(
            left: 760,
            top: 541,
            child: Assets.images.props.slide17RightWhale
                .image(opacity: rightWhaleOpacity),
          ),
          Positioned(
            left: 653,
            top: 502,
            child: Assets.images.props.slide17RightWhaleEffects
                .image(opacity: whaleEffectsOpacity),
          ),
        ];
      },
    );
  }
}
