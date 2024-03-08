import 'dart:async';

import 'package:flutter/foundation.dart';

class Debounce {
  final int milliseconds;
  Timer? _timer;

  Debounce({required this.milliseconds});

  run(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}