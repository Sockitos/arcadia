import 'package:arcadia_app/gen/gen.dart';
import 'package:arcadia_app/widgets/slide.dart';
import 'package:flutter/widgets.dart';

class Slide09 extends StatelessWidget {
  const Slide09({
    super.key,
    required this.currentSlide,
  });

  final ValueNotifier<int> currentSlide;

  @override
  Widget build(BuildContext context) {
    return Slide(
      showProps: currentSlide.value == 9,
      audioPath: Assets.audios.en.slide09,
      background: Assets.images.backgrounds.slide11,
      showBackground: currentSlide.value >= 9,
      playAudio: currentSlide.value == 9,
      onAudioEnd: () => currentSlide.value++,
      propsBuilder: (context, controller) {
        const reverseCurve = Interval(0.9, 1, curve: Curves.easeOut);

        return [];
      },
    );
  }
}
