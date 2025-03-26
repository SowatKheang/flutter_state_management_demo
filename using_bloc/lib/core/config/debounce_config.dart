
import 'dart:async';
import 'package:flutter/material.dart';

///
/// [DebounceConfig]
///
class DebounceConfig {
  final int milliseconds;
  Timer? _timer;

  DebounceConfig({required this.milliseconds});

  void cancel() {
    _timer?.cancel();
  }

  void run(VoidCallback action) {
    cancel();
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
