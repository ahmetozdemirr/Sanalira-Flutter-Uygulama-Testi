import 'package:get/get.dart';
import 'package:sanalira_flutter_application/controller/register_controller.dart';
import 'package:sanalira_flutter_application/views/register_screen.dart';

class RegisterScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(Registerontroller(), permanent: true);
  }
}
