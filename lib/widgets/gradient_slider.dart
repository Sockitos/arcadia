import 'package:arcadia_app/style/colors.dart';
import 'package:flutter/material.dart';

class GradientSlider extends StatelessWidget {
  const GradientSlider({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final double value;
  final ValueChanged<double> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 387,
      height: 28,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        gradient: const LinearGradient(
          colors: [
            Color(0xFF007DBB),
            AppColors.red,
          ],
          stops: [
            0.25,
            0.75,
          ],
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
          value: value,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
