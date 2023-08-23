import 'package:flutter/foundation.dart';

class BottomNavigationProvider with ChangeNotifier
{

  int _index = 0;

  int get getIndex => _index;

  void setIndex(int index)
  {
    _index = index;
    notifyListeners();
  }

}