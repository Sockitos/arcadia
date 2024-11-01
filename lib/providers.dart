import 'package:arcadia/utils/logger.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final localeProvider = StateProvider<Locale>((ref) => const Locale('pt'));

final loggerProvider = Provider<Logger>((ref) => throw UnimplementedError());

final countProvider = StateProvider<int>((ref) => throw UnimplementedError());

final conditionProvider = StateProvider<String>((ref) => 'A');

final yearProvider = StateProvider<int?>((ref) {
  ref.watch(countProvider);
  return null;
});

final countryProvider = StateProvider<String?>((ref) {
  ref.watch(countProvider);
  return null;
});

final heightProvider = StateProvider<int>((ref) {
  ref.watch(countProvider);
  return 100;
});

final coinsProvider = StateNotifierProvider<CoinsNotifier, Set<String>>(
  (ref) {
    ref.watch(countProvider);
    return CoinsNotifier();
  },
);

class CoinsNotifier extends StateNotifier<Set<String>> {
  CoinsNotifier() : super({});

  void flip(String id) {
    if (state.contains(id)) {
      state.remove(id);
    } else {
      state.add(id);
    }
  }
}
