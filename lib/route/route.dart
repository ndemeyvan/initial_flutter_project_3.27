import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:maliya_mobile/0_splash_screen/presentation/splash_screen.dart';
import 'package:maliya_mobile/2_login/presentation/login_screen.dart';
import 'package:maliya_mobile/utils/app_constant.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splashScreen:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case AppRoutes.login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: Text('Error')),
          body: Center(child: Text('Page not found')),
        );
      },
    );
  }
}
