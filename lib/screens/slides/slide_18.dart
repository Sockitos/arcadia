import 'package:arcadia_app/gen/gen.dart';
import 'package:arcadia_app/widgets/slide.dart';
import 'package:flutter/widgets.dart';

class Slide18 extends StatelessWidget {
  const Slide18({
    super.key,
    required this.currentSlide,
  });

  final ValueNotifier<int> currentSlide;

  @override
  Widget build(BuildContext context) {
    return Slide(
      showProps: currentSlide.value == 18,
      audioPath: Assets.audios.en.slide18,
      playAudio: currentSlide.value == 18,
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
            left: 176,
            top: 171,
            child: Opacity(
              opacity: whalesOpacity.value,
              child: Assets.images.props.slide18Whale1.image(),
            ),
          ),
          Positioned(
            left: 653,
            top: 502,
            child: Opacity(
              opacity: whalesOpacity.value,
              child: Assets.images.props.slide18Whale2.image(),
            ),
          ),
        ];
      },
    );
  }
}
