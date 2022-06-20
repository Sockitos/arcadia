import 'package:arcadia_app/utils/hooks.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

typedef SlidePropsBuilder = List<Widget> Function(
  BuildContext context,
  AnimationController controller,
);

class Slide extends HookWidget {
  const Slide({
    super.key,
    this.background,
    this.audioPath,
    this.onAudioEnd,
    required this.propsBuilder,
    this.showBackground = false,
    required this.showProps,
    required this.playAudio,
    this.backgroundDuration = const Duration(milliseconds: 300),
    this.propsDuration = const Duration(milliseconds: 1000),
  });

  final ImageProvider? background;
  final String? audioPath;
  final VoidCallback? onAudioEnd;
  final SlidePropsBuilder propsBuilder;
  final bool showBackground;
  final bool showProps;
  final bool playAudio;
  final Duration backgroundDuration;
  final Duration propsDuration;

  @override
  Widget build(BuildContext context) {
    final player = useAudioPlayer();
    useEffect(
      () {
        if (playAudio && audioPath != null) {
          player.play(AssetSource(audioPath!));
          if (onAudioEnd != null) {
            player.onPlayerComplete.first.then((_) => onAudioEnd!());
          }
        } else {
          player.stop();
        }
        return;
      },
      [showProps, audioPath],
    );

    return Stack(
      children: [
        if (background != null)
          HookBuilder(
            builder: (context) {
              final controller = useAnimationController(
                duration: backgroundDuration,
              );
              useEffect(
                () {
                  if (showBackground) {
                    controller.forward();
                  } else {
                    controller.reverse();
                  }
                  return;
                },
                [showBackground],
              );
              return AnimatedBuilder(
                animation: controller,
                builder: (context, _) {
                  return controller.value == 0
                      ? const SizedBox()
                      : SizedBox.expand(
                          child: Image(
                            image: background!,
                            fit: BoxFit.cover,
                            opacity: controller,
                          ),
                        );
                },
              );
            },
          ),
        HookBuilder(
          builder: (context) {
            final controller = useAnimationController(
              duration: propsDuration,
            );
            useEffect(
              () {
                if (showProps) {
                  controller.forward();
                } else {
                  controller.reverse();
                }
                return;
              },
              [showProps],
            );
            return AnimatedBuilder(
              animation: controller,
              builder: (context, child) {
                return controller.value == 0
                    ? const SizedBox()
                    : Stack(
                        children: propsBuilder(context, controller),
                      );
              },
            );
          },
        ),
      ],
    );
  }
}
