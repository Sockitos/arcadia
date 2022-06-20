import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

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
