import 'package:arcadia_app/style/colors.dart';
import 'package:arcadia_app/utils/hooks.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class FlipCoin extends HookWidget {
  const FlipCoin({
    super.key,
    required this.height,
    required this.width,
    required this.front,
    required this.back,
    this.onFlip,
  });

  final double height;
  final double width;
  final Widget front;
  final Widget back;
  final VoidCallback? onFlip;

  @override
  Widget build(BuildContext context) {
    final controller = useFlipCardController();
    return FlipCard(
      onFlip: onFlip,
      controller: controller,
      flipOnTouch: false,
      front: Material(
        type: MaterialType.circle,
        color: AppColors.white,
        child: InkWell(
          onTap: controller.toggleCard,
          customBorder: const CircleBorder(),
          child: SizedBox(
            height: height,
            width: width,
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
            height: height,
            width: width,
            child: Center(child: back),
          ),
        ),
      ),
    );
  }
}
