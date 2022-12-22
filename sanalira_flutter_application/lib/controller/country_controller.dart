

import 'package:sanalira_flutter_application/models/country_model.dart';
import 'package:sanalira_flutter_application/utils/api.dart';
import 'package:get/get.dart';
class CountryController extends GetxController {
  //this variable will keep the record of the selected country code
  //countries[0] will be the default selected country in the application
  late Country selectedCountry;

  String get selectedCountryName => selectedCountry.name;

  String get selectedCountryCode => selectedCountry.code;

  String get selectedCountryPhoneCode => selectedCountry.phoneCode;

  String get selectedCountryFlagUrl => (ApiEndPoints.countryFlagApi + selectedCountry.code);

  var phoneCode;

  void degis(value) {
    phoneCode = value;
    print(phoneCode);
    update();
    
  }

  void updateSelectedCountry(Country country) {
    selectedCountry = country;
    update();
  }
}


