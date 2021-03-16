import 'package:flutter/material.dart';
import 'package:frontend/model/account.dart';
import 'package:frontend/services/account_service.dart';
import 'package:frontend/services/preference_service.dart';
import 'package:frontend/view/page/home/home_view.dart';
import 'package:frontend/view/page/login/login_view.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("saved");
    print(GetIt.I.get<PreferenceService>().email ?? "");
    if ((GetIt.I.get<PreferenceService>().email ?? "").isNotEmpty) {
      return HomeView();
    }
    return StreamBuilder<Account>(
      stream: GetIt.I.get<PreferenceService>().accountStream.stream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.email.isNotEmpty) {
            return HomeView();
          }
        }
        return LoginView();
      },
    );
  }
}
