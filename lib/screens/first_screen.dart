import 'package:first_app/models/catalog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/drawer.dart';
import '../widgets/item_widget.dart';
import 'dart:convert';

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
    //final dummyList = List.generate(5,(index)=>CatalogModel.productList[0]);
    return Scaffold(
      appBar: AppBar(
        title: const Text(textScaleFactor: 1.5, "CatalogApp"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: (CatalogModel.productList != null &&
                  CatalogModel.productList!.isNotEmpty)
              ? ListView.builder(
                  itemCount: CatalogModel.productList!.length,
                  itemBuilder: (context, index) {
                    return ItemWidget(
                      item: CatalogModel.productList![index],
                    );
                  })
              : const Center(child: CircularProgressIndicator())),
      drawer: const MyDrawer(),
    );
  }
}
