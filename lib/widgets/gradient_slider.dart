import 'package:arcadia/style/colors.dart';
import 'package:flutter/material.dart';

class GradientSlider extends StatelessWidget {
  const GradientSlider({
    super.key,
    required this.value,
    required this.onChanged,
    this.startColor = AppColors.otherBlue,
    this.endColor = AppColors.red,
    this.min = 0,
    this.max = 1,
    this.divisions,
  });

  final double value;
  final ValueChanged<double> onChanged;
  final Color startColor;
  final Color endColor;
  final double min;
  final double max;
  final int? divisions;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 387,
      height: 28,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        gradient: LinearGradient(
          colors: [startColor, endColor],
          stops: const [0.25, 0.75],
        ),
      ),
      child: SliderTheme(
        data: SliderThemeData(
          trackHeight: 0,
          thumbColor: AppColors.darkBlue,
          overlayColor: AppColors.darkBlue.withOpacity(0.2),
          overlayShape: const RoundSliderOverlayShape(
            overlayRadius: 14,
          ),
        ),
        child: Slider(
          min: min,
          max: max,
          divisions: divisions,
          value: value,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
