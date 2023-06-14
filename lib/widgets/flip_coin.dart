import 'package:arcadia_app/style/colors.dart';
import 'package:arcadia_app/utils/hooks.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class FlipCoin extends HookWidget {
  const FlipCoin({
    super.key,
    required this.radius,
    required this.front,
    required this.back,
    this.onFlip,
    this.shouldHint = false,
    this.side = CardSide.FRONT,
  });

  final double radius;
  final Widget front;
  final Widget back;
  final VoidCallback? onFlip;
  final bool shouldHint;
  final CardSide side;

  @override
  Widget build(BuildContext context) {
    final controller = useFlipCardController();
    useEffect(
      () {
        void reverse(AnimationStatus status) {
          if (status == AnimationStatus.completed) {
            Future.delayed(
              const Duration(milliseconds: 500),
              controller.controller?.reverse,
            );
          }
          controller.controller?.removeStatusListener(reverse);
        }

        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (!shouldHint) return;
          Future.delayed(
            const Duration(seconds: 1),
            () {
              controller.controller?.forward();
              controller.controller!.addStatusListener(reverse);
            },
          );
        });
        return () => controller.controller?.removeStatusListener(reverse);
      },
      [WidgetsBinding.instance],
    );

    return FlipCard(
      onFlip: onFlip,
      controller: controller,
      flipOnTouch: false,
      side: side,
      front: Material(
        type: MaterialType.circle,
        color: AppColors.white,
        child: InkWell(
          onTap: controller.toggleCard,
          customBorder: const CircleBorder(),
          child: SizedBox(
            height: radius * 2,
            width: radius * 2,
            child: Center(child: front),
          ),
        ),
      ),
      back: Material(
        type: MaterialType.circle,
        color: AppColors.white,
        child: InkWell(
          onTap: controller.toggleCard,
          customBorder: const CircleBorder(),
          child: SizedBox(
            height: radius * 2,
            width: radius * 2,
            child: Center(child: back),
          ),
        ),
      ),
    );
  }
}
