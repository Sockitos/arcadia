import 'package:arcadia_app/gen/gen.dart';
import 'package:arcadia_app/main.dart';
import 'package:arcadia_app/widgets/slide.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Slide07 extends ConsumerWidget {
  const Slide07({
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
      slide: 7,
      currentSlide: currentSlide,
      background:
          Assets.images.backgrounds.slide07.image(fit: BoxFit.cover).image,
      audioPath: locale.languageCode == 'en'
          ? Assets.audios.en.slide07
          : Assets.audios.pt.slide07,
      onAudioEnd: onAudioEnd,
      propsBuilder: (context, controller) {
        const reverseCurve = Interval(0, 1, curve: Curves.easeOut);
        final bigWhaleOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0, 0.2, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );
        final smallWhaleOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.2, 0.4, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );

        return [
          Positioned(
            left: 544,
            top: 343,
            child: Assets.images.props.slide07BigWhale
                .image(opacity: bigWhaleOpacity),
          ),
          Positioned(
            left: 792,
            top: 584,
            child: Assets.images.props.slide07SmallWhale
                .image(opacity: smallWhaleOpacity),
          ),
        ];
      },
    );
  }
}
