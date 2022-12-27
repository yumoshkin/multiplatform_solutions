import 'dart:io';

import 'package:flutter/foundation.dart';

class AppPlatform {
  static String _getPlatform() {
    if (kIsWeb) {
      return 'web';
    }

    try {
      return Platform.operatingSystem;
    } catch (_) {
      return 'undefined';
    }
  }

  static String get platform => _getPlatform();

  static bool get isMobile => platform == 'ios' || platform == 'android';
}
