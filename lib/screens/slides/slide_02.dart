import 'package:arcadia_app/gen/gen.dart';
import 'package:arcadia_app/widgets/slide.dart';
import 'package:flutter/widgets.dart';

class Slide02 extends StatelessWidget {
  const Slide02({
    super.key,
    required this.currentSlide,
  });

  final ValueNotifier<int> currentSlide;

  @override
  Widget build(BuildContext context) {
    return Slide(
      showProps: currentSlide.value == 2,
      audioPath: Assets.audios.en.slide02,
      playAudio: currentSlide.value == 2,
      onAudioEnd: () => currentSlide.value++,
      propsBuilder: (context, controller) {
        const reverseCurve = Interval(0.9, 1, curve: Curves.easeOut);
        final fishesOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0, 0.2, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );
        final whalesOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.2, 0.4, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );
        final scubaOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.4, 0.6, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );
        return [
          Positioned(
            left: 183,
            top: 133,
            child: Opacity(
              opacity: fishesOpacity.value,
              child: Assets.images.props.slide02Fishes1.image(),
            ),
          ),
          Positioned(
            left: 581,
            top: 105,
            child: Opacity(
              opacity: fishesOpacity.value,
              child: Assets.images.props.slide02Fishes2.image(),
            ),
          ),
          Positioned(
            left: 1523,
            top: 877,
            child: Opacity(
              opacity: fishesOpacity.value,
              child: Assets.images.props.slide02Fishes3.image(),
            ),
          ),
          Positioned(
            left: 538,
            top: 345,
            child: Opacity(
              opacity: whalesOpacity.value,
              child: Assets.images.props.slide02BigWhale.image(),
            ),
          ),
          Positioned(
            left: 956,
            top: 571,
            child: Opacity(
              opacity: whalesOpacity.value,
              child: Assets.images.props.slide02SmallWhale.image(),
            ),
          ),
          Positioned(
            left: 641,
            top: 571,
            child: Opacity(
              opacity: scubaOpacity.value,
              child: Assets.images.props.slide02Scubba.image(),
            ),
          ),
        ];
      },
    );
  }
}
