import 'dart:convert';

class CatalogModel {
  static List<Items>? productList;
}

class Items {
  final int id;
  final String name;
  final String description;
  final num price;
  final String color;
  final String imageUrl;

  Items(this.id, this.name, this.description, this.price, this.color,
      this.imageUrl);

  Items copyWith({
    int? id,
    String? name,
    String? description,
    num? price,
    String? color,
    String? imageUrl,
  }) {
    return Items(
      id ?? this.id,
      name ?? this.name,
      description ?? this.description,
      price ?? this.price,
      color ?? this.color,
      imageUrl ?? this.imageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'color': color,
      'imageUrl': imageUrl,
    };
  }

  factory Items.fromMap(Map<String, dynamic> map) {
    return Items(
      map['id'] as int,
      map['name'] as String,
      map['desc'] as String,
      map['price'] as num,
      map['color'] as String,
      map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Items.fromJson(String source) =>
      Items.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Items(id: $id, name: $name, description: $description, price: $price, color: $color, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(covariant Items other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.description == description &&
        other.price == price &&
        other.color == color &&
        other.imageUrl == imageUrl;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        description.hashCode ^
        price.hashCode ^
        color.hashCode ^
        imageUrl.hashCode;
  }
}

  // factory Items.fromMap(Map<String, dynamic> map) {
  //   return Items(
  //       id: map["id"],
  //       name: map["name"],
  //       description: map['desc'],
  //       price: map['price'],
  //       color: map['color'],
  //       imageUrl: map['image']);
  // }

  // toMap() => {
  //       'id': id,
  //       'name': name,
  //       'desc': description,
  //       'price': price,
  //       'color': color,
  //       'image_url': imageUrl
  //     };

  

