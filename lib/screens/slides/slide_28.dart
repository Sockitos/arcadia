import 'package:arcadia_app/gen/gen.dart';
import 'package:arcadia_app/main.dart';
import 'package:arcadia_app/widgets/slide.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Slide28 extends ConsumerWidget {
  const Slide28({
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
      slide: 28,
      currentSlide: currentSlide,
      background:
          Assets.images.backgrounds.slide28.image(fit: BoxFit.cover).image,
      audioPath: locale.languageCode == 'en'
          ? Assets.audios.en.slide28
          : Assets.audios.pt.slide28,
      onAudioEnd: onAudioEnd,
      propsBuilder: (context, controller) {
        const reverseCurve = Interval(0, 1, curve: Curves.easeOut);
        final whaleOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0, 0.4, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );
        final effectsOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.4, 0.8, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );

        return [
          Positioned(
            left: 590,
            top: 377.5,
            child:
                Assets.images.props.slide28Whale.image(opacity: whaleOpacity),
          ),
          Positioned(
            left: 1173,
            top: 442,
            child: Assets.images.props.slide28WhaleEffects
                .image(opacity: effectsOpacity),
          ),
        ];
      },
    );
  }
}
