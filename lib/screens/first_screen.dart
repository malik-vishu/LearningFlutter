import 'package:first_app/models/catalog.dart';
import 'package:first_app/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/drawer.dart';
import '../widgets/item_widget.dart';
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
    //final dummyList = List.generate(5,(index)=>CatalogModel.productList[0]);
    return Scaffold(
      backgroundColor: AllThemes.creamColor,
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            // "Catalog App".text.xl5.bold.color(AllThemes.darkBluishColor).make(),
            // "Trending".text.xl2.make()
            const Header(),
            if (CatalogModel.productList != null &&
                CatalogModel.productList!.isNotEmpty)
              const CatalogList().expand()
            else
              const Center(
                child: CircularProgressIndicator(),
              )
          ]),
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      "Catalog App".text.xl5.bold.color(AllThemes.darkBluishColor).make(),
      "Trending".text.xl2.make()
    ]);
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: CatalogModel.productList!.length,
        itemBuilder: (context, index) {
          final catalog = CatalogModel.productList![index];
          return CatalogItem(
            catalog: catalog,
          );
        });
  }
}

class CatalogItem extends StatelessWidget {
  final Items catalog;
  const CatalogItem({Key? key, required this.catalog}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(children: [
      CatalogImage(image: catalog.imageUrl),
      Expanded(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          catalog.name.text.bold.lg.color(AllThemes.darkBluishColor).make(),
          catalog.description.text.textStyle(context.captionStyle).lg.make(),
          ButtonBar(
            buttonPadding: EdgeInsets.zero,
            alignment: MainAxisAlignment.spaceBetween,
            children: [
              "\$${catalog.price}".text.bold.xl.make(),
              ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      shape: const MaterialStatePropertyAll(StadiumBorder()),
                      backgroundColor:
                          MaterialStatePropertyAll(AllThemes.darkBluishColor)),
                  child: "Buy".text.make()),
            ],
          ).pOnly(right: 8.0, top: 2.0)
        ],
      ))
    ])).blue100.square(120).rounded.make().py16();
  }
}

class CatalogImage extends StatelessWidget {
  final String image;
  const CatalogImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Image.network(image)
        .box
        .rounded
        .p8
        .color(AllThemes.creamColor)
        .make()
        .p16()
        .w40(context);
  }
}
