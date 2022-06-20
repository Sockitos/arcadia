import 'package:arcadia_app/gen/gen.dart';
import 'package:arcadia_app/widgets/slide.dart';
import 'package:flutter/widgets.dart';

class Slide19 extends StatelessWidget {
  const Slide19({
    super.key,
    required this.currentSlide,
  });

  final ValueNotifier<int> currentSlide;

  @override
  Widget build(BuildContext context) {
    return Slide(
      showProps: currentSlide.value == 19,
      audioPath: Assets.audios.en.slide19,
      playAudio: currentSlide.value == 19,
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
        final heartOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.2, 0.4, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );
        return [
          Positioned(
            left: 151,
            top: 236,
            child: Opacity(
              opacity: whalesOpacity.value,
              child: Assets.images.props.slide19Whale1.image(),
            ),
          ),
          Positioned(
            left: 994,
            top: 416.5,
            child: Opacity(
              opacity: whalesOpacity.value,
              child: Assets.images.props.slide19Whale2.image(),
            ),
          ),
          Positioned(
            left: 960,
            top: 420,
            child: Opacity(
              opacity: heartOpacity.value,
              child: Assets.images.props.slide19Heart.image(),
            ),
          ),
        ];
      },
    );
  }
}
