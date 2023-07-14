import 'package:first_app/models/catalog.dart';
import 'package:first_app/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/all_routes.dart';
import '../widgets/home_widgets/catalog_list.dart';
import '../widgets/home_widgets/header.dart';
import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    Future.delayed(const Duration(seconds: 10));
    final jsonData = await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(jsonData);
    var productsData = decodedData["products"];
    print(productsData);

    CatalogModel.productList = List.from(productsData)
        .map<Items>((item) => Items.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, AllRoutes.cartRoute),
          backgroundColor: ThemeMode.system == ThemeMode.light?AllThemes.darkBluishColor:AllThemes.lightBluishColor,
          child: const Icon(
            Icons.shopping_cart,
            color: Colors.white,
          ),
        ),
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Header(),
            if (CatalogModel.productList != null &&
                CatalogModel.productList!.isNotEmpty)
              const CatalogList().py16().expand()
            else
              const CircularProgressIndicator().expand().centered()
          ]),
        ),
      ),
    );
  }
}
