import 'dart:math';

import 'package:arcadia_app/gen/gen.dart';
import 'package:arcadia_app/main.dart';
import 'package:arcadia_app/style/colors.dart';
import 'package:arcadia_app/widgets/slide.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Slide14 extends ConsumerWidget {
  const Slide14({
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
      slide: 14,
      currentSlide: currentSlide,
      audioPath: locale.languageCode == 'en'
          ? Assets.audios.en.slide14
          : Assets.audios.pt.slide14,
      onAudioEnd: onAudioEnd,
      propsBuilder: (context, controller) {
        const reverseCurve = Interval(0, 1, curve: Curves.easeOut);
        final whalesOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0, 0.2, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );
        final trashOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.2, 0.4, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );
        final zoomOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.4, 0.6, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );
        final textOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.6, 0.8, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );

        return [
          Positioned(
            left: 434,
            top: 159,
            child:
                Assets.images.props.slide14Trash.image(opacity: trashOpacity),
          ),
          Positioned(
            left: 370,
            top: 170,
            child:
                Assets.images.props.slide14Whale.image(opacity: whalesOpacity),
          ),
          Positioned(
            left: 734,
            top: 352,
            child: Assets.images.props.slide14OtherWhale
                .image(opacity: whalesOpacity),
          ),
          Positioned(
            left: 1039,
            top: 256.5,
            child: Assets.images.props.slide14OtherWhaleBubbles
                .image(opacity: whalesOpacity),
          ),
          Positioned(
            left: 1039,
            top: 521,
            child: Assets.images.props.slide14TrashZoom
                .image(opacity: zoomOpacity),
          ),
          Positioned(
            left: 1290,
            top: 755,
            child: FadeTransition(
              opacity: textOpacity,
              child: Transform.rotate(
                angle: -pi / 10,
                child: const Text(
                  '22kg!!!',
                  style: TextStyle(
                    fontFamily: FontFamily.quotesScript,
                    fontSize: 36,
                    color: AppColors.red,
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
