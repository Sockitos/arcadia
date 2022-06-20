import 'package:arcadia_app/gen/gen.dart';
import 'package:arcadia_app/style/colors.dart';
import 'package:arcadia_app/widgets/slide.dart';
import 'package:flutter/widgets.dart';

class Slide32 extends StatelessWidget {
  const Slide32({
    super.key,
    required this.currentSlide,
  });

  final ValueNotifier<int> currentSlide;

  @override
  Widget build(BuildContext context) {
    return Slide(
      showProps: currentSlide.value == 32,
      playAudio: false,
      propsBuilder: (context, controller) {
        const reverseCurve = Interval(0.9, 1, curve: Curves.easeOut);
        final textOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0, 1, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );

        return [
          Center(
            child: Opacity(
              opacity: textOpacity.value,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text(
                    "Let's do this\ntogether!",
                    style: TextStyle(
                      fontFamily: FontFamily.poppins,
                      fontWeight: FontWeight.bold,
                      fontSize: 100,
                      color: AppColors.darkBlue,
                      height: 1.1,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 50),
                  Text(
                    'And now, leave your mark in our walls.\nBe part of this story. :)',
                    style: TextStyle(
                      fontFamily: FontFamily.poppins,
                      fontSize: 25,
                      color: AppColors.darkBlue,
                      height: 1.3,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 80),
                ],
              ),
            ),
          )
        ];
      },
    );
  }
}
