import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furnitured/cubit/home_cubit/home_states.dart';

import '../../models/product_model.dart';


class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  int _selectedCategory = 0;
  int get selectedCategory => _selectedCategory;

  void changeCategory(int index) {
    _selectedCategory = index;
    emit(HomeChangeCatState());
  }
  List<ProductModel> allProducts = [];
  void getAllProducts() {
    emit(GetPopularProductsLoadingState());
    FirebaseFirestore.instance
        .collection('Products')
        .doc('Popular')
        .get()
        .then((value) {
      value['categoryProducts'].forEach((element){
        allProducts.add(ProductModel.fromJson(element));
      });
      emit(GetPopularProductsSuccessState());
    }).catchError((error){
      emit(GetPopularProductsErrorState());
    });
  }

  List<ProductModel> chairs = [];
  void getChairProducts() {
    emit(GetChairsLoadingState());
    FirebaseFirestore.instance
        .collection('Products')
        .doc('Popular')
        .get()
        .then((value) {
      value['categoryProducts'].forEach((element){
        if(element['desc'].contains('Chair')){
          chairs.add(ProductModel.fromJson(element));
        }
      });
      emit(GetChairsSuccessState());
    }).catchError((error){
      emit(GetChairsErrorState());
    });
  }

  List<ProductModel> tables = [];
  void getTableProducts() {
    emit(GetTablesLoadingState());
    FirebaseFirestore.instance
        .collection('Products')
        .doc('Popular')
        .get()
        .then((value) {
      value['categoryProducts'].forEach((element){
        if(element['desc'].contains('Table')){
          tables.add(ProductModel.fromJson(element));
        }
      });
      emit(GetTablesSuccessState());
    }).catchError((error){
      emit(GetTablesErrorState());
    });
  }

  List<ProductModel> couches = [];
  void getCouchProducts() {
    emit(GetCouchesLoadingState());
    FirebaseFirestore.instance
        .collection('Products')
        .doc('Popular')
        .get()
        .then((value) {
      value['categoryProducts'].forEach((element){
        if(element['desc'].contains('Couch')){
          couches.add(ProductModel.fromJson(element));
        }
      });
      emit(GetCouchesSuccessState());
    }).catchError((error){
      emit(GetCouchesErrorState());
    });
  }

  List<ProductModel> beds = [];
  void getBedProducts() {
    emit(GetBedsLoadingState());
    FirebaseFirestore.instance
        .collection('Products')
        .doc('Popular')
        .get()
        .then((value) {
      value['categoryProducts'].forEach((element){
        if(element['desc'].contains('Bed')){
          beds.add(ProductModel.fromJson(element));
        }
      });
      emit(GetBedsSuccessState());
    }).catchError((error){
      emit(GetBedsErrorState());
    });
  }

  List<ProductModel> lambs = [];
  void getLambProducts() {
    emit(GetLambsLoadingState());
    FirebaseFirestore.instance
        .collection('Products')
        .doc('Popular')
        .get()
        .then((value) {
      value['categoryProducts'].forEach((element){
        if(element['desc'].contains('Lamb')){
          lambs.add(ProductModel.fromJson(element));
        }
      });
      emit(GetLambsSuccessState());
    }).catchError((error){
      emit(GetLambsErrorState());
    });
  }

  List<List<ProductModel>> categories = [];
  List<List<ProductModel>> getCategories(){
    categories.add(allProducts);
    categories.add(chairs);
    categories.add(tables);
    categories.add(couches);
    categories.add(beds);
    categories.add(lambs);
    return categories;
  }
}
