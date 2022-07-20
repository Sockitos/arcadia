import 'package:arcadia_app/gen/gen.dart';
import 'package:arcadia_app/l10n/app_localizations.dart';
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
      background:
          Assets.images.backgrounds.slide14.image(fit: BoxFit.cover).image,
      audioPath: locale.languageCode == 'en'
          ? Assets.audios.en.slide14
          : Assets.audios.pt.slide14,
      onAudioEnd: onAudioEnd,
      propsBuilder: (context, controller) {
        final l10n = AppLocalizations.of(context)!;
        const reverseCurve = Interval(0, 1, curve: Curves.easeOut);
        final whaleOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0, 0.2, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );
        final effectsOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.2, 0.4, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );
        final circleOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.4, 0.6, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );

        return [
          Positioned(
            left: 569,
            top: 442,
            child:
                Assets.images.props.slide14Whale.image(opacity: whaleOpacity),
          ),
          Positioned(
            left: 1150,
            top: 478,
            child: Assets.images.props.slide14WhaleEffects
                .image(opacity: effectsOpacity),
          ),
          Positioned(
            left: 1422,
            top: 306,
            child: FadeTransition(
              opacity: circleOpacity,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.lightBlue,
                    width: 5,
                  ),
                ),
                child: SizedBox(
                  height: 234,
                  width: 234,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        l10n.tagusRiver,
                        style: const TextStyle(
                          fontFamily: FontFamily.poppins,
                          fontWeight: FontWeight.bold,
                          fontSize: 26,
                          height: 1.2,
                          color: AppColors.lightBlue,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        l10n.humanAction,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontFamily: FontFamily.poppins,
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                          height: 1.2,
                          color: AppColors.black,
                        ),
                      ),
                    ],
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
