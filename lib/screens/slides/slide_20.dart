import 'package:arcadia_app/gen/gen.dart';
import 'package:arcadia_app/widgets/slide.dart';
import 'package:flutter/widgets.dart';

class Slide20 extends StatelessWidget {
  const Slide20({
    super.key,
    required this.currentSlide,
  });

  final ValueNotifier<int> currentSlide;

  @override
  Widget build(BuildContext context) {
    return Slide(
      showProps: currentSlide.value == 20,
      audioPath: Assets.audios.en.slide20,
      playAudio: currentSlide.value == 20,
      onAudioEnd: () => currentSlide.value++,
      propsBuilder: (context, controller) {
        const reverseCurve = Interval(0.9, 1, curve: Curves.easeOut);
        final bigWhaleOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0, 0.2, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );
        final smallWhaleOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.2, 0.4, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );
        return [
          Positioned(
            left: 537.5,
            top: 333.5,
            child: Opacity(
              opacity: bigWhaleOpacity.value,
              child: Assets.images.props.slide20BiglWhale.image(),
            ),
          ),
          Positioned(
            left: 968,
            top: 565,
            child: Opacity(
              opacity: smallWhaleOpacity.value,
              child: Assets.images.props.slide20SmallWhale.image(),
            ),
          ),
        ];
      },
    );
  }
}
