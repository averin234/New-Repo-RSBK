import 'package:get/get.dart';

import '../controllers/info_pluitcare_controller.dart';



class InforsbkcareBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InforsbkcareController>(
      () => InforsbkcareController(),
    );
  }
}
