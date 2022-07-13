import 'dart:io';

class Logger {
  Logger({required this.file});

  final File file;
  IOSink? _fileSink;

  Future<void> init() async {
    _fileSink = file.openWrite(mode: FileMode.writeOnlyAppend);
  }

  void dispose() {
    _fileSink?.flush();
    _fileSink?.close();
  }

  void _log(String data) {
    final now = DateTime.now();
    _fileSink?.writeln('[$now] $data');
  }

  void logStart() => _log('Start');
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
  void logCountrySelected(String country, {required int slide}) =>
      _log('Country selected ($country) at slide $slide');
  void logYearSelected(int year, {required int slide}) =>
      _log('Year selected ($year) at slide $slide');
  void logSliderValue(double value, {required int slide}) =>
      _log('Slider value changed ($value) at slide $slide');
}
