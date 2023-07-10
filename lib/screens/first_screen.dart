import 'package:flutter/material.dart';

import '../widgets/drawer.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HI"),
      ),
      body: const Center(
        child: Text("data"),
      ),
      drawer: const MyDrawer(),
    );
  }
}
