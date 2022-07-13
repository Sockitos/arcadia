import 'dart:async';

import 'package:arcadia_app/data/sources.dart';
import 'package:arcadia_app/gen/gen.dart';
import 'package:arcadia_app/l10n/app_localizations.dart';
import 'package:arcadia_app/main.dart';
import 'package:arcadia_app/screens/slides/slide_01.dart';
import 'package:arcadia_app/screens/slides/slide_02.dart';
import 'package:arcadia_app/screens/slides/slide_03.dart';
import 'package:arcadia_app/screens/slides/slide_04.dart';
import 'package:arcadia_app/screens/slides/slide_05.dart';
import 'package:arcadia_app/screens/slides/slide_06.dart';
import 'package:arcadia_app/screens/slides/slide_07.dart';
import 'package:arcadia_app/screens/slides/slide_08.dart';
import 'package:arcadia_app/screens/slides/slide_09.dart';
import 'package:arcadia_app/screens/slides/slide_10.dart';
import 'package:arcadia_app/screens/slides/slide_11.dart';
import 'package:arcadia_app/screens/slides/slide_12.dart';
import 'package:arcadia_app/screens/slides/slide_13.dart';
import 'package:arcadia_app/screens/slides/slide_14.dart';
import 'package:arcadia_app/screens/slides/slide_15.dart';
import 'package:arcadia_app/screens/slides/slide_16.dart';
import 'package:arcadia_app/screens/slides/slide_17.dart';
import 'package:arcadia_app/screens/slides/slide_18.dart';
import 'package:arcadia_app/screens/slides/slide_19.dart';
import 'package:arcadia_app/screens/slides/slide_20.dart';
import 'package:arcadia_app/screens/slides/slide_21.dart';
import 'package:arcadia_app/screens/slides/slide_22.dart';
import 'package:arcadia_app/screens/slides/slide_23.dart';
import 'package:arcadia_app/screens/slides/slide_24.dart';
import 'package:arcadia_app/screens/slides/slide_25.dart';
import 'package:arcadia_app/screens/slides/slide_26.dart';
import 'package:arcadia_app/screens/slides/slide_27.dart';
import 'package:arcadia_app/screens/slides/slide_28.dart';
import 'package:arcadia_app/screens/slides/slide_29.dart';
import 'package:arcadia_app/screens/slides/slide_30.dart';
import 'package:arcadia_app/screens/slides/slide_31.dart';
import 'package:arcadia_app/style/colors.dart';
import 'package:arcadia_app/widgets/arrow.dart';
import 'package:arcadia_app/widgets/circle_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qr_flutter/qr_flutter.dart';

const slidesWithStops = [4, 6, 9, 10, 11, 15, 20, 21, 23, 25, 30];

class SlideshowScreen extends HookConsumerWidget {
  const SlideshowScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final logger = ref.read(loggerProvider);
    final showSources = useState(false);
    final currentSlide = useState(1);

    void onAudioEnd() {
      if (showSources.value) return;
      if (slidesWithStops.contains(currentSlide.value)) {
        final timer = Timer(
          const Duration(minutes: 5),
          () {
            logger.logSlideTimeout(currentSlide.value);
            context.go('/');
          },
        );

        void cancel() {
          timer.cancel();
          currentSlide.removeListener(cancel);
        }

        currentSlide.addListener(cancel);
        return;
      }
      if (currentSlide.value == 31) {
        logger.logEnd();
        final timer = Timer(
          const Duration(minutes: 2),
          () {
            logger.logEndTimeout();
            context.go('/');
          },
        );

        void cancel() {
          timer.cancel();
          currentSlide.removeListener(cancel);
        }

        currentSlide.addListener(cancel);
        return;
      }
      logger.logAutoNextSlide(currentSlide.value);
      currentSlide.value++;
    }

