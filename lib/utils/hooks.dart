import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:just_audio/just_audio.dart';

AudioPlayer useAudioPlayer({
  List<Object?>? keys,
}) {
  return use(
    _AudioPlayerHook(
      keys: keys,
    ),
  );
}

class _AudioPlayerHook extends Hook<AudioPlayer> {
  const _AudioPlayerHook({
    super.keys,
  });

  @override
  HookState<AudioPlayer, Hook<AudioPlayer>> createState() =>
      _AudioPlayerHookState();
}

class _AudioPlayerHookState extends HookState<AudioPlayer, _AudioPlayerHook> {
  late final controller = AudioPlayer();

  @override
  AudioPlayer build(BuildContext context) => controller;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  String get debugLabel => 'useAudioPlayer';
}

FlipCardController useFlipCardController({
  List<Object?>? keys,
}) {
  return use(
    _FlipCardControllerHook(
      keys: keys,
    ),
  );
}

class _FlipCardControllerHook extends Hook<FlipCardController> {
  const _FlipCardControllerHook({
    super.keys,
  });

  @override
  HookState<FlipCardController, Hook<FlipCardController>> createState() =>
      _FlipCardControllerHookState();
}

class _FlipCardControllerHookState
    extends HookState<FlipCardController, _FlipCardControllerHook> {
  late final controller = FlipCardController();

  @override
  FlipCardController build(BuildContext context) => controller;

  @override
  String get debugLabel => 'useFlipCardController';
}
