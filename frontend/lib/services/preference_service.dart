import 'dart:async';

import 'package:frontend/model/account.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceService {
  SharedPreferences prefs;
  StreamController<Account> accountStream;
  Future<SharedPreferences> loadPrefs() async {
    accountStream = new StreamController.broadcast();
    prefs = await SharedPreferences.getInstance();
    return prefs;
  }

  void saveAccount(String email, bool admin) {
    prefs.setString("email", email);
    prefs.setBool("admin", admin);
    accountStream.add(Account(email: email, admin: admin));
  }

  void removeAccount() {
    prefs.remove("email");
    prefs.remove("admin");
    accountStream.add(null);
  }

  String get email => prefs.getString("email");
  bool get isAdmin => prefs.getBool("admin");
}
