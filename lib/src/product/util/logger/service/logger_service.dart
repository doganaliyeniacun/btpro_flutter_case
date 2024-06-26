import 'package:get/get.dart';
import 'package:logger/logger.dart';

import 'interface/i_logger_service.dart';

class LoggerService extends GetxController implements ILoggerService {
  late final Logger _logger;

  @override
  void onInit() {
    _logger = Logger(
      printer: PrettyPrinter(
        methodCount: 2,
        errorMethodCount: 8,
        lineLength: 120,
        colors: true,
        printEmojis: true,
        printTime: false,
      ),
    );
    super.onInit();
  }

  /// This function logs a debug message using a logger instance.
  /// 
  /// Args:
  ///   message (String): The `message` parameter is a string that contains the information or data that
  /// needs to be logged or debugged.
  @override
  void debugLog(String message) {
    _logger.d(message);
  }

  /// This function logs an informational message using the `_logger` instance.
  /// 
  /// Args:
  ///   message (String): The `message` parameter is a string that contains the information or message
  /// to be logged.
  @override
  void infoLog(String message) {
    _logger.i(message);
  }

  /// The `errorLog` function logs an error message using the `_logger` object.
  /// 
  /// Args:
  ///   message (String): The `message` parameter is a string that contains the error message to be
  /// logged.
  @override
  void errorLog(String message) {
    _logger.e(message);
  }

  /// The `warningLog` function in Dart logs a warning message using a logger instance `_logger`.
  /// 
  /// Args:
  ///   message (String): The `message` parameter is a string that contains the warning message to be
  /// logged.
  @override
  void warningLog(String message) {
    _logger.w(message);
  }

  /// The `traceLog` function in Dart logs a message using a logger instance `_logger`.
  /// 
  /// Args:
  ///   message (String): The `message` parameter is a string that contains the information or data that
  /// needs to be logged or traced.
  @override
  void traceLog(String message) {
    _logger.t(message);
  }
}
