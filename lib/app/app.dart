import 'package:ecom/app/app_theme_data.dart';
import 'package:ecom/app/controller_binder.dart';
import 'package:ecom/features/auth/ui/screen/complete_profile_screen.dart';
import 'package:ecom/features/auth/ui/screen/email_verification_screen.dart';
import 'package:ecom/features/auth/ui/screen/otp_verification_screen.dart';
import 'package:ecom/features/auth/ui/screen/splash_screen.dart';
import 'package:ecom/features/category/ui/screens/category_list_screen.dart';
import 'package:ecom/features/product/ui/screens/product_details_screen.dart';
import 'package:ecom/features/product/ui/screens/product_list_screen.dart';

import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import '../features/common/ui/screens/main_bottom_nav_screen.dart';
import '../features/product/ui/screens/product_create_review_screen.dart';
import '../features/product/ui/screens/product_review_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemeData.lightThemeData,
      darkTheme: AppThemeData.darkThemeData,
      themeMode: ThemeMode.light,
      initialBinding: ControllerBinder(),
      initialRoute: '/',
      onGenerateRoute: (RouteSettings settings) {
        late Widget widget;
        if (settings.name == SplashScreen.name) {
          widget = const SplashScreen();
        } else if (settings.name == EmailVerificationScreen.name) {
          widget = const EmailVerificationScreen();
        } else if (settings.name == OtpVerificationScreen.name) {
          widget = const OtpVerificationScreen();
        } else if (settings.name == CompleteProfileScreen.name) {
          widget = const CompleteProfileScreen();
        } else if (settings.name == MainBottomNavScreen.name) {
          widget = const MainBottomNavScreen();
        } else if (settings.name == CategoryListScreen.name) {
          widget = const CategoryListScreen();
        } else if (settings.name == ProductListScreen.name) {
          String name = settings.arguments as String;
          widget = ProductListScreen(categoryName: name);
        } else if (settings.name == ProductDetailsScreen.name) {
          int ProductId = settings.arguments as int;
          widget = ProductDetailsScreen(
            productId: ProductId,
          );
        } else if (settings.name == ProductReviewScreen.name) {
          int ProductId = settings.arguments as int;
          widget = ProductReviewScreen(
            productId: ProductId,
          );
        }else if (settings.name == ProductCreateReviewScreen.name) {
          widget = const ProductCreateReviewScreen();
        }

        return MaterialPageRoute(
          builder: (ctx) {
            return widget;
          },
        );
      },
    );
  }
}
