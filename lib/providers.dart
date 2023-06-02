import 'package:arcadia_app/utils/logger.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final localeProvider = StateProvider<Locale>((ref) => const Locale('pt'));

final loggerProvider = Provider<Logger>((ref) => throw UnimplementedError());

final countProvider = StateProvider<int>((ref) => throw UnimplementedError());

final conditionProvider = StateProvider<String>((ref) => 'A');
