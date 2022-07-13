import 'package:arcadia_app/gen/gen.dart';
import 'package:arcadia_app/main.dart';
import 'package:arcadia_app/style/colors.dart';
import 'package:arcadia_app/widgets/line.dart';
import 'package:arcadia_app/widgets/slide.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Slide27 extends ConsumerWidget {
  const Slide27({
    super.key,
    required this.currentSlide,
    required this.onAudioEnd,
  });

  final int currentSlide;
  final VoidCallback onAudioEnd;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeProvider);
    return Slide(
      slide: 27,
      currentSlide: currentSlide,
      audioPath: locale.languageCode == 'en'
          ? Assets.audios.en.slide27
          : Assets.audios.pt.slide27,
      onAudioEnd: onAudioEnd,
      propsBuilder: (context, controller) {
        const reverseCurve = Interval(0, 1, curve: Curves.easeOut);
        final cargoOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0, 0.2, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );
        final leftWhaleOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.2, 0.4, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );
        final arrowOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.4, 0.5, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );
        final dividerOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.5, 0.6, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );
        final boatOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.6, 0.8, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );
        final sharkOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.8, 0.9, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );
        final rightWhaleOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.9, 1, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );

        return [
          Positioned(
            left: 250,
            top: 60,
            child:
                Assets.images.props.slide27Cargo.image(opacity: cargoOpacity),
          ),
          Positioned(
            left: 275,
            top: 497.5,
            child: Assets.images.props.slide27WhaleLeft
                .image(opacity: leftWhaleOpacity),
          ),
          Positioned(
            left: 89,
            top: 360,
            child:
                Assets.images.props.slide27Arrow.image(opacity: arrowOpacity),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 80,
            child: FadeTransition(
              opacity: dividerOpacity,
              child: const Line(
                color: AppColors.darkBlue,
                axis: Axis.vertical,
                strokeWidth: 3,
                size: Size(3, 820),
              ),
            ),
          ),
          Positioned(
            left: 1199.5,
            top: 191,
            child: Assets.images.props.slide27BoatPlastic
                .image(opacity: boatOpacity),
          ),
          Positioned(
            left: 1056,
            top: 466.5,
            child:
                Assets.images.props.slide27Shark.image(opacity: sharkOpacity),
          ),
          Positioned(
            left: 1386,
            top: 487,
            child: Assets.images.props.slide27WhaleRight
                .image(opacity: rightWhaleOpacity),
          ),
        ];
      },
    );
  }
}
