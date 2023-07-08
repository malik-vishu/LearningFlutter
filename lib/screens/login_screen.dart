import 'package:flutter/material.dart';

import '../utils/all_routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String s = "";
  bool change = false;
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
            Text(
              "Welcome $s",
              style: const TextStyle(
                  fontSize: 30,
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.w600),
            ),
            TextFormField(
              decoration: const InputDecoration(
                  hintText: "Enter Username", labelText: "Username"),
              onChanged: (value) {
                s = value;
                setState(() {});
              },
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
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.pushNamed(context, AllRoutes.homeRoute);
            //   },
            //   style: TextButton.styleFrom(minimumSize: const Size(100, 40)),
            //   child: const Text("Login"),
            // )
            InkWell(
              onTap: () async{
                setState(() {
                  change = true;
                });

                await Future.delayed(const Duration(seconds: 1));
                Navigator.pushNamed(context, AllRoutes.homeRoute);
              },
              child: AnimatedContainer(
                duration: const Duration(seconds: 1),
                width: change ? 50 : 120,
                height: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: change ? BoxShape.circle : BoxShape.rectangle),
                child: change
                    ? const Icon(
                        Icons.done,
                        color: Colors.white,
                      )
                    : const Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
              ),
            )
          ]),
        ),
      ]),
    );
  }
}
