import 'dart:async';
import 'package:sensors_plus/sensors_plus.dart';

class ShakeAction {
  final Function onShake;
  final double threshold;
  StreamSubscription? _subscription;

  ShakeAction({required this.onShake, this.threshold = 15.0});

  void startListening() {
    _subscription = accelerometerEvents.listen((event) {
      double acceleration = event.x.abs() + event.y.abs() + event.z.abs();
      if (acceleration > threshold) {
        onShake();
      }
    });
  }

  void stopListening() {
    _subscription?.cancel();
  }
}
