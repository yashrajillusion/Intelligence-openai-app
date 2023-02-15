import 'package:flutter/material.dart';
import 'package:intelligence/infrastructure/common/route_constant.dart';
import 'package:intelligence/ui/common/chat_screen.dart';
import 'package:intelligence/ui/common/splash_screen.dart';

class Routers {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstants.home:
        return MaterialPageRoute(
          builder: (context) => const ChatScreen(),
        );
      case RouteConstants.initialRoute:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      default:
        return MaterialPageRoute(builder: (context) => Container());
    }
  }
}