    return Scaffold(
      body: Stack(
        children: [
          Slide01(
            currentSlide: currentSlide.value,
            onAudioEnd: onAudioEnd,
          ),
          Slide02(
            currentSlide: currentSlide.value,
            onAudioEnd: onAudioEnd,
          ),
          Slide03(
            currentSlide: currentSlide.value,
            onAudioEnd: onAudioEnd,
          ),
          Slide04(
            currentSlide: currentSlide.value,
            onAudioEnd: onAudioEnd,
          ),
          Slide05(
            currentSlide: currentSlide.value,
            onAudioEnd: onAudioEnd,
          ),
          Slide06(
            currentSlide: currentSlide.value,
            onAudioEnd: onAudioEnd,
          ),
          Slide07(
            currentSlide: currentSlide.value,
            onAudioEnd: onAudioEnd,
          ),
          Slide08(
            currentSlide: currentSlide.value,
            onAudioEnd: onAudioEnd,
          ),
          Slide09(
            currentSlide: currentSlide.value,
            onAudioEnd: onAudioEnd,
          ),
          Slide10(
            currentSlide: currentSlide.value,
            onAudioEnd: onAudioEnd,
          ),
          Slide11(
            currentSlide: currentSlide.value,
            onAudioEnd: onAudioEnd,
          ),
          Slide12(
            currentSlide: currentSlide.value,
            onAudioEnd: onAudioEnd,
          ),
          Slide13(
            currentSlide: currentSlide.value,
            onAudioEnd: onAudioEnd,
          ),
          Slide14(
            currentSlide: currentSlide.value,
            onAudioEnd: onAudioEnd,
          ),
          Slide15(
            currentSlide: currentSlide.value,
            onAudioEnd: onAudioEnd,
          ),
          Slide16(
            currentSlide: currentSlide.value,
            onAudioEnd: onAudioEnd,
          ),
          Slide17(
            currentSlide: currentSlide.value,
            onAudioEnd: onAudioEnd,
          ),
          Slide18(
            currentSlide: currentSlide.value,
            onAudioEnd: onAudioEnd,
          ),
          Slide19(
            currentSlide: currentSlide.value,
            onAudioEnd: onAudioEnd,
          ),
          Slide20(
            currentSlide: currentSlide.value,
            onAudioEnd: onAudioEnd,
          ),
          Slide21(
            currentSlide: currentSlide.value,
            onAudioEnd: onAudioEnd,
          ),
          Slide22(
            currentSlide: currentSlide.value,
            onAudioEnd: onAudioEnd,
          ),
          Slide23(
            currentSlide: currentSlide.value,
            onAudioEnd: onAudioEnd,
          ),
          Slide24(
            currentSlide: currentSlide.value,
            onAudioEnd: onAudioEnd,
          ),
          Slide25(
            currentSlide: currentSlide.value,
            onAudioEnd: onAudioEnd,
          ),
          Slide26(
            currentSlide: currentSlide.value,
            onAudioEnd: onAudioEnd,
          ),
          Slide27(
            currentSlide: currentSlide.value,
            onAudioEnd: onAudioEnd,
          ),
          Slide28(
            currentSlide: currentSlide.value,
            onAudioEnd: onAudioEnd,
          ),
          Slide29(
            currentSlide: currentSlide.value,
            onAudioEnd: onAudioEnd,
          ),
          Slide30(
            currentSlide: currentSlide.value,
            onAudioEnd: onAudioEnd,
          ),
          Slide31(
            currentSlide: currentSlide.value,
            onAudioEnd: onAudioEnd,
          ),
          Positioned.fill(
            bottom: 15,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleButton(
                        height: 52,
                        width: 52,
                        border: Border.all(
                          color: currentSlide.value == 1
                              ? AppColors.blue.withOpacity(0.2)
                              : AppColors.blue,
                          width: 2,
                        ),
                        onTap: currentSlide.value == 1
                            ? null
                            : () {
                                logger
                                    .logManualPreviousSlide(currentSlide.value);
                                currentSlide.value--;
                              },
                        child: Arrow(
                          size: const Size(28, 26),
                          color: currentSlide.value == 1
                              ? AppColors.blue.withOpacity(0.2)
                              : AppColors.blue,
                          direction: AxisDirection.left,
                        ),
                      ),
                      const SizedBox(width: 30),
                      ChapterIndicator(
                        slideCount: 31,
                        stops: slidesWithStops,
                        currentSlide: currentSlide.value,
                        onSlideTap: (slide) => currentSlide.value = slide,
                      ),
                      const SizedBox(width: 30),
                      CircleButton(
                        height: 52,
                        width: 52,
                        border: Border.all(
                          color: currentSlide.value == 31
                              ? AppColors.blue.withOpacity(0.2)
                              : AppColors.blue,
                          width: 2,
                        ),
                        onTap: currentSlide.value == 31
                            ? null
                            : () {
                                logger.logManualNextSlide(currentSlide.value);
                                currentSlide.value++;
                              },
                        child: Arrow(
                          size: const Size(28, 26),
                          color: currentSlide.value == 31
                              ? AppColors.blue.withOpacity(0.2)
                              : AppColors.blue,
                          direction: AxisDirection.right,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 16,
                        width: 16,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.lightBlue,
                            width: 2,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        l10n.stopsToExplore,
                        style: const TextStyle(
                          fontFamily: FontFamily.poppins,
                          fontSize: 16,
                          color: AppColors.darkBlue,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  TextButton(
                    onPressed: () {
                      logger.logLeave(currentSlide.value);
                      context.go('/');
                    },
                    style: TextButton.styleFrom(
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      primary: AppColors.darkBlue,
                      minimumSize: const Size(0, 36),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(8),
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          l10n.leave,
                          style: const TextStyle(
                            fontFamily: FontFamily.poppins,
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                            height: 1.2,
                            color: AppColors.darkBlue,
                          ),
                        ),
                        const SizedBox(width: 5),
                        const Icon(
                          Icons.close,
                          size: 22,
                          color: AppColors.darkBlue,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          if (showSources.value)
            ModalBarrier(
              onDismiss: () {
                logger.logSources(currentSlide.value);
                showSources.value = false;
              },
            ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            top: 0,
            bottom: 0,
            right: showSources.value ? 0 : -500,
            child: Row(
              children: [
                RotatedBox(
                  quarterTurns: -1,
                  child: Builder(
                    builder: (context) {
                      return ElevatedButton(
                        onPressed: () => showSources.value = !showSources.value,
                        style: ElevatedButton.styleFrom(
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          primary: AppColors.white,
                          onPrimary: AppColors.darkBlue,
                          minimumSize: const Size(0, 36),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(8),
                            ),
                          ),
                          textStyle: const TextStyle(
                            fontFamily: FontFamily.poppins,
                            fontSize: 13,
                          ),
                        ).copyWith(elevation: MaterialStateProperty.all(0)),
                        child:
                            Text(showSources.value ? l10n.close : l10n.sources),
                      );
                    },
                  ),
                ),
                Material(
                  color: AppColors.white,
                  elevation: 4,
                  child: SizedBox(
                    width: 500,
                    child: Scrollbar(
                      thumbVisibility: true,
                      child: Center(
                        child: ListView(
                          shrinkWrap: true,
                          padding: const EdgeInsets.all(30),
                          children: [
                            for (final s
                                in sources[currentSlide.value] ?? <Source>[])
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20),
                                child: Column(
                                  children: [
                                    Text(
                                      s.title,
                                      style: const TextStyle(
                                        fontFamily: FontFamily.poppins,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        height: 1.2,
                                        color: AppColors.black,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(height: 15),
                                    QrImage(
                                      data: s.url,
                                      size: 200,
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChapterIndicator extends StatelessWidget {
  const ChapterIndicator({
    super.key,
    required this.slideCount,
    required this.stops,
    required this.currentSlide,
    required this.onSlideTap,
  });

  final int slideCount;
  final List<int> stops;
  final int currentSlide;
  final ValueChanged<int> onSlideTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => onSlideTap(1),
          child: Container(
            height: 18,
            width: 18,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: 1 <= currentSlide ? AppColors.blue : AppColors.lightBlue,
            ),
          ),
        ),
        for (var i = 2; i < slideCount; i++) ...[
          Container(
            color: i <= currentSlide ? AppColors.blue : AppColors.lightBlue,
            width: 10,
            height: 2,
          ),
          GestureDetector(
            onTap: () => onSlideTap(i),
            child: Container(
              height: stops.contains(i) ? 16 : 12,
              width: stops.contains(i) ? 16 : 12,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: stops.contains(i)
                    ? null
                    : i <= currentSlide
                        ? AppColors.blue
                        : AppColors.lightBlue,
                border: Border.all(
                  color:
                      i <= currentSlide ? AppColors.blue : AppColors.lightBlue,
                  width: 2,
                ),
              ),
            ),
          ),
        ],
        Container(
          color:
              slideCount <= currentSlide ? AppColors.blue : AppColors.lightBlue,
          width: 10,
          height: 2,
        ),
        GestureDetector(
          onTap: () => onSlideTap(slideCount),
          child: Container(
            height: 18,
            width: 18,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: slideCount <= currentSlide
                  ? AppColors.blue
                  : AppColors.lightBlue,
            ),
          ),
        ),
      ],
    );
  }
}
