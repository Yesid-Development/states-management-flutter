import 'dart:async';

import 'package:state_management/src/models/user.dart';

class _UserService {
  User _user;
  StreamController<User> _userStreamController = new StreamController<User>.broadcast();

  User get user => this._user;
  bool get isUserExist => (this._user != null) ? true : false;
  Stream<User> get userStream => _userStreamController.stream;

  void loadUser(User user) {
    this._user = user;
    this._userStreamController.add(user);
  }
  void changeAge(int age) {
    this._user.age = age;
    this._userStreamController.add(this._user);
  }

  dispose() {
    _userStreamController?.close();
  }
}

final userService = _UserService();
