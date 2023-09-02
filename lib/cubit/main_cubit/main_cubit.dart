import 'package:cloud_firestore/cloud_firestore.dart';
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
    _selectedIndex = index;
    emit(ChangeBottomNavState());
  }

  UserModel? user;
  void getUserData() {
    emit(GetUserLoadingState());
    String uId = Constants.uId!;
    FirebaseFirestore.instance.collection('Users').doc(uId).get().then((value) {
      user = UserModel.fromJson(value.data()!);
      emit(GetUserSuccessState());
    }).catchError((error) {
      emit(GetUserErrorState());
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


}
