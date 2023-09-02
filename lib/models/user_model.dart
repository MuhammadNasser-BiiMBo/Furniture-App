class UserModel {
  String? name;
  String? email;
  String? phone;
  String? uId;
  String? image;
  String? address;
  int? orders;
  int? reviews;
  UserModel({
    this.name,
    this.email,
    this.phone,
    this.uId,
    this.image,
    this.address,
    this.reviews,
    this.orders,
  });

  UserModel.fromJson(Map<String,dynamic> json){
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    uId = json['uId'];
    image = json['image'];
    address = json['address'];
    reviews = json['reviews'];
    orders = json['orders'];
  }

  Map<String,dynamic> toMap(){
    return {
      'name':name,
      'email':email,
      'phone':phone,
      'uId':uId,
      'image':image,
      'address':address,
      'reviews':reviews,
      'orders':orders,
    };
  }


}
