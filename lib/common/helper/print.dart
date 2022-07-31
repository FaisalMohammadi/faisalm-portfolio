
import 'package:flutter/foundation.dart';

/// prints given error when the app is running in debug-mode
void printError(String context, Object? error) {
  if (isReleaseMode()) {
    return;
  }
  if (error != null) {
    print('Application Error: $context -> $error');
  } else {
    print('Application Error: $context');
  }
}

/// prints given message when the app is running in debug-mode
void printDebug(Object? message) {
  if (isReleaseMode()) {
    return;
  }
  print(message);
}
/// returns whether the app is build in release-mode (true) or debug-mode (false)
bool isReleaseMode() {
  if (kReleaseMode == true) {
    return true;
  } else {
    return false;
  }
}