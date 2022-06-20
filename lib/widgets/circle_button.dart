import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  const CircleButton({
    super.key,
    this.height,
    this.width,
    this.backgroundColor,
    this.border,
    this.onTap,
    this.child,
  });

  final double? height;
  final double? width;
  final Color? backgroundColor;
  final BoxBorder? border;
  final VoidCallback? onTap;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Ink(
        height: height,
        width: width,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: backgroundColor,
          border: border,
        ),
        child: InkWell(
          customBorder: const CircleBorder(),
          onTap: onTap,
          child: Center(
            child: child,
          ),
        ),
      ),
    );
  }
}
