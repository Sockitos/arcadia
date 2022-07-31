import 'package:flutter/material.dart';

class Screen extends StatelessWidget {
  const Screen({
    super.key,
    required this.body,
  });

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: SizedBox(
        height: 1080,
        width: 1920,
        child: Scaffold(body: body),
      ),
    );
  }
}
