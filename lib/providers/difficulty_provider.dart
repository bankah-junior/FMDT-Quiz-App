import 'package:flutter/material.dart';

class DifficultyProvider extends ChangeNotifier {
  final List<String> _difficultyModes = ["Easy", "Medium", "Hard"];
  String _difficulty = "Easy";

  String get difficulty => _difficulty;
  List<String> get difficultyModes => _difficultyModes;

  void setDifficulty(String newDifficulty) {
    _difficulty = newDifficulty;
    notifyListeners(); // tells all listeners to rebuild
  }
}
