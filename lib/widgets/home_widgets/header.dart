import 'package:flutter/material.dart';
import '../themes.dart';
import 'package:velocity_x/velocity_x.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      "Catalog App".text.xl5.bold.color(context.theme.scaffoldBackgroundColor).make(),
      "Trending".text.xl2.make()
    ]);
  }
}
