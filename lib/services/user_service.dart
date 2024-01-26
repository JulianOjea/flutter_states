import 'package:flutter/material.dart';
import 'package:flutter_states/models/user.dart';

class UserService with ChangeNotifier {
  User? _user;

  User? get user => _user;
  bool get exitsUser => _user != null ? true : false;

  set user(User? user) {
    _user = user;
    notifyListeners();
  }

  void changeAge(int age) {
    if (_user != null) {
      _user!.age = age;
    }
    notifyListeners();
  }

  void deleteUser() {
    _user = null;
    notifyListeners();
  }

  void addProfession() {
    _user!.professions.add('Proffession ${_user!.professions.length + 1}');
    notifyListeners();
  }
}
