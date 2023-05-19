import 'dart:async';

import 'package:arcadia_app/utils/hooks.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:just_audio/just_audio.dart';

typedef SlidePropsBuilder = List<Widget> Function(
  BuildContext context,
  AnimationController controller,
);

class Slide extends HookWidget {
  const Slide({
    super.key,
    required this.slide,
    required this.currentSlide,
    this.background,
    this.audioPath,
    required this.onAudioEnd,
    required this.propsBuilder,
    this.backgroundDuration = const Duration(milliseconds: 300),
    this.propsDuration = const Duration(milliseconds: 1000),
  });

  final int slide;
  final int currentSlide;
  final ImageProvider? background;
  final String? audioPath;
  final VoidCallback onAudioEnd;
  final SlidePropsBuilder propsBuilder;
  final Duration backgroundDuration;
  final Duration propsDuration;

  bool use0Controller(AnimationController controller) {
    final isZero = useState(controller.value == 0);
    useEffect(
      () {
        void listener() {
          if (controller.value == 0 && !isZero.value) {
            isZero.value = true;
          }
          if (controller.value != 0 && isZero.value) {
            isZero.value = false;
          }
        }

        controller.addListener(listener);
        return () {
          controller.removeListener(listener);
        };
      },
      [controller],
    );

    return isZero.value;
  }

  @override
  Widget build(BuildContext context) {
    final showBackground = currentSlide >= slide;
    final showProps = currentSlide == slide;
    final playAudio = currentSlide == slide;

    final player = useAudioPlayer();
    useEffect(
      () {
        if (audioPath != null) player.setAsset(audioPath!);
        return;
      },
      [audioPath],
    );
    useEffect(
      () {
        // ignore: cancel_subscriptions
        StreamSubscription<ProcessingState>? sub;
        if (playAudio) {
          if (audioPath != null) {
            player.play();
            sub = player.processingStateStream.listen((state) {
              if (state == ProcessingState.completed) onAudioEnd();
            });
          } else {
            onAudioEnd();
          }
        } else {
          if (player.playing) {
            player.stop().then((_) => player.seek(Duration.zero));
          }
        }
        return sub?.cancel;
      },
      [playAudio, audioPath],
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
              final is0 = use0Controller(controller);
              return is0
                  ? const SizedBox()
                  : SizedBox.expand(
                      child: Image(
                        image: background!,
                        fit: BoxFit.cover,
                        opacity: controller,
                      ),
                    );
            },
          ),
        HookBuilder(
          builder: (context) {
            final controller = useAnimationController(
              duration: propsDuration,
              reverseDuration: const Duration(milliseconds: 100),
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
            final is0 = use0Controller(controller);
            return is0
                ? const SizedBox()
                : Stack(
                    children: propsBuilder(context, controller),
                  );
          },
        ),
      ],
    );
  }
}
