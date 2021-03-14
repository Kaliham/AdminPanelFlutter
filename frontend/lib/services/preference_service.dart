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

  void saveAccount(String email) {
    prefs.setString("email", email);
    accountStream.add(Account(email: email));
  }

  void removeAccount() {
    prefs.remove("email");
    accountStream.add(null);
  }

  String get email => prefs.getString("email");
}
