// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter_states/models/user.dart';

class _UserService {
  User? _user;

  final StreamController<User> _userStreamController =
      StreamController<User>.broadcast();

  User? get user => _user;
  bool get exitsUser => (_user != null) ? true : false;

  Stream<User> get userStream => _userStreamController.stream;

  //esto es un setter
  void loadUser(User user) {
    _user = user;
    _userStreamController.add(user);
  }

  void updateAge(int age) {
    _user?.age = age;
    _userStreamController.add(_user!);
  }

  dispose() {
    _userStreamController.close();
  }
}

final userService = _UserService();
