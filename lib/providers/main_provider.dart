//create a provider for the main screen
import 'package:flutter/material.dart';

class MainScreenProvider extends ChangeNotifier {
  int _selectedIndex;
  String _title;
  MainScreenProvider()
      : _selectedIndex = 0,
        _title = "Dashboard";

  String get title => _title;

  int get selectedIndex => _selectedIndex;

  //change bottom navigation bar index and title to change the corresponding screen
  void updateTabSelection(int index, String buttonText) {
    _selectedIndex = index;
    _title = buttonText;
    notifyListeners();
  }
}
