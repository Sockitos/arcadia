import 'package:arcadia_app/gen/gen.dart';
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
import 'package:arcadia_app/screens/slides/slide_32.dart';
import 'package:arcadia_app/style/colors.dart';
import 'package:arcadia_app/widgets/arrow.dart';
import 'package:arcadia_app/widgets/circle_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

const initialSlides = [
  1,
  5,
  9,
  10,
  11,
  12,
  14,
  15,
  17,
  21,
  22,
  23,
  27,
  32,
];

class SlideshowScreen extends HookWidget {
  const SlideshowScreen({super.key});

  int getSlideChapter(int slide) {
    for (var i = 0; i < initialSlides.length; i++) {
      if (slide < initialSlides[i]) return i;
    }
    return initialSlides.length;
  }

  @override
  Widget build(BuildContext context) {
    final currentSlide = useState(1);
    final currentChapter = getSlideChapter(currentSlide.value);
    return Scaffold(
      body: Stack(
        children: [
          Slide01(currentSlide: currentSlide),
          Slide02(currentSlide: currentSlide),
          Slide03(currentSlide: currentSlide),
          Slide04(currentSlide: currentSlide),
          Slide05(currentSlide: currentSlide),
          Slide06(currentSlide: currentSlide),
          Slide07(currentSlide: currentSlide),
          Slide08(currentSlide: currentSlide),
          Slide09(currentSlide: currentSlide),
          Slide10(currentSlide: currentSlide),
          Slide11(currentSlide: currentSlide),
          Slide12(currentSlide: currentSlide),
          Slide14(currentSlide: currentSlide),
          Slide15(currentSlide: currentSlide),
          Slide16(currentSlide: currentSlide),
          Slide17(currentSlide: currentSlide),
          Slide18(currentSlide: currentSlide),
          Slide19(currentSlide: currentSlide),
          Slide20(currentSlide: currentSlide),
          Slide21(currentSlide: currentSlide),
          Slide22(currentSlide: currentSlide),
          Slide23(currentSlide: currentSlide),
          Slide24(currentSlide: currentSlide),
          Slide25(currentSlide: currentSlide),
          Slide26(currentSlide: currentSlide),
          Slide27(currentSlide: currentSlide),
          Slide28(currentSlide: currentSlide),
          Slide29(currentSlide: currentSlide),
          Slide30(currentSlide: currentSlide),
          Slide31(currentSlide: currentSlide),
          Slide32(currentSlide: currentSlide),
          Positioned.fill(
            child: Align(
              alignment: Alignment.centerRight,
              child: RotatedBox(
                quarterTurns: -1,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: AppColors.white,
                    onPrimary: AppColors.darkBlue,
                    minimumSize: const Size(0, 30),
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
                  child: const Text('Sources'),
                ),
              ),
            ),
          ),
          Positioned.fill(
            bottom: 20,
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
                          color: currentChapter == 1
                              ? AppColors.blue.withOpacity(0.2)
                              : AppColors.blue,
                          width: 2,
                        ),
                        onTap: () => currentSlide.value--,
                        // onTap: currentChapter == 1
                        //     ? null
                        //     : () {
                        //         final previousChapter = currentChapter - 1;
                        //         currentSlide.value =
                        //             initialSlides[previousChapter - 1];
                        //       },
                        child: Arrow(
                          size: const Size(28, 26),
                          color: currentChapter == 1
                              ? AppColors.blue.withOpacity(0.2)
                              : AppColors.blue,
                          direction: AxisDirection.left,
                        ),
                      ),
                      const SizedBox(width: 30),
                      ChapterIndicator(
                        chapterCount: initialSlides.length,
                        currentChapter: currentChapter,
                      ),
                      const SizedBox(width: 30),
                      CircleButton(
                        height: 52,
                        width: 52,
                        border: Border.all(
                          color: currentChapter == initialSlides.length
                              ? AppColors.blue.withOpacity(0.2)
                              : AppColors.blue,
                          width: 2,
                        ),
                        onTap: () => currentSlide.value++,
                        // onTap: currentChapter == initialSlides.length
                        //     ? null
                        //     : () {
                        //         final nextChapter = currentChapter + 1;
                        //         currentSlide.value =
                        //             initialSlides[nextChapter - 1];
                        //       },
                        child: Arrow(
                          size: const Size(28, 26),
                          color: currentChapter == initialSlides.length
                              ? AppColors.blue.withOpacity(0.2)
                              : AppColors.blue,
                          direction: AxisDirection.right,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                    onPressed: () => context.go('/'),
                    style: TextButton.styleFrom(
                      primary: AppColors.darkBlue,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Arrow(
                          size: Size(11, 11),
                          strokeWidth: 1,
                          color: AppColors.darkBlue,
                          direction: AxisDirection.left,
                        ),
                        SizedBox(width: 5),
                        Text(
                          'Start',
                          style: TextStyle(
                            fontFamily: FontFamily.poppins,
                            fontSize: 16,
                            color: AppColors.darkBlue,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
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
    required this.chapterCount,
    required this.currentChapter,
  });

  final int chapterCount;
  final int currentChapter;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 16,
          width: 27,
          decoration: BoxDecoration(
            color: 1 == currentChapter ? AppColors.blue : AppColors.lightBlue,
            borderRadius: const BorderRadius.horizontal(
              left: Radius.circular(16),
            ),
          ),
        ),
        const SizedBox(width: 1),
        for (var i = 2; i < chapterCount; i++) ...[
          Container(
            height: 16,
            width: 27,
            color: i == currentChapter ? AppColors.blue : AppColors.lightBlue,
          ),
          const SizedBox(width: 1),
        ],
        Container(
          height: 16,
          width: 27,
          decoration: BoxDecoration(
            color: chapterCount == currentChapter
                ? AppColors.blue
                : AppColors.lightBlue,
            borderRadius: const BorderRadius.horizontal(
              right: Radius.circular(16),
            ),
          ),
        ),
      ],
    );
  }
}
