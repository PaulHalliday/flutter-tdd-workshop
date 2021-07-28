import 'package:flutter/material.dart';

class TemperatureModel extends ChangeNotifier {
  double _temperature = 19;

  double get temperature => _temperature;

  set temperature(double value) {
    _temperature = value;
    notifyListeners();
  }

  /// Increases the [temperature] by 5º
  void increment() {
    _temperature += 5;

    // Do something
    notifyListeners();
  }

  /// Decreases the [temperature] by 5º
  void decrement() {
    _temperature -= 5;
    notifyListeners();
  }
}
