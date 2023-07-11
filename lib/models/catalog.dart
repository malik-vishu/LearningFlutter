class CatalogModel {
  static final List<Items> productList = [
    Items(
        id: 1,
        name: "Phone",
        description: "6th Gen",
        price: 1000,
        color: "#33505a")
  ];
}

class Items {
  final int id;
  final String name;
  final String description;
  final num price;
  final String color;
  //final String imageUrl;

  Items({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.color,
    //required this.imageUrl
  });
}
