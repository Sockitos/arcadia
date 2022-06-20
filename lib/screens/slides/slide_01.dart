import 'package:arcadia_app/gen/gen.dart';
import 'package:arcadia_app/style/colors.dart';
import 'package:arcadia_app/widgets/slide.dart';
import 'package:flutter/widgets.dart';

class Slide01 extends StatelessWidget {
  const Slide01({
    super.key,
    required this.currentSlide,
  });

  final ValueNotifier<int> currentSlide;

  @override
  Widget build(BuildContext context) {
    return Slide(
      showProps: currentSlide.value == 1,
      background: Assets.images.backgrounds.slide01,
      showBackground: currentSlide.value >= 1,
      backgroundDuration: Duration.zero,
      audioPath: Assets.audios.en.slide01,
      playAudio: currentSlide.value == 1,
      onAudioEnd: () => currentSlide.value++,
      propsBuilder: (context, controller) {
        const reverseCurve = Interval(0.9, 1, curve: Curves.easeOut);
        final circleOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0, 0.2, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );
        final mapOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.2, 0.4, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );
        final whaleOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.4, 0.6, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );
        final hereOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.6, 0.8, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );
        return [
          Center(
            child: Opacity(
              opacity: circleOpacity.value,
              child: const DecoratedBox(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.white,
                ),
                child: SizedBox(
                  width: 692,
                  height: 692,
                ),
              ),
            ),
          ),
          Center(
            child: Opacity(
              opacity: mapOpacity.value,
              child: Assets.images.props.slide01Map.image(),
            ),
          ),
          Positioned(
            left: 800,
            top: 470,
            child: Opacity(
              opacity: whaleOpacity.value,
              child: Assets.images.props.slide01Whale.image(),
            ),
          ),
          Positioned(
            left: 800,
            top: 360,
            child: Opacity(
              opacity: hereOpacity.value,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.white,
                  border: Border.all(color: AppColors.darkBlue, width: 2),
                ),
                child: const SizedBox(
                  width: 85,
                  height: 85,
                  child: Center(
                    child: Text(
                      "You're\nhere!",
                      style: TextStyle(
                        fontFamily: FontFamily.poppins,
                        fontWeight: FontWeight.bold,
                        fontSize: 19,
                        color: AppColors.darkBlue,
                        height: 1.2,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ];
      },
    );
  }
}
