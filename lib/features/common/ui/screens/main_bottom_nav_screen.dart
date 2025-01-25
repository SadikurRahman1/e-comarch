import 'package:ecom/features/card/ui/screens/card_list_screen.dart';
import 'package:ecom/features/category/ui/screens/category_list_screen.dart';
import 'package:ecom/features/home/ui/screens/home_screen.dart';
import 'package:ecom/features/wishlist/ui/screens/wish_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../controllers/main_bottom_nav_controller.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});


  static const String name = '/bottom-nav-screen';

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {

  final List<Widget> _screen = [
    const HomeScreen(),
    const CategoryListScreen(),
    const CardListScreen(),
    const WishListScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainBottomNavController>(
      builder: (bottomNavController) {
        return Scaffold(
          body: _screen[bottomNavController.selectedIndex],
          bottomNavigationBar: NavigationBar(
            selectedIndex: bottomNavController.selectedIndex,
            onDestinationSelected: bottomNavController.changeIndex,
            destinations: const [
              NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
              NavigationDestination(
                  icon: Icon(Icons.category), label: 'Category'),
              NavigationDestination(
                  icon: Icon(Icons.shopping_cart), label: 'Shopping'),
              NavigationDestination(
                  icon: Icon(Icons.favorite), label: 'Wishlist'),
            ],
          ),
        );
      },
    );
  }
}
