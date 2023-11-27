import 'package:flutter/material.dart';

class NavigationViewModel with ChangeNotifier {
  int _index = 0;
  int get index => _index;

  void setIndex(int index){
    _index = index;
    notifyListeners();
  }

  Widget _currentChild = const Text("Beranda");
  Widget get currentChild => _currentChild;

  void setCurrentChild(Widget child){
    _currentChild = child;
    notifyListeners();
  }
}