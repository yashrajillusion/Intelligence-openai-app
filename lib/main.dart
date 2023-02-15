import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intelligence/infrastructure/common/route_constant.dart';
import 'package:intelligence/infrastructure/common/routers.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Intelligence",
      debugShowCheckedModeBanner: false,
      initialRoute: RouteConstants.initialRoute,
      onGenerateRoute: Routers.generateRoute,
    );
  }
}
