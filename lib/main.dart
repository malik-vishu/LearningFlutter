import 'package:first_app/screens/first_screen.dart';
import 'package:first_app/screens/login_screen.dart';
import 'package:first_app/utils/all_routes.dart';
import 'package:first_app/widgets/themes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: AllThemes.lightTheme(context),
      darkTheme: AllThemes.darkTheme(context),
      initialRoute: AllRoutes.homeRoute,
      routes: {
        "/": (context) => const LoginPage(),
        AllRoutes.homeRoute: (context) => const FirstPage(),
        AllRoutes.loginRoute: (context) => const LoginPage()
      },
    );
  }
}
