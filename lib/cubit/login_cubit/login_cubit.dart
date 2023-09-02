import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furnitured/cache_helper/cache_helper.dart';
import 'package:furnitured/cubit/login_cubit/login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  Future<void> userLogin({required String email,required String password}) async {
    emit(LoginLoadingState());
    FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    ).then((value) {
      CacheHelper.saveData(key: 'uId', value: value.user!.uid);
      emit(LoginSuccessState());
    }).catchError((error){
      emit(LoginErrorState());
    });
  }

  IconData suffix=Icons.visibility_off_outlined;
  bool isPassword = true;
  void changePasswordVisibility(){
    isPassword=!isPassword;
    suffix= isPassword?Icons.visibility_off_outlined:Icons.visibility_outlined;
    emit(ChangePasswordVisibilityState());
  }
}

