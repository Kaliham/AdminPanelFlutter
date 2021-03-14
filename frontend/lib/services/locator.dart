import 'package:frontend/services/account_service.dart';
import 'package:frontend/services/api_service.dart';
import 'package:frontend/services/preference_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void initLocators() {
  getIt.registerSingleton<PreferenceService>(PreferenceService());
  getIt.registerSingleton<ApiService>(ApiService());
  getIt.registerSingleton<AccountService>(AccountService());
}
