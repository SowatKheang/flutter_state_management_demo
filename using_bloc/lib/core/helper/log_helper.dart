

import 'package:logger/logger.dart';

/// 
/// [LogHelper] provides a static method to log messages to the console
/// 
class LogHelper {

  static LogHelper? _instance;
  static LogHelper getInstance() {
    _instance ??= LogHelper();
    return _instance!;
  }

  final logger = Logger(printer: PrettyPrinter());

  /// It prints info message to the console.
  /// 
  /// Args:
  ///   [message] (dynamic): The message to be logged.
  void info(dynamic message) => _instance?.logger.i(message);

  /// It prints warning message to the console.
  /// 
  /// Args:
  ///   [message] (dynamic): The message to be logged.
  void warning(dynamic message) => _instance?.logger.w(message);

  
  /// It prints error message to the console.
  /// 
  /// Args:
  ///   [message] (dynamic): The message to be logged.
  void error(dynamic message) => _instance?.logger.e(message);

}