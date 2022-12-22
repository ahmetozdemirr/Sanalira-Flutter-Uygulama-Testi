import 'package:flutter/material.dart';
import 'package:sanalira_flutter_application/models/country_model.dart';
import 'package:sanalira_flutter_application/utils/api.dart';
import 'package:get/get.dart';
import 'package:sanalira_flutter_application/views/banka_screen.dart';

class Registerontroller extends GetxController with WidgetsBindingObserver {
  onInit() {
    super.onInit();
    WidgetsBinding.instance.addObserver(this);
  }

  onDispose() {
    WidgetsBinding.instance.removeObserver(this);
  }

  onClose() {
    super.onClose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      // Uygulama açıldığında Banka Listesi sayfasına yönlendir
      Get.offAll(BankaScreen());
    }
    super.didChangeAppLifecycleState(state);
    print('state = $state');
  }
}
