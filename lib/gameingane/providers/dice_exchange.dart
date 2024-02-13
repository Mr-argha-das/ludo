import 'package:flutter/material.dart';
import 'package:ludo/gameingane/constants.dart';

class MyData with ChangeNotifier {
  LudoPlayerType? _value = LudoPlayerType.green;

  LudoPlayerType get value => _value!;
   set value(LudoPlayerType value){
   _value = value;
  }
  void updateValue(LudoPlayerType newValue) {
    _value = newValue;
    notifyListeners();
  }
}