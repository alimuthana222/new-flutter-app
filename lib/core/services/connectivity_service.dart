import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityService {
  final Connectivity _connectivity = Connectivity();
  
  StreamController<bool>? _connectivityController;
  StreamSubscription<List<ConnectivityResult>>? _connectivitySubscription;

  // Stream of connectivity status
  Stream<bool> get connectivityStream {
    _connectivityController ??= StreamController<bool>.broadcast();
    return _connectivityController!.stream;
  }

  // Initialize connectivity monitoring
  Future<void> initialize() async {
    // Check initial connectivity
    final result = await _connectivity.checkConnectivity();
    _updateConnectivityStatus(result);

    // Listen to connectivity changes
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(
      _updateConnectivityStatus,
    );
  }

  void _updateConnectivityStatus(List<ConnectivityResult> result) {
    final isConnected = result.isNotEmpty && 
                       result.any((r) => r != ConnectivityResult.none);
    _connectivityController?.add(isConnected);
  }

  // Check current connectivity
  Future<bool> get isConnected async {
    final result = await _connectivity.checkConnectivity();
    return result.isNotEmpty && result.any((r) => r != ConnectivityResult.none);
  }

  // Dispose resources
  void dispose() {
    _connectivitySubscription?.cancel();
    _connectivityController?.close();
  }
}
