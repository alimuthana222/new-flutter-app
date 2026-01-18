import 'dart:io';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'supabase_service.dart';
import '../config/supabase_config.dart';

class StorageService {
  final _storage = SupabaseService.storage;

  // Upload avatar
  Future<String> uploadAvatar(File file, String userId) async {
    final fileName = '$userId-${DateTime.now().millisecondsSinceEpoch}.jpg';
    final path = 'avatars/$fileName';
    
    await _storage
        .from(SupabaseConfig.avatarsBucket)
        .upload(path, file);
    
    return _storage
        .from(SupabaseConfig.avatarsBucket)
        .getPublicUrl(path);
  }

  // Upload skill image
  Future<String> uploadSkillImage(File file, String skillId) async {
    final fileName = '$skillId-${DateTime.now().millisecondsSinceEpoch}.jpg';
    final path = 'skills/$fileName';
    
    await _storage
        .from(SupabaseConfig.skillImagesBucket)
        .upload(path, file);
    
    return _storage
        .from(SupabaseConfig.skillImagesBucket)
        .getPublicUrl(path);
  }

  // Upload receipt
  Future<String> uploadReceipt(File file, String orderId) async {
    final fileName = '$orderId-${DateTime.now().millisecondsSinceEpoch}.jpg';
    final path = 'receipts/$fileName';
    
    await _storage
        .from(SupabaseConfig.receiptsBucket)
        .upload(path, file);
    
    return _storage
        .from(SupabaseConfig.receiptsBucket)
        .getPublicUrl(path);
  }

  // Delete file
  Future<void> deleteFile(String bucket, String path) async {
    await _storage.from(bucket).remove([path]);
  }
}
