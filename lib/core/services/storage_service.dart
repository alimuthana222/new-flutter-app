import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:supabase_flutter/supabase_flutter.dart';
import 'supabase_service.dart';
import '../config/supabase_config.dart';

class StorageService {
  final _storage = SupabaseService.storage;

  // Upload avatar
  Future<String> uploadAvatar(File file, String userId) async {
    final extension = path.extension(file.path);
    final fileName = '$userId-${DateTime.now().millisecondsSinceEpoch}$extension';
    final filePath = 'avatars/$fileName';
    
    await _storage
        .from(SupabaseConfig.avatarsBucket)
        .upload(filePath, file);
    
    return _storage
        .from(SupabaseConfig.avatarsBucket)
        .getPublicUrl(filePath);
  }

  // Upload skill image
  Future<String> uploadSkillImage(File file, String skillId) async {
    final extension = path.extension(file.path);
    final fileName = '$skillId-${DateTime.now().millisecondsSinceEpoch}$extension';
    final filePath = 'skills/$fileName';
    
    await _storage
        .from(SupabaseConfig.skillImagesBucket)
        .upload(filePath, file);
    
    return _storage
        .from(SupabaseConfig.skillImagesBucket)
        .getPublicUrl(filePath);
  }

  // Upload receipt
  Future<String> uploadReceipt(File file, String orderId) async {
    final extension = path.extension(file.path);
    final fileName = '$orderId-${DateTime.now().millisecondsSinceEpoch}$extension';
    final filePath = 'receipts/$fileName';
    
    await _storage
        .from(SupabaseConfig.receiptsBucket)
        .upload(filePath, file);
    
    return _storage
        .from(SupabaseConfig.receiptsBucket)
        .getPublicUrl(filePath);
  }

  // Delete file
  Future<void> deleteFile(String bucket, String filePath) async {
    await _storage.from(bucket).remove([filePath]);
  }
}
