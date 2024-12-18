import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

var notifyNumber =
    ChangeNotifierProvider<NotifyNumber>((ref) {
     final notifyNumber =NotifyNumber();
     return notifyNumber;
    });
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
