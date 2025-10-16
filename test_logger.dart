import 'package:logger/logger.dart';

void main() {
  // Test the logger package
  Logger logger = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      colors: true,
      printEmojis: true,
    ),
  );

  print('=== Testing Logger Output ===');
  logger.i('This is an INFO message');
  logger.d('This is a DEBUG message');
  logger.w('This is a WARNING message');
  logger.e('This is an ERROR message');
  print('=== End Logger Test ===');
}
