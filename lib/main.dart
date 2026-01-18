import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'app.dart';
import 'core/services/supabase_service.dart';
import 'core/services/notification_service.dart';
import 'core/di/injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Set preferred orientations
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Set system UI overlay style
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );

  // Initialize Firebase
  await Firebase.initializeApp();

  // Initialize Supabase
  await SupabaseService.initialize();

  // Initialize dependencies
  await initDependencies();

  // Initialize connectivity monitoring
  await getIt<ConnectivityService>().initialize();

  // Initialize notifications
  await getIt<NotificationService>().initialize();

  runApp(const MaharatApp());
}
