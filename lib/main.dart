import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furnitured/cache_helper/cache_helper.dart';
import 'package:furnitured/cubit/home_cubit/home_cubit.dart';
import 'package:furnitured/cubit/observer/bloc_observer.dart';
import 'package:furnitured/cubit/register_cubit/register_cubit.dart';
import 'package:furnitured/screens/authentication/login_screen.dart';
import 'package:furnitured/screens/layout/layout.dart';
import 'package:sizer/sizer.dart';
import 'constants/constants.dart';
import 'cubit/login_cubit/login_cubit.dart';
import 'cubit/main_cubit/main_cubit.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await CacheHelper.init();
  Bloc.observer= MyBlocObserver();
  Widget widget;
  Constants.uId = CacheHelper.getData(key: 'uId');
  if(Constants.uId!= null){
    widget= const AppLayout();
  }else{
    widget= LoginScreen();
  }
  runApp(MyApp(startWidget: widget,));
}

class MyApp extends StatelessWidget {
  final Widget startWidget;
  const MyApp({super.key,required this.startWidget});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle( const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Set the status bar color
      statusBarBrightness: Brightness.light, // Set the status bar brightness
      statusBarIconBrightness: Brightness.dark, // Set the status bar icon brightness
    ));

    return Sizer(
      builder: (BuildContext context, Orientation orientation, DeviceType deviceType) {

        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (BuildContext context)=>MainCubit()),
            BlocProvider(create: (BuildContext context)=>HomeCubit()..getAllProducts()..getChairProducts()..getTableProducts()..getCouchProducts()..getBedProducts()..getLambProducts()),
            BlocProvider(create: (BuildContext context)=>RegisterCubit()),
            BlocProvider(create: (BuildContext context)=>LoginCubit()),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              useMaterial3: true,
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: const AppBarTheme(color: Colors.white),
            ),
            home: startWidget,
          ),
        );
      },
    );
  }
}

