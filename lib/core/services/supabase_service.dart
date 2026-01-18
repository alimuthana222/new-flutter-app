import 'package:supabase_flutter/supabase_flutter.dart';
import '../config/supabase_config.dart';

class SupabaseService {
  static SupabaseClient? _client;

  static Future<void> initialize() async {
    await Supabase.initialize(
      url: SupabaseConfig.supabaseUrl,
      anonKey: SupabaseConfig.supabaseAnonKey,
    );
    _client = Supabase.instance.client;
  }

  static SupabaseClient get client {
    if (_client == null) {
      throw Exception('Supabase not initialized');
    }
    return _client!;
  }

  // Auth shortcuts
  static GoTrueClient get auth => client.auth;
  static User? get currentUser => auth.currentUser;
  static String? get userId => currentUser?.id;
  static bool get isAuthenticated => currentUser != null;

  // Database shortcuts
  static SupabaseQueryBuilder from(String table) => client.from(table);

  // Storage shortcuts
  static SupabaseStorageClient get storage => client.storage;

  // Realtime shortcuts
  static RealtimeClient get realtime => client.realtime;
}
