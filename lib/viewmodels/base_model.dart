import 'package:flutter/material.dart';
import 'package:kenalbandung/services/api_service.dart';

class BaseModel extends ChangeNotifier {
  bool _busy = false;
  bool get busy => _busy;
  ApiService? apiService;
  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }
}
