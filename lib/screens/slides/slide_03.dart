import 'package:arcadia_app/gen/gen.dart';
import 'package:arcadia_app/style/colors.dart';
import 'package:arcadia_app/widgets/slide.dart';
import 'package:flutter/widgets.dart';

class Slide03 extends StatelessWidget {
  const Slide03({
    super.key,
    required this.currentSlide,
  });

  final ValueNotifier<int> currentSlide;

  @override
  Widget build(BuildContext context) {
    return Slide(
      showProps: currentSlide.value == 3,
      audioPath: Assets.audios.en.slide03,
      playAudio: currentSlide.value == 3,
      onAudioEnd: () => currentSlide.value++,
      propsBuilder: (context, controller) {
        const reverseCurve = Interval(0.9, 1, curve: Curves.easeOut);
        final fishesOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0, 0, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );
        final circleOpacity = Tween<double>(begin: 0, end: 1).animate(
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
        final chartOpacity = Tween<double>(begin: 0, end: 1).animate(
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
            left: 1523,
            top: 877,
            child: Opacity(
              opacity: fishesOpacity.value,
              child: Assets.images.props.slide02Fishes3.image(),
            ),
          ),
          Positioned(
            left: 941,
            top: 257,
            child: Opacity(
              opacity: chartOpacity.value,
              child: const DecoratedBox(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.white,
                ),
                child: SizedBox(
                  width: 603,
                  height: 603,
                ),
              ),
            ),
          ),
          Positioned(
            left: 458,
            top: 217,
            child: Opacity(
              opacity: circleOpacity.value,
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.lighterBlue,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: Assets.images.props.slide03Circle.image(),
                ),
              ),
            ),
          ),
          Positioned(
            left: 365,
            top: 559,
            child: Opacity(
              opacity: whalesOpacity.value,
              child: Assets.images.props.slide03BigWhale.image(),
            ),
          ),
          Positioned(
            left: 305,
            top: 365,
            child: Opacity(
              opacity: whalesOpacity.value,
              child: Assets.images.props.slide03SmallWhale.image(),
            ),
          ),
        ];
      },
    );
  }
}
