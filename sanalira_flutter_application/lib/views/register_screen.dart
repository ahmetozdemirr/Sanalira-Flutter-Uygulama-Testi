import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sanalira_flutter_application/constants/colors.dart';
import 'package:sanalira_flutter_application/constants/country_codes.dart';
import 'package:sanalira_flutter_application/constants/text.dart';
import 'package:sanalira_flutter_application/controller/country_controller.dart';
import 'package:sanalira_flutter_application/services/services.dart';
import 'package:sanalira_flutter_application/views/banka_screen.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  TextEditingController adController = TextEditingController();
  TextEditingController soyadController = TextEditingController();
  TextEditingController epostaController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController telefonController =
      MaskedTextController(mask: '0000-000-0000');
  Service service = new Service();

  bool isChecked = false;
  final userdata = GetStorage();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void validateAndSave() {
    final FormState? form = _formKey.currentState;
    if (form!.validate()) {
      print('Form is valid');
    } else {
      print('Form is invalid');
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: screenSize.width,
        height: screenSize.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color1, color2],
            begin: Alignment(-1.0, 1),
            end: Alignment(1.0, 1),
            transform: GradientRotation(3.14 / 4),
          ),
          //color: Colors.amber,
          image: DecorationImage(
            opacity: 0.75,
            colorFilter:
                ColorFilter.mode(Colors.black.withOpacity(0.25), BlendMode.hue),
            image: AssetImage('assets/image/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Container(
              //color: Colors.white, //?? Color(0xFFE7004C),
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.45,
                  width: MediaQuery.of(context).size.width * 0.80,
                  child: Row(
                    children: [
                      Center(
                        child: Image.asset(
                          'assets/image/logo.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                      Text("title",
                          style: Theme.of(context).textTheme.headline6),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                child: ClipRect(
                  child: Container(
                    padding: EdgeInsets.all(15),
                    height: 502,
                    width: screenSize.width,
                    decoration: new BoxDecoration(
                      color: color4.withOpacity(0.75),
                      borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(40.0),
                        topRight: const Radius.circular(40.0),
                      ),
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          SizedBox(
                            height: 28,
                          ),
                          Text(
                            title,
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          TextWidget(name: subtitle),
                          SizedBox(
                            height: 15,
                          ),
                          TextWidget(
                            name: ad,
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          TextFieldWidget(
                            textController: adController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Lütfen isim soyisim girin';
                              }
                              if (value.length < 3 || value.length > 50) {
                                return 'İsim soyisim 3 ile 50 karakter arasında olmalıdır';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          TextWidget(
                            name: "Password",
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          SizedBox(
                            height: 44,
                            child: TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                controller: passwordController,
                                keyboardType: TextInputType.emailAddress,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                                autofocus: false,
                                obscureText: true,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Lütfen şifre girin';
                                  }
                                  if (value.length < 6 || value.length > 20) {
                                    return 'Şifre 6 ile 20 karakter arasında olmalıdır';
                                  }
                                  if (!RegExp(
                                          r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]')
                                      .hasMatch(value)) {
                                    return 'Şifre en az 1 küçük harf, 1 büyük harf, 1 rakam ve 1 özel karakter içermelidir';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide:
                                          BorderSide(color: Color(0xFFAAB5C3))),
                                  filled: true,
                                  /*fillColor: tWhiteColor,
                  focusColor: tWhiteColor,*/
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide:
                                          BorderSide(color: Color(0xFFAAB5C3))),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide:
                                          BorderSide(color: Color(0xFFE7004C))),
                                )),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          TextWidget(
                            name: eposta,
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          TextFieldWidget(
                            textController: epostaController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Lütfen e-posta adresi girin';
                              }
                              if (!EmailValidator.validate(value)) {
                                return 'Lütfen geçerli bir e-posta adresi girin';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextWidget(
                            name: cep,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              GetBuilder<CountryController>(
                                init: CountryController(),
                                builder: (_) {
                                  Get.put(CountryController());
                                  return Container(
                                    //padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                                    width: 110,
                                    height: 44,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        // color: color4,
                                        border: Border.all(
                                            color: Color(0xFFAAB5C3))),
                                    child: DropdownButton(
                                      value: _.phoneCode,
                                      items: countries.map((code) {
                                        return DropdownMenuItem(
                                          child: Row(
                                            children: [
                                              Container(
                                                height: 30,
                                                width: 30,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  //borderRadius: BorderRadius.circular(100),
                                                  image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: NetworkImage(
                                                      "https://countryflagsapi.com/png/${code.name}",
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                code.phoneCode,
                                                style: TextStyle(color: color4),
                                              ),
                                            ],
                                          ),
                                          value: code.code,
                                        );
                                      }).toList(),
                                      onChanged: (newValue) {
                                        _.degis(newValue);
                                        // countryController.phoneCode = newValue;

                                        // phoneCodeController.value = newValue;
                                      },
                                    ),
                                  );
                                },
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: SizedBox(
                                  height: 44,
                                  child: TextFormField(
                                      controller: telefonController,
                                      keyboardType: TextInputType.phone,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                      autofocus: false,
                                      /* validator: (value) {
                        if (value!.isEmpty) {
                          return 'Lütfen telefon numarası girin';
                        }
                        
                        if (!telefonController.isCompleted) {
                          return 'Lütfen geçerli bir telefon numarası girin';
                        }
                        return null;
                      },*/
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                                color: Color(0xFFAAB5C3))),
                                        filled: true,
                                        // fillColor: tWhiteColor,
                                        // focusColor: tWhiteColor,
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                                color: Color(0xFFAAB5C3))),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                                color: Color(0xFFAAB5C3))),
                                      )),
                                ),
                              ),
                            ],
                          ),
                          /*SizedBox(
                            height: 15,
                          ),*/
                          Expanded(
                            child: Row(
                              children: [
                                Container(
                                    width: 19,
                                    height: 19,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6)),
                                    child: Checkbox(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        value: isChecked,
                                        onChanged: (value) {})),
                                SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  width: 300,
                                  child: AutoSizeText(
                                    hesapOnay,
                                    maxLines: 4,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          /* SizedBox(
                            height: 15,
                          ),*/
                          BuildLoginBtn(onPressed: () {
                            /* service.Bankalar();
                            print(
                                "**************************************************");
                            service.getData();*/
                            //  service.getBankInfo();
                            service.fetchBank();
                            if (_formKey.currentState!.validate()) {
                              userdata.write('isLogged', true);
                             
                              Get.offAll(BankaScreen());
                            }
                          }),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TextFieldWidget extends StatelessWidget {
  TextFieldWidget({
    required this.textController,
    this.validator,
    Key? key,
  }) : super(key: key);
  TextEditingController textController = TextEditingController();
  String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: Form(
        child: TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: textController,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.white, fontSize: 15),
            autofocus: false,
            validator: validator,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Color(0xFFAAB5C3))),
              filled: true,
              /*fillColor: tWhiteColor,
                  focusColor: tWhiteColor,*/
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Color(0xFFAAB5C3))),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(color: Color(0xFFE7004C))),
            )),
      ),
    );
  }
}

class TextWidget extends StatelessWidget {
  const TextWidget({
    Key? key,
    required this.name,
  }) : super(key: key);
  final String name;
  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: TextStyle(
        color: textColor,
      ),
    );
  }
}

class BuildLoginBtn extends StatelessWidget {
  const BuildLoginBtn({
    Key? key,
    required this.onPressed,
  }) : super(key: key);
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 47,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: butonColor,

            elevation: 0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            //  side: BorderSide(color: tWhiteColor),
            //padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          ),
          onPressed: onPressed,
          child: Text(
            "Giriş Yap",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
