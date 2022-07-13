import 'package:arcadia_app/gen/gen.dart';
import 'package:arcadia_app/main.dart';
import 'package:arcadia_app/widgets/slide.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Slide02 extends ConsumerWidget {
  const Slide02({
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
      slide: 2,
      currentSlide: currentSlide,
      audioPath: locale.languageCode == 'en'
          ? Assets.audios.en.slide02
          : Assets.audios.pt.slide02,
      onAudioEnd: onAudioEnd,
      propsBuilder: (context, controller) {
        const reverseCurve = Interval(0, 1, curve: Curves.easeOut);
        final fishesOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0, 0.2, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );
        final bigWhaleOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.2, 0.4, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );
        final smallWhaleOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.4, 0.6, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );
        final scubaOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.6, 0.8, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );
        return [
          Positioned(
            left: 183,
            top: 133,
            child: Assets.images.props.slide02Fishes1
                .image(opacity: fishesOpacity),
          ),
          Positioned(
            left: 581,
            top: 105,
            child: Assets.images.props.slide02Fishes2
                .image(opacity: fishesOpacity),
          ),
          Positioned(
            left: 1523,
            top: 877,
            child: Assets.images.props.slide02Fishes3
                .image(opacity: fishesOpacity),
          ),
          Positioned(
            left: 538,
            top: 345,
            child: Assets.images.props.slide02BigWhale
                .image(opacity: bigWhaleOpacity),
          ),
          Positioned(
            left: 956,
            top: 571,
            child: Assets.images.props.slide02SmallWhale
                .image(opacity: smallWhaleOpacity),
          ),
          Positioned(
            left: 641,
            top: 571,
            child:
                Assets.images.props.slide02Scubba.image(opacity: scubaOpacity),
          ),
        ];
      },
    );
  }
}
