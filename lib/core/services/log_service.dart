import 'package:flutter_mvvm_starter/utils/config/env.dart';
import 'package:logger/logger.dart';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class Log {
  static final logger = Logger(printer: PrettyPrinter());
  static File? logFile;

  static Future<void> init() async {
    final directory = await _getLogDirectory();
    logFile = File('${directory.path}/app_logs.txt');

    if (!(await logFile!.exists())) {
      await logFile!.create(recursive: true);
    }
  }

  static Future<Directory> _getLogDirectory() async {
    return await getApplicationDocumentsDirectory();
  }

  static void create(Level level, String message) async {
    if (Env().envType == "dev") {
      final pattern = RegExp('.{1,1200}');
      for (var chunk in pattern.allMatches(message)) logger.log(level, chunk.group(0));

      if (logFile != null) {
        final logMessage = '${DateTime.now().toIso8601String()} [$level] $message\n';
        await logFile!.writeAsString(logMessage, mode: FileMode.append);
      }
    }
  }
}
