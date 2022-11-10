import 'package:get/get.dart';

import '../view/screens/home_screen.dart';
import '../view/screens/welcome_screen.dart';

class AppRoutes{
  static const welcome = Routes.wScreen;
  static final routes = [
GetPage(name: Routes.wScreen, page: ()=>const WelcomeScreen())
  ];


}
class Routes{
  static const wScreen="/welcome_screen";
}