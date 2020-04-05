import 'package:flutter/material.dart';

class HomeModel extends ChangeNotifier {
  get isVisible => _isVisible;
  bool _isVisible = false;

  set isVisible(value) {
    _isVisible = value;
    notifyListeners();
  }

  get isValid => _isValid;
  bool _isValid = false;
  void isValidEmail(String input) {
    if (input == 'shemar268abel@gmail.com'){
      _isValid = true;
    } else {
      _isValid = false;
    }
    notifyListeners();
  }

}