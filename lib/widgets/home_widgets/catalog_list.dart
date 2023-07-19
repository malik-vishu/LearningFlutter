import 'package:first_app/screens/detail_screen.dart';
import 'package:first_app/widgets/home_widgets/catalog_image.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/catalog.dart';
import '../themes.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: CatalogModel.productList!.length,
        itemBuilder: (context, index) {
          final catalog = CatalogModel.productList[index];
          //final catalog = CatalogModel.getByPosition(index);
          return InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailScreen(catalog: catalog))),
            child: CatalogItem(
              catalog: catalog,
            ),
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
      Hero(
          tag: Key(catalog.id.toString()),
          child: CatalogImage(image: catalog.imageUrl)),
      Expanded(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          catalog.name.text.lg.color(context.accentColor).bold.make(),
          catalog.description.text.textStyle(context.captionStyle).lg.make(),
          ButtonBar(
            buttonPadding: EdgeInsets.zero,
            alignment: MainAxisAlignment.spaceBetween,
            children: [
              "\$${catalog.price}".text.bold.xl.make(),
              ElevatedButton(
                  onPressed: () {},
                  style: const ButtonStyle(
                    shape: MaterialStatePropertyAll(StadiumBorder()),
                    // backgroundColor:
                    //     context.theme.elevatedButtonTheme
                  ),
                  child: "Buy".text.make()),
            ],
          ).pOnly(right: 8.0)
        ],
      ))
    ])).color(context.cardColor).rounded.square(150).make().py16();
  }
}
