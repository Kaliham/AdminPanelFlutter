import 'package:flutter/material.dart';
import 'package:frontend/auth_wrapper.dart';
import 'package:frontend/constants/color_constants.dart';
import 'package:frontend/services/locator.dart';
import 'package:frontend/services/preference_service.dart';
import 'package:frontend/view/page/add/add_view.dart';
import 'package:frontend/view/page/edit/edit_view.dart';
import 'package:frontend/view/page/home/home_view.dart';
import 'package:frontend/view/page/login/login_view.dart';
import 'package:frontend/view/page/profile/profile_view.dart';
import 'package:frontend/view/page/register/register_view.dart';
import 'package:frontend/view/page/view/view_view.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  initLocators();
  getIt.get<PreferenceService>().loadPrefs();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routes: {
        '/': (context) => AuthWrapper(),
        // '/Home': (context) => HomeView(),
        '/login': (context) => LoginView(),
        '/register': (context) => RegisterView(),
        '/profile': (context) => ProfileView(),
        '/add': (context) => AddView(),
      },
      onGenerateRoute: _getRoute,
      theme: ThemeData(
        pageTransitionsTheme: PageTransitionsTheme(
            builders: {TargetPlatform.android: ZoomPageTransitionsBuilder()}),
        primarySwatch: Colors.lightBlue,
        accentColor: kOldGeranium,
        fontFamily: GoogleFonts.roboto().fontFamily,
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }

  Route<dynamic> _getRoute(RouteSettings settings) {
    if (settings.name == '/edit') {
      // FooRoute constructor expects SomeObject
      return _buildRoute(settings, new EditView(settings.arguments));
    } else if (settings.name == '/view') {
      // FooRoute constructor expects SomeObject
      return _buildRoute(settings, new ViewView(settings.arguments));
    }

    return null;
  }

  MaterialPageRoute _buildRoute(RouteSettings settings, Widget builder) {
    return new MaterialPageRoute(
      settings: settings,
      builder: (ctx) => builder,
    );
  }
}
