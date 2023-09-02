import 'package:furnitured/models/product_model.dart';

class CategoryModel{
  String? categoryName;
  List<ProductModel>? categoryProducts;
  CategoryModel({this.categoryName,this.categoryProducts});

  CategoryModel.fromJson(Map<String,dynamic> json){
    categoryName = json['categoryName'];
    json['categoryProducts'].forEach((element){
      categoryProducts!.add(ProductModel.fromJson(element));
    });
  }
}