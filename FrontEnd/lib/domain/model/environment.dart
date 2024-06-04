import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String get fileName {
    if (kDebugMode) return '.env.dev';
    return '.env.live';
  }

  static String get apiUrl {
    return dotenv.env['BASE_URL'] ?? 'API not found';
  }
}
