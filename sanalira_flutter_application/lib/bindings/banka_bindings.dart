
import 'package:get/get.dart';
import 'package:sanalira_flutter_application/controller/banka_controller.dart';

class BankaScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BankaController());
  
    //Get.lazyPut<NefesController>(() => NefesController());
    //Get.put(HomePageController());
  }
}