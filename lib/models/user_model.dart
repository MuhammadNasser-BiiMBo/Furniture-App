import 'package:furnitured/models/address_model.dart';

class UserModel {
  String? name;
  String? email;
  String? phone;
  String? uId;
  String? image;
  AddressModel? address;
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
    address = AddressModel.fromJson(json['address']);
    reviews = json['reviews'];
    orders = json['orders'];
  }

  Map<String,dynamic> toJson(){
    return {
      'name':name,
      'email':email,
      'phone':phone,
      'uId':uId,
      'image':image,
      'address':address?.toJson(),
      'reviews':reviews,
      'orders':orders,
    };
  }


}
