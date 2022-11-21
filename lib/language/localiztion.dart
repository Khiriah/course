import 'package:course/language/ar.dart';
import 'package:course/language/en.dart';
import 'package:course/language/fr.dart';
import 'package:course/utills/my_string.dart';
import 'package:get/route_manager.dart';

class LocaliztionApp extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    ene: en,
    ara: ar,
    frf: fr,
  };
}