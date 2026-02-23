import 'package:logger/logger.dart';
import 'package:thingsboard_app/core/logger/tb_log_output.dart';
import 'package:thingsboard_app/core/logger/tb_logs_filter.dart';

class TbLogger {
  final _logger = Logger(
    filter: TbLogsFilter(),
    printer: PrefixPrinter(
      PrettyPrinter(
        methodCount: 0,
        lineLength: 200,
        colors: false,
      ),
    ),
    output: TbLogOutput(),
  );

  /// TRACE → logger.v
  void trace(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.v(message);
  }

  /// DEBUG → logger.d
  void debug(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.d(message);
  }

  /// INFO → logger.i
  void info(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.i(message);
  }

  /// WARN → logger.w
  void warn(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.w(message);
  }

  /// ERROR → logger.e
  void error(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.e(message);
  }

  /// FATAL → logger.wtf
  void fatal(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.wtf(message);
  }
}
