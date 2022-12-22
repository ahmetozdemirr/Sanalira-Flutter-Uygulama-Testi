import 'package:get/get.dart';
import 'package:sanalira_flutter_application/models/banka_model.dart';
import 'package:sanalira_flutter_application/routes/routes.dart';
import 'package:sanalira_flutter_application/services/services.dart';
import 'package:sanalira_flutter_application/views/banka_screen.dart';

class BankaController extends GetxController {
  Service service = new Service();

  List<BankaListeleriData?> banks = [];
  bool isLoading = true;

  void changeLoading() {
    isLoading = !isLoading;
  }

  void guncelle() {
    update();
  }

  getir() async {
    banks = await service.fetchBank() as List<BankaListeleriData?>;
    update();
  }

  /*downloadCondition() {
    service.fetchBank().then((value) => {
          if (value != null && value.data != null) {banks = value.data!} else {}
        });
    update();
  }*/

  var tabBarIndex = 0.obs;
  var _currentScreen = BankaScreen().obs;
  final pages = <String>[
    Routes.BankaScreen,
    Routes.BankaScreen,
    Routes.BankaScreen,
    Routes.BankaScreen,
    Routes.BankaScreen,
  ];

  void changeTabIndex(int index) {
    tabBarIndex.value = index;
    //Get.toNamed(pages[index]);
    // _currentScreen = (index == 0) ? GraphPage() : HistoryPage();
    // update();S
  }
}
