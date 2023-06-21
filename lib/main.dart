import 'dart:async';
import 'dart:io' as io;

import 'package:arcadia_app/l10n/app_localizations.dart';
import 'package:arcadia_app/providers.dart';
import 'package:arcadia_app/router/router.dart';
import 'package:arcadia_app/utils/logger.dart';
import 'package:dart_openai/dart_openai.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:window_manager/window_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final int count;
  final Logger logger;

  if (kIsWeb) {
    // unawaited(document.documentElement?.requestFullscreen());
    count = 0;
    logger = Logger(output: LoggerDBOutput());
  } else {
    await windowManager.ensureInitialized();
    const windowOptions = WindowOptions(fullScreen: true);
    unawaited(
      windowManager.waitUntilReadyToShow(windowOptions, () async {
        await windowManager.show();
        await windowManager.focus();
      }),
    );
    final directory = await getApplicationDocumentsDirectory();
    final file = io.File('${directory.path}/log.txt');
    final countFile = io.File('${directory.path}/log_count.txt');
    count = countFile.existsSync()
        ? int.tryParse(countFile.readAsStringSync()) ?? 0
        : 0;
    logger = Logger(
      output: LoggerFileOutput(
        file: file,
        countFile: countFile,
      ),
    );
  }

  OpenAI.apiKey = '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';

  runApp(
    ProviderScope(
      overrides: [
        loggerProvider.overrideWithValue(
          logger..init(),
        ),
        countProvider.overrideWith((ref) => count),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
          PointerDeviceKind.stylus,
          PointerDeviceKind.unknown
        },
      ),
      debugShowCheckedModeBanner: false,
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
        Locale('pt', ''),
      ],
      locale: ref.watch(localeProvider),
    );
  }
}
