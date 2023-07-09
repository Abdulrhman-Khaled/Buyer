class ProductModel {
  String? name, image, description, sized, price, color;

  ProductModel(
      {this.name,
      this.image,
      this.description,
      this.color,
      this.sized,
      this.price});

  ProductModel.fromJson(Map<dynamic, dynamic> map) {
    if (map.isEmpty) {
      return;
    }

    name = map['name'];
    image = map['image'];
    description = map['desc'];
    color = map['color'];
    sized = map['sized'];
    price = map['price'];
  }

  toJson() {
    return {
      'name': name,
      'image': image,
      'desc': description,
      'color': color,
      'size': sized,
      'price': price,
    };
  }
}
