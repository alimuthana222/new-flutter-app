import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../services/supabase_service.dart';
import '../services/auth_service.dart';
import '../services/storage_service.dart';
import '../services/notification_service.dart';
import '../services/connectivity_service.dart';
import '../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../features/auth/presentation/bloc/auth_bloc.dart';

final sl = GetIt.instance;
final getIt = sl; // Alias for compatibility

Future<void> init() async {
  // Services
  sl.registerLazySingleton(() => AuthService());
  sl.registerLazySingleton(() => StorageService());
  sl.registerLazySingleton(() => NotificationService());
  sl.registerLazySingleton(() => ConnectivityService());

  // BLoCs
  sl.registerFactory(
    () => AuthBloc(authRepository: sl()),
  );

  // Repositories
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      sharedPreferences: sl(),
      secureStorage: sl(),
    ),
  );
  
  // TODO: Add more repositories here as you implement features
  // Example:
  // sl.registerLazySingleton<SkillsRepository>(
  //   () => SkillsRepositoryImpl(supabaseService: sl()),
  // );

  // TODO: Add more BLoCs here as you implement features
  // Example:
  // sl.registerFactory(() => SkillsBloc(repository: sl()));

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  
  const secureStorage = FlutterSecureStorage();
  sl.registerLazySingleton(() => secureStorage);
}

// Alternative function name for compatibility
Future<void> initDependencies() async => init();
