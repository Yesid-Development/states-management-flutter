import 'package:flutter/material.dart';
import 'package:state_management/src/models/user.dart';

class UserService with ChangeNotifier {
  User _user;

  User get getUser => _user;

  bool get ifUserExist => _user != null ? true : false;

  set setUser(User user) {
    _user = user;
    notifyListeners();
  }

  void changeAge(int age) {
    _user.age = age;
    notifyListeners();
  }

  void removeUser() {
    _user = null;
    notifyListeners();
  }

  void addProfession() {
    _user.professions.add('Profesion: ${_user.professions.length + 1}');
    notifyListeners();
  }
}
