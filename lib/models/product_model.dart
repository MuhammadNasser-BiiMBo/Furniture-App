import 'dart:ui';

class ProductModel {
  int? id;
  String? name;
  dynamic price;
  String? img;
  String? desc;
  int? reviews;
  dynamic rate;


  ProductModel({
    this.name,
    this.id,
    this.price,
    this.desc,
    this.img,
    this.rate,
    this.reviews,

  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    desc = json['desc'];
    img = json['img'];
    rate = json['rate'];
    reviews = json['reviews'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'desc': desc,
      'price': price,
      'rate': rate,
      'img': img,
      'reviews': reviews,
    };
  }
}
