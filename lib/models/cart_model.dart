
class CartModel {
  int? id;
  String? name;
  dynamic price;
  int? quantity;
  String? img;
  String? desc;
  int? reviews;
  dynamic rate;


  CartModel({
    this.name,
    this.id,
    this.price,
    this.desc,
    this.img,
    this.rate,
    this.reviews,
    this.quantity,
  });

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    desc = json['desc'];
    img = json['img'];
    rate = json['rate'];
    reviews = json['reviews'];
    quantity = json['quantity'];
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
      'quantity': quantity,
    };
  }
}
