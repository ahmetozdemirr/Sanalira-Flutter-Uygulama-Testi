import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanalira_flutter_application/constants/colors.dart';
import 'package:sanalira_flutter_application/controller/banka_controller.dart';
import 'package:sanalira_flutter_application/models/banka_model.dart';
import 'package:sanalira_flutter_application/services/services.dart';
import 'package:sanalira_flutter_application/views/register_screen.dart';

class BankaScreen extends StatelessWidget {
  BankaScreen({Key? key}) : super(key: key);
  Service _service = Service();
  List<BankaListeleriData> banks = [];

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: bankaBackground,
      appBar: AppBar(
        backgroundColor: bankaBackground,
        elevation: 0,
        //  automaticallyImplyLeading: true,
        /*leadingWidth: 36,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),*/

        leading: Padding(
          padding: EdgeInsets.only(left: 15, right: 5, top: 10, bottom: 10),
          child: AppBarActionsWidget(
            onTap: () {},
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 15, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                AppBarActionsWidget(
                  onTap: () {},
                  icon: Icon(
                    Icons.notifications,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  width: 9,
                ),
                AppBarActionsWidget(
                  onTap: () {},
                  icon: Icon(
                    Icons.settings,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            SizedBox(
              child: Card(
                child: ListTile(
                  leading: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      //borderRadius: BorderRadius.circular(100),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          "https://countryflagsapi.com/png/turkey",
                        ),
                      ),
                    ),
                  ),
                  title: Text('Türk Lirası'),
                  subtitle: Text('TL'),
                  trailing: Text("234"),
                ),
              ),
            ),
            Bankalar()
          ],
        ),
      ),
      bottomNavigationBar: AnimatedBottomNavigationBar(
          backgroundColor: whiteColor,
          activeColor: Colors.green,
          inactiveColor: inactiveColor,
          height: 68,
          gapLocation: GapLocation.none,
          icons: [
            Icons.home_outlined,
            Icons.change_circle,
            Icons.border_all_rounded,
            Icons.credit_card,
            Icons.person_outline,
          ], //Iconlar.icons,
          iconSize: 40,
          notchSmoothness: NotchSmoothness.defaultEdge,
          leftCornerRadius: 0,
          rightCornerRadius: 0,
          activeIndex: 3, //controller.tabBarIndex.toInt(),
          onTap: (a) {} //controller.changeTabIndex,
          ),
    );
  }
}

class Bankalar extends StatelessWidget {
  const Bankalar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BankaController>(
        init: BankaController(),
        builder: (_) {
          Get.put<BankaController>(_);
          (_).getir();
          return Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              physics: ScrollPhysics(),
              shrinkWrap: true,
              itemCount: (_).banks.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: whiteColor,
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          print((_).banks[index]?.bankName);
                          openBottomSheet(index);
                        },
                        child: ListTile(
                          leading: Icon(Icons.deblur),
                          title: Text(
                            "${(_).banks[index]?.bankName}",
                            style: TextStyle(
                                color: bankaAdiColor,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text("Havale / EFT ile para gönderin.",
                              style: TextStyle(color: bankSubtitleColor)),
                        ),
                      )
                    ],
                  ),
                ); /* Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(1, 5, 0, 1),
                  child: InkWell(
                    onTap: () {
                      print(banks[0]?.bankName);
                    },
                    child: Container(
                      width: double.infinity,
                      height: 72,
                      decoration: BoxDecoration(
                        color: whiteColor,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 3,
                            color: Color(0x20000000),
                            offset: Offset(0, 1),
                          )
                        ],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8, 8, 12, 8),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                'https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=900&q=60',
                                width: 70,
                                height: 70,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Expanded(
                                child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 0, 0, 0),
                                  child: Text(
                                      "${(_).banks[index]?.bankName}"),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 2, 0, 0),
                                  child: Text(
                                      "Havale / EFT ile para gönderin."),
                                ),
                              ],
                            ))
                          ],
                        ),
                      ),
                    ),
                  ),
                );*/
              },
            ),
          );
        });
  }
}

class AppBarActionsWidget extends StatelessWidget {
  AppBarActionsWidget({
    Key? key,
    required this.onTap,
    required this.icon,
  }) : super(key: key);
  final Function() onTap;
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          width: 36,
          height: 36,
          //clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: icon),
    );
  }
}

void openBottomSheet(int index) {
  BankaController bankaController = Get.put(BankaController());
  Get.bottomSheet(
    Padding(
      padding: const EdgeInsets.only(right: 15, left: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
              child: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.maximize,
            ),
            iconSize: 35,
          )),
          TextWidget(name: "Hesap Adı"),
          ListTileWidget(
            text: Text("${bankaController.banks[index]?.bankAccountName}"),
          ),
          SizedBox(
            height: 15,
          ),
          TextWidget(name: "IBAN"),
          ListTileWidget(
            text: Text("${bankaController.banks[index]?.bankIban}"),
          ),
          SizedBox(
            height: 15,
          ),
          TextWidget(name: "Açıklama"),
          ListTileWidget(
            text: Text(
              "${bankaController.banks[index]?.descriptionNo}",
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Expanded(
            child: Card(
              color: bankaBackground,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: ListTile(
                subtitle: Padding(
                    padding:
                        EdgeInsets.only(left: 0, right: 0, top: 8, bottom: 8),
                    child: Text(
                        'Lütfen havale yaparken açıklama alanına yukarıdaki kodu yazmayı unutmayın.')),
              ),
            ),
          ),
          SizedBox(
            height: 9,
          ),
          Expanded(
            child: Card(
              color: uyariColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: ListTile(
                subtitle: Padding(
                    padding:
                        EdgeInsets.only(left: 0, right: 0, top: 8, bottom: 8),
                    child: Text(
                      'Eksik bilgi girilmesi sebebiyle tutarın askıda kalması durumunda, ücret kesintisi yapılacaktır.',
                      style: TextStyle(color: uyariYaziColor),
                    )),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    ),
    backgroundColor: Colors.white,
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );
}

class ListTileWidget extends StatelessWidget {
  ListTileWidget({
    required this.text,
    Key? key,
  }) : super(key: key);

  Widget text;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        color: bankaBackground,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          title: text,
          // subtitle: Text('TL'),
          trailing: Icon(
            Icons.copy,
            color: butonColor,
          ),
        ),
      ),
    );
  }
}
