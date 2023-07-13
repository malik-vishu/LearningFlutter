import 'package:first_app/models/catalog.dart';
import 'package:first_app/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class DetailScreen extends StatelessWidget {
  final Items catalog;
  const DetailScreen({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        backgroundColor: AllThemes.creamColor,
        body: SafeArea(
          bottom: false,
          child: Column(
            children: [
              Hero(
                      tag: Key(catalog.id.toString()),
                      child: Image.network(catalog.imageUrl).wFull(context))
                  .h32(context),
              Expanded(
                  child: VxArc(
                height: 30.0,
                edge: VxEdge.top,
                arcType: VxArcType.convey,
                child: Container(
                  color: Colors.white,
                  width: context.screenWidth,
                  child: Column(
                    children: [
                      catalog.name.text.bold.xl4
                          .color(AllThemes.darkBluishColor)
                          .make(),
                      catalog.description.text
                          .textStyle(context.captionStyle)
                          .xl
                          .make(),
                    ],
                  ).py64(),
                ),
              ))
            ],
          ),
        ),
        bottomNavigationBar: Container(
          color: Colors.white,
          child: ButtonBar(
            buttonPadding: EdgeInsets.zero,
            alignment: MainAxisAlignment.spaceBetween,
            children: [
              "\$${catalog.price}".text.bold.red800.xl4.make(),
              ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          shape:
                              const MaterialStatePropertyAll(StadiumBorder()),
                          backgroundColor: MaterialStatePropertyAll(
                              AllThemes.darkBluishColor)),
                      child: "Buy".text.make())
                  .wh(100, 50),
            ],
          ).p32(),
        ));
  }
}
