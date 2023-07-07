import 'package:flutter/material.dart';

import '../utils/all_routes.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(children: [
        const SizedBox(
          height: 160,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 35),
          child: Column(children: [
            const Text(
              "Welcome",
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.w600),
            ),
            TextFormField(
              decoration: const InputDecoration(
                  hintText: "Enter Username", labelText: "Username"),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                  hintText: "Enter Password", labelText: "Password"),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AllRoutes.homeRoute);
              },
              style: TextButton.styleFrom(minimumSize: const Size(100, 40)),
              child: const Text("Login"),
            )
          ]),
        ),
      ]),
    );
  }
}
