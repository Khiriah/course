import 'package:course/view/screens/category_screen.dart';
import 'package:course/view/screens/favorites_screen.dart';
import 'package:course/view/screens/home_screen.dart';
import 'package:course/view/screens/settings_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class MainController extends GetxController {//هذا الملف تابع للبوتوم بار نافيقيشن فيه تدفق معلومات جاي من الفاير بيس فلازم نتسخدم obs
  RxInt currentIndex = 0.obs; //Rx نوع المتغير يصير obs مع ال

  var tabs = [
    HomeScreen(),
    CategoryScreen(),
    FavoritesScreen(),
    SettingsScreen(),
  ].obs;

  var title = [
    "Khairo Shop",
    "Categories",
    'Favourites',
    "Settings",
  ].obs;
}