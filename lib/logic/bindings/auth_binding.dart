import 'package:course/logic/controller/auth_controller.dart';
import 'package:get/get.dart';

class AuthBinding extends Bindings{
  @override
  void dependencies() {
  Get.put(AuthController());
  }

}