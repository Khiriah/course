import 'package:course/logic/bindings/auth_binding.dart';
import 'package:course/logic/bindings/main_binding.dart';
import 'package:course/logic/bindings/product_binding.dart';
import 'package:course/view/screens/auth/login_screen.dart';
import 'package:course/view/screens/auth/signup_screen.dart';
import 'package:course/view/screens/main_screen.dart';
import 'package:course/view/widgets/home/cart_screen.dart';
import 'package:get/get.dart';
import '../view/screens/auth/forgot_password_screen.dart';
import '../view/screens/welcome_screen.dart';

class AppRoutes {
  static const welcome = Routes.welcomeScreen;
  static const mainScreen = Routes.mainScreen;
  static final routes = [
    GetPage(name: Routes.welcomeScreen, page: () => const WelcomeScreen()),
    GetPage(
        name: Routes.loginScreen,
        page: () => LoginScreen(),
        binding: AuthBinding()),
    GetPage(
        name: Routes.signUpScreen,
        page: () => SignUpScreen(),
        binding: AuthBinding()),
    GetPage(
        name: Routes.forgotPasswordScreen,
        page: () => ForgotPasswordScreen(),
        binding: AuthBinding()),
    GetPage(
      name: Routes.mainScreen,
      page: () => MainScreen(),
      bindings: [
        AuthBinding(),
        MainBinding(),
        ProductBinding(),
      ],
    ),
    GetPage(
        name: Routes.cartScreen,
        page: () => CartScreen(),
        bindings: [
        AuthBinding(),
  ProductBinding(),
  ],
  ) ];
}

class Routes {
  static const welcomeScreen = "/welcome_screen";
  static const loginScreen = "/login_screen";
  static const signUpScreen = "/signup_screen";
  static const forgotPasswordScreen = "/forgot_password";
  static const mainScreen = '/main_screen';
  static const cartScreen = '/cart_screen';
}
