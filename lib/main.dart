import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'data/source/local/hive/user/user_hive.dart';
import 'core/injection/injection.dart';
import 'firebase_options.dart';
import 'app.dart';

void main() async {
  await _initialized();
  runApp(const App());
}

Future<void> _initialized() async {
  final widgetBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetBinding);
  configureDependencies();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.android);
  await _registerAdapterAndInitHive();
}

Future<void> _registerAdapterAndInitHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UserHiveAdapter());
}