import 'package:get/get.dart';

class AuthController extends GetxController{
  bool isVisibilty = false;
  bool isCheckBox = false;
  void Visibilty(){
isVisibilty= !isVisibilty;
update();
  }

void checBox(){
  isCheckBox= !isCheckBox;
  update();
}
}