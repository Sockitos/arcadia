import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AnimatedIndicator extends HookWidget {
  const AnimatedIndicator({
    super.key,
    required this.indicator,
    this.offset = const Offset(0, 0.1),
  });

  final Widget indicator;
  final Offset offset;

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(
      duration: const Duration(milliseconds: 250),
    );
    final animation = Tween<Offset>(
      begin: Offset.zero,
      end: offset,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOutBack,
      ),
    );
    useEffect(
      () {
        controller.repeat(reverse: true);
        return;
      },
      [controller],
    );
    return SlideTransition(
      position: animation,
      child: indicator,
    );
  }
}
