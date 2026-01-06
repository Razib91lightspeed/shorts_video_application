import 'package:flutter/foundation.dart';
import 'package:firebase_core/firebase_core.dart';

// After you run `flutterfire configure`, change this import to:
// import 'firebase_options.dart';
import 'firebase_options_placeholder.dart';

class FirebaseBootstrap {
  static bool _initialized = false;

  static bool get isInitialized => _initialized;

  /// Initializes Firebase if firebase_options.dart exists (after you configure FlutterFire).
  /// If not configured, the app still runs with Firebase disabled.
  static Future<void> tryInit() async {
    if (_initialized) return;

    try {
      // On web, Firebase must be initialized too; we still attempt it.
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      _initialized = true;
      debugPrint('[FirebaseBootstrap] Firebase initialized');
    } catch (e) {
      // Expected until the user configures Firebase. Keep the app usable.
      debugPrint('[FirebaseBootstrap] Firebase not configured yet: $e');
      _initialized = false;
    }
  }
}
