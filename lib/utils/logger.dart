import 'dart:io';

abstract class LoggerOutput {
  void init() {}

  void log(String data);

  void logCount(int count);

  void dispose() {}
}

class LoggerFileOutput extends LoggerOutput {
  LoggerFileOutput({
    required this.file,
    required this.countFile,
  });

  final File file;
  final File countFile;
  IOSink? _fileSink;

  @override
  void init() {
    _fileSink = file.openWrite(mode: FileMode.writeOnlyAppend);
  }

  @override
  void log(String data) {}

  @override
  void logCount(int count) {}

  @override
  void dispose() {
    _fileSink?.flush();
    _fileSink?.close();
  }
}

class LoggerDBOutput extends LoggerOutput {
  @override
  void init() {}

  @override
  void log(String data) {}

  @override
  void logCount(int count) {}

  @override
  void dispose() {}
}

class Logger {
  Logger({required this.output});

  final LoggerOutput output;

  void init() => output.init();

  void dispose() => output.dispose();

  void logCount(int count) => output.logCount(count);

  void _log(String data) {
    final now = DateTime.now();
    output.log('[$now] $data');
  }

  void logStart(int count) => _log('Start ($count}');
  void logEnd() => _log('End');
  void logSources(int slide) => _log('Sources at slide $slide');
  void logLeave(int slide) => _log('Leave at slide $slide');
  void logSlideTimeout(int slide) => _log('Timeout at slide $slide');
  void logEndTimeout() => _log('Timeout at end');
  void logManualPreviousSlide(int slide) =>
      _log('Previous slide $slide -> ${slide - 1}');
  void logManualNextSlide(int slide) =>
      _log('Next slide $slide -> ${slide + 1}');
  void logAutoNextSlide(int slide) =>
      _log('(Auto) Next slide $slide -> ${slide + 1}');
  void logJumpSlide(int currentSlide, int targetSlide) =>
      _log('Jump slide $currentSlide -> $targetSlide');
  void logCountrySelected(String country, {required int slide}) =>
      _log('Country selected ($country) at slide $slide');
  void logYearSelected(int year, {required int slide}) =>
      _log('Year selected ($year) at slide $slide');
  void logHeightSelected(int height, {required int slide}) => _log(
        'Height selected (${(height / 100).toStringAsFixed(2)}) at slide $slide',
      );
  void logSliderValue(String value, {required int slide}) =>
      _log('Slider value changed ($value) at slide $slide');
  void logCoinFlip(String id, {required int slide}) => _log(
        'Coin flipped ($id) at slide $slide',
      );
}
