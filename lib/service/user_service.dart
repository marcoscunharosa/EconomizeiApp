import 'package:economizei_app/models/account.dart';
import 'package:flutter/material.dart';

class UserService {
  static UserService? instance;
  Account? userAccount;

  static UserService? getInstance() {
    if (instance == null) {
      instance = UserService();
    }
    return instance;
  }

  void createUser({required String username, required String email}) {
    userAccount = Account(username: username, email: email);
  }
}
