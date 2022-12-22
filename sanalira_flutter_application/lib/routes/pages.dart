import 'package:get/get.dart';
import 'package:sanalira_flutter_application/bindings/banka_bindings.dart';
import 'package:sanalira_flutter_application/bindings/register_bindings.dart';
import 'package:sanalira_flutter_application/routes/routes.dart';
import 'package:sanalira_flutter_application/views/banka_screen.dart';
import 'package:sanalira_flutter_application/views/register_screen.dart';

class Pages {
  static final pages = [
    GetPage(
        name: Routes.RegisterScreen,
        page: () => RegisterScreen(),
        binding: RegisterScreenBindings()),
            GetPage(
        name: Routes.BankaScreen,
        page: () => BankaScreen(),
        binding: BankaScreenBinding()),
       
  ];
}