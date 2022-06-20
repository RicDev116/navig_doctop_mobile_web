import 'package:get/get.dart';

class NotificationsController extends GetxController{

  List<bool> checkBoxStatus = List.generate(4, (index) => false);

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onChangeCheckboxItem(int index){
    checkBoxStatus[index] = !checkBoxStatus[index]; 
    update(["checkbox-list"]);
  }
  
}