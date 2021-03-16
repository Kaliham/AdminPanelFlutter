import 'package:frontend/services/api_service.dart';
import 'package:frontend/services/locator.dart';
import 'package:frontend/services/preference_service.dart';
import 'package:get_it/get_it.dart';

class AccountService {
  void logout() {
    GetIt.I.get<PreferenceService>().removeAccount();
  }

  Future<bool> login(String email, String password) async {
    email = email.toLowerCase();
    Map<String, dynamic> map = await getIt
        .get<ApiService>()
        .send({"email": email, "password": password}, "/login");
    if (map['response']) {
      GetIt.I.get<PreferenceService>().saveAccount(email, map["admin"] as bool);
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
    if (password != confirmPassword || email != confirmEmail) {
      return false;
    }
    Map<String, dynamic> map = await getIt.get<ApiService>().send(
        {"email": email, "password": password, "admin": false}, "/create_user");
    if (map['status'] != "success") {
      return false;
    }
    return login(email, password);
  }

  Future<String> changePassword(
      String password, String confirmPassword, String newpassword) async {
    if (newpassword != confirmPassword)
      return "new password and confirm new password should be the same!";
    Map<String, dynamic> result = await getIt.get<ApiService>().send({
      "email": getIt.get<PreferenceService>().email.trim(),
      "password": password.trim(),
      "newpassword": newpassword.trim()
    }, "/change_password");
    return result["status"].toString();
  }

  Future<bool> changeAdminStatus(String email, bool admin) async {
    Map<String, dynamic> result = await getIt
        .get<ApiService>()
        .send({"email": email, "admin": admin}, "/change_account");
    return result["status"].toString() == "success";
  }
}
