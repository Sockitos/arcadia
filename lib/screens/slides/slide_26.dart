import 'package:arcadia_app/gen/gen.dart';
import 'package:arcadia_app/main.dart';
import 'package:arcadia_app/widgets/slide.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Slide26 extends ConsumerWidget {
  const Slide26({
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
      slide: 26,
      currentSlide: currentSlide,
      background:
          Assets.images.backgrounds.slide26.image(fit: BoxFit.cover).image,
      audioPath: locale.languageCode == 'en'
          ? Assets.audios.en.slide26
          : Assets.audios.pt.slide26,
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
            left: 569,
            top: 442,
            child:
                Assets.images.props.slide26Whale.image(opacity: whaleOpacity),
          ),
          Positioned(
            left: 1150,
            top: 478,
            child: Assets.images.props.slide26WhaleEffects
                .image(opacity: effectsOpacity),
          ),
        ];
      },
    );
  }
}
