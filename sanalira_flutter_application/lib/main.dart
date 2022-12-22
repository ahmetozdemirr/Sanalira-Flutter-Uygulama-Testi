import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sanalira_flutter_application/controller/register_controller.dart';
import 'package:sanalira_flutter_application/routes/pages.dart';
import 'package:sanalira_flutter_application/routes/routes.dart';
import 'package:sanalira_flutter_application/views/banka_screen.dart';
import 'package:sanalira_flutter_application/views/register_screen.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  final userdata = GetStorage();
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        getPages: Pages.pages,
        initialRoute: Routes.RegisterScreen,
        home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final userdata = GetStorage();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userdata.writeIfNull('isLogged', false);
    Future.delayed(Duration.zero, () async {
      checkiflogged();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Center(
        child: CircularProgressIndicator(),
      )),
    );
  }

  void checkiflogged() {
    userdata.read('isLogged')
        ? Get.offAll(BankaScreen())
        : Get.offAll(RegisterScreen());
  }
}
