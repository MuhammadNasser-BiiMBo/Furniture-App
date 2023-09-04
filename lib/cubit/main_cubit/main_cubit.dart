import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:furnitured/widgets/big_text.dart';
import 'package:sizer/sizer.dart';
import '../../cache_helper/cache_helper.dart';
import '../../constants/components.dart';
import '../../constants/constants.dart';
import '../../models/product_model.dart';
import '../../models/user_model.dart';
import '../../screens/authentication/login_screen.dart';
import 'main_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainCubit extends Cubit<MainStates> {
  MainCubit() : super(LayoutInitialState());

  static MainCubit get(context) => BlocProvider.of(context);

  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  void changeBottomNav(int index) {
    if (index == 1) {
      getFavorites();
    }
    _selectedIndex = index;
    emit(ChangeBottomNavState());
  }
// <----------------------------------UserData--------------------------------->
  UserModel? user;
  void getUserData() {
    emit(GetUserLoadingState());
    String uId = Constants.uId!;
    FirebaseFirestore.instance.collection('Users').doc(uId).get().then((value) {
      user = UserModel.fromJson(value.data()!);
      emit(GetUserSuccessState());
    }).catchError((error) {
      emit(GetUserErrorState());
      print(error.toString());
    });
  }

  void signOut(context) {
    CacheHelper.removeData(key: 'uId').then((value) {
      user = null;
      if (value!) {
        navigateAndFinish(context, LoginScreen());
      }
    });
  }

  void logoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: BigText(
            text: 'Are you sure to log out ?',
            family: 'Gelasio',
            spacing: 0,
            size: 15.sp,
            weight: FontWeight.w400,
          ),
          actions: [
            TextButton(
              onPressed: () {
                signOut(context);
              },
              child: BigText(
                text: 'Yes',
                family: 'Gelasio',
                spacing: 0,
                size: 17.sp,
                weight: FontWeight.w600,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: BigText(
                text: 'No',
                family: 'Gelasio',
                spacing: 0,
                size: 17.sp,
                weight: FontWeight.w600,
              ),
            ),
          ],
        );
      },
    );
  }
  // <------------------------------------------------------------------------->

  // <--------------------------------Favorites-------------------------------->
  List<ProductModel> favorites = [];
  void getFavorites() {
    emit(GetFavLoadingState());
    FirebaseFirestore.instance
        .collection('Users')
        .doc(user!.uId)
        .collection('Favorites')
        .get()
        .then((value) {
      favorites = [];
      for (var element in value.docs) {
        favorites.add(ProductModel.fromJson(element.data()));
      }
      emit(GetFavSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetFavErrorState());
    });
  }

  List<int> inFavorites = [];
  void inFav() {
    FirebaseFirestore.instance
        .collection('Users')
        .doc(user!.uId)
        .collection('Favorites')
        .snapshots().listen((value) {
          inFavorites = [];
          for (var element in value.docs) {
            inFavorites.add(element.data()['id']);
          }
    });
  }

  void updateFav(ProductModel product) {
    emit(UpdateFavLoadingState());
    if(inFavorites.contains(product.id)){
      FirebaseFirestore.instance
          .collection('Users')
          .doc(user!.uId)
          .collection('Favorites')
          .doc('${product.id}')
          .delete()
          .then(
            (value) {
          emit(UpdateFavSuccessState());
        },
      ).catchError((error) {
        emit(UpdateFavErrorState());
        print(error.toString());
      });
    }else{
      FirebaseFirestore.instance
          .collection('Users')
          .doc(user!.uId)
          .collection('Favorites')
          .doc('${product.id}')
          .set(product.toJson())
          .then(
            (value) {
          emit(UpdateFavSuccessState());
        },
      ).catchError((error) {
        emit(UpdateFavErrorState());
        print(error.toString());
      });
    }
    getFavorites();
  }
  // <------------------------------------------------------------------------->

  // <--------------------------------Favorites-------------------------------->
  List<ProductModel> cart = [];
  void getCart() {
    emit(GetCartLoadingState());
    FirebaseFirestore.instance
        .collection('Users')
        .doc(user!.uId)
        .collection('Cart')
        .get()
        .then((value) {
      cart = [];
      for (var element in value.docs) {
        cart.add(ProductModel.fromJson(element.data()));
      }
      emit(GetCartSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetCartErrorState());
    });
  }

  List<int> inCartItems = [];
  void inCart() {
    FirebaseFirestore.instance
        .collection('Users')
        .doc(user!.uId)
        .collection('Cart')
        .snapshots().listen((value) {
      inCartItems = [];
      for (var element in value.docs) {
        inCartItems.add(element.data()['id']);
      }
    });
  }

  void updateCart(ProductModel product) {
    emit(UpdateCartLoadingState());
    if(inCartItems.contains(product.id)){
      FirebaseFirestore.instance
          .collection('Users')
          .doc(user!.uId)
          .collection('Cart')
          .doc('${product.id}')
          .delete()
          .then(
            (value) {
          emit(UpdateCartSuccessState());
        },
      ).catchError((error) {
        emit(UpdateCartErrorState());
        print(error.toString());
      });
    }else{
      FirebaseFirestore.instance
          .collection('Users')
          .doc(user!.uId)
          .collection('Cart')
          .doc('${product.id}')
          .set(product.toJson())
          .then(
            (value) {
          emit(UpdateCartSuccessState());
        },
      ).catchError((error) {
        emit(UpdateCartErrorState());
        print(error.toString());
      });
    }
    getCart();
  }
  // <------------------------------------------------------------------------->

}
