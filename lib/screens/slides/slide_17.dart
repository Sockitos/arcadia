import 'package:arcadia_app/gen/gen.dart';
import 'package:arcadia_app/widgets/slide.dart';
import 'package:flutter/widgets.dart';

class Slide17 extends StatelessWidget {
  const Slide17({
    super.key,
    required this.currentSlide,
  });

  final ValueNotifier<int> currentSlide;

  @override
  Widget build(BuildContext context) {
    return Slide(
      showProps: currentSlide.value == 17,
      background: Assets.images.backgrounds.slide17,
      showBackground: currentSlide.value >= 17,
      audioPath: Assets.audios.en.slide17,
      playAudio: currentSlide.value == 17,
      onAudioEnd: () => currentSlide.value++,
      propsBuilder: (context, controller) {
        const reverseCurve = Interval(0.9, 1, curve: Curves.easeOut);
        final whaleOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0, 0.2, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );
        final soundOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.2, 0.4, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );
        return [
          Positioned(
            left: 462,
            top: 303,
            child: Opacity(
              opacity: whaleOpacity.value,
              child: Assets.images.props.slide17Whale.image(),
            ),
          ),
          Positioned(
            left: 1561,
            top: 258,
            child: Opacity(
              opacity: soundOpacity.value,
              child: Assets.images.props.slide17Sound.image(),
            ),
          ),
        ];
      },
    );
  }
}
