import 'package:arcadia_app/gen/gen.dart';
import 'package:arcadia_app/widgets/slide.dart';
import 'package:flutter/widgets.dart';

class Slide08 extends StatelessWidget {
  const Slide08({
    super.key,
    required this.currentSlide,
  });

  final ValueNotifier<int> currentSlide;

  @override
  Widget build(BuildContext context) {
    return Slide(
      showProps: currentSlide.value == 8,
      audioPath: Assets.audios.en.slide08,
      playAudio: currentSlide.value == 8,
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

        return [
          Positioned(
            left: 768,
            top: 505,
            child: Opacity(
              opacity: whaleOpacity.value,
              child: Assets.images.props.slide08Whale.image(),
            ),
          ),
        ];
      },
    );
  }
}
