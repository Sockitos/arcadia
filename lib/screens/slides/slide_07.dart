import 'package:arcadia_app/gen/gen.dart';
import 'package:arcadia_app/widgets/slide.dart';
import 'package:flutter/widgets.dart';

class Slide07 extends StatelessWidget {
  const Slide07({
    super.key,
    required this.currentSlide,
  });

  final ValueNotifier<int> currentSlide;

  @override
  Widget build(BuildContext context) {
    return Slide(
      showProps: currentSlide.value == 7,
      background: Assets.images.backgrounds.slide07,
      showBackground: currentSlide.value >= 7,
      audioPath: Assets.audios.en.slide07,
      playAudio: currentSlide.value == 7,
      onAudioEnd: () => currentSlide.value++,
      propsBuilder: (context, controller) {
        const reverseCurve = Interval(0.9, 1, curve: Curves.easeOut);
        final whalesOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0, 0.2, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );

        return [
          Positioned(
            left: 544,
            top: 343,
            child: Opacity(
              opacity: whalesOpacity.value,
              child: Assets.images.props.slide07BigWhale.image(),
            ),
          ),
          Positioned(
            left: 792,
            top: 584,
            child: Opacity(
              opacity: whalesOpacity.value,
              child: Assets.images.props.slide07SmallWhale.image(),
            ),
          ),
        ];
      },
    );
  }
}
