import 'package:flutter/material.dart';
import 'firebase/firebase_bootstrap.dart';
import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Safe: app still runs with Firebase disabled (until you configure it).
  await FirebaseBootstrap.tryInit();

  runApp(const ShortzApp());
}
