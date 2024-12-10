import 'package:flutter/material.dart';

class NotifyNumber extends ChangeNotifier {
  int number = 0;
  increase() {
    number++;
    notifyListeners();
  }

  decrease() {
    number--;
    notifyListeners();
  }
}
