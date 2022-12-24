import 'package:flutter/foundation.dart';

class ToggleSearchNotifier extends ChangeNotifier {
  String _toggle = 'Movies';
  String get toggle => _toggle;

  void setSelectedButton(String? toggle) async {
    _toggle = toggle ?? _toggle;
    notifyListeners();
  }
}
