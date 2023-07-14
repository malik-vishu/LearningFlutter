import 'package:first_app/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../utils/all_routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String s = "";
  bool change = false;

  final formKey =
      GlobalKey<FormState>(); //giving key to the form for validation

  moveToHome(BuildContext context) async {
    if (formKey.currentState != null && formKey.currentState!.validate()) {
      setState(() {
        change = true;
      });

      await Future.delayed(const Duration(seconds: 1));
      await Navigator.pushNamed(context, AllRoutes.homeRoute);
      setState(() {
        //rendering again on coming back
        change = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.canvasColor,
      child: SingleChildScrollView(
        child: Form(
          //made whole column a form
          key: formKey,
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
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return "Username cannot be empty";
                    }

                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                      hintText: "Enter Password", labelText: "Password"),
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return "Password cannot be empty";
                    } else if (value != null && value.length < 6) {
                      return "Length should be atleast 6";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Material(
                  //wrapped with material on InkWell ,works better than giving decoration to container
                  color: ThemeMode.system == ThemeMode.light
                      ? AllThemes.darkBluishColor
                      : AllThemes.lightBluishColor,
                  borderRadius: BorderRadius.circular(change ? 40 : 8),
                  child: InkWell(
                    onTap: () => moveToHome(context),
                    child: AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      width: change ? 50 : 120,
                      height: 40,
                      alignment: Alignment.center,
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
                  ),
                )
              ]),
            ),
          ]),
        ),
      ),
    );
  }
}
