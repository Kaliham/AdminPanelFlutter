import 'package:frontend/services/api_service.dart';
import 'package:frontend/services/preference_service.dart';
import 'package:get_it/get_it.dart';

class AccountService {
  void logout() {
    GetIt.I.get<PreferenceService>().removeAccount();
  }

  Future<bool> login(String email, String password) async {
    email = email.toLowerCase();
    Map<String, dynamic> map = await GetIt.I
        .get<ApiService>()
        .send({"email": email, "password": password}, "login");
    if (map['response']) {
      GetIt.I.get<PreferenceService>().saveAccount(email);
      return true;
    }
    return false;
  }

  Future<bool> register(String email, String password, String confirmEmail,
      String confirmPassword) async {
    email = email.toLowerCase().trim();
    confirmEmail = confirmEmail.toLowerCase().trim();
    password = password.trim();
    confirmPassword = confirmPassword.trim();
    if (password != confirmPassword || email != confirmPassword) {
      return false;
    }
    Map<String, dynamic> map = await GetIt.I
        .get<ApiService>()
        .send({"email": email, "password": password}, "login");
    if (map['status'] != "success") {
      return false;
    }
    return login(email, password);
  }
}
