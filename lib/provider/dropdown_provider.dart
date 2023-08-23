import 'package:flutter/foundation.dart';

class DropDownProvider with ChangeNotifier
{
  String _group = 'Personal';

  String get getGroupValue => _group;

  void setGroupValue(String newValue)
  {
    _group = newValue;
    notifyListeners();
  }

}