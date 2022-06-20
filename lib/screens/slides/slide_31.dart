import 'package:arcadia_app/gen/gen.dart';
import 'package:arcadia_app/widgets/slide.dart';
import 'package:flutter/widgets.dart';

class Slide31 extends StatelessWidget {
  const Slide31({
    super.key,
    required this.currentSlide,
  });

  final ValueNotifier<int> currentSlide;

  @override
  Widget build(BuildContext context) {
    return Slide(
      showProps: currentSlide.value == 31,
      background: Assets.images.backgrounds.slide31,
      showBackground: currentSlide.value >= 31,
      audioPath: Assets.audios.en.slide31,
      playAudio: currentSlide.value == 31,
      onAudioEnd: () => currentSlide.value++,
      propsBuilder: (context, controller) {
        const reverseCurve = Interval(0.9, 1, curve: Curves.easeOut);
        final oldWhaleOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0, 0.2, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );
        final deadWhaleOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.2, 0.4, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );
        return [
          Positioned(
            left: 865,
            top: 241,
            child: Opacity(
              opacity: oldWhaleOpacity.value,
              child: Assets.images.props.slide31OldWhale.image(),
            ),
          ),
          Positioned(
            left: 873,
            top: 793,
            child: Opacity(
              opacity: deadWhaleOpacity.value,
              child: Assets.images.props.slide31DeadWhale.image(),
            ),
          ),
        ];
      },
    );
  }
}
