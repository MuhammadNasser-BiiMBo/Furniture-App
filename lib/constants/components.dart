import 'package:flutter/material.dart';
import 'package:furnitured/constants/colors.dart';
import 'package:furnitured/screens/layout/favorites_screen.dart';
import 'package:furnitured/screens/layout/home_screen.dart';
import 'package:furnitured/screens/layout/notifications_screen.dart';
import 'package:furnitured/screens/layout/profile_screen.dart';


void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );
void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      (route) => false,
    );

// navBar components
List<IconData> enableIcons = [
  Icons.home,
  Icons.bookmark,
  Icons.notifications,
  Icons.person,
];
List<IconData> disableIcons = [
  Icons.home_outlined,
  Icons.bookmark_outline,
  Icons.notifications_outlined,
  Icons.person_outline,
];
List<String> navLabels = [
  'Home',
  'Favourites',
  'Notifications',
  'Profile',
];
List<Widget> pages = [
  const HomeScreen(),
  const FavoritesScreen(),
  const NotificationsScreen(),
  const ProfileScreen(),
];

// category components

List<String> categoryImages = [
  'assets/icons/star.svg',
  'assets/icons/chair.svg',
  'assets/icons/table.svg',
  'assets/icons/sofa.svg',
  'assets/icons/bed.svg',
  'assets/icons/lampCategory.svg',
];
List<String> categoryLabels = [
  'All Products',
  'Chair',
  'Table',
  'Couch',
  'Bed',
  'Lamp',
];

List<Color> productColor = [
  AppColors.appGrey,
  AppColors.appBrown,
  AppColors.appBeige,
];

List<String> paymentLabels = [
  'Visa',
  'Ref Code',
];
List<String> paymentImages = [
  'assets/icons/visa.png',
  'assets/icons/kiosk_payment.png',
];