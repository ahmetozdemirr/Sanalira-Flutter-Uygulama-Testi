import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sanalira_flutter_application/models/banka_model.dart';

class Service {
  final String url = "https://api.sanalira.com/assignment";
/*
  Future<List> Bankalar() async {
    final response =
        await http.get(Uri.parse('https://api.sanalira.com/assignment'));

    //print(data[0]!["bankName"]);

    if (response.statusCode == 200) {
      Map<String, dynamic> map = json.decode(response.body);
      List data = map["data"];
      //final data = json.decode(response.body);

      print(data[0]["bankName"]);
      print(data[1]["bankName"]);
      print(data);
      return data;
    } else {
      throw Exception('Failed to load banks');
    }
  }

  // API'ye GET isteği gönder
  Future<http.Response> getData() async {
    final response =
        await http.get(Uri.parse('https://api.sanalira.com/assignment'));

    print(json.decode(response.body));
    return response;
  }

  Map<String, dynamic> bankInfo = {};

  // API'ye GET isteği gönder ve verileri işle
  Future<Map<String, dynamic>> getBankInfo() async {
    final response =
        await http.get(Uri.parse('https://api.sanalira.com/assignment'));

    bankInfo = jsonDecode(response.body);
    print(bankInfo['data'][0]['bankIban']);
    return bankInfo;
  }

// Servisten veri çekme işlemini yapacak fonksiyon
  /*Future<List<BankaListeleri>> fetchBanks() async {
    final response =
        await http.get(Uri.parse('https://api.sanalira.com/assignment'));

    if (response.statusCode == 200) {
      // Veri çekme işlemi başarılı ise, gelen veriyi parse etme işlemini gerçekleştirin
      return parseBanks(response.body);
    } else {
      // Veri çekme işlemi başarısız ise, bir hata fırlatın
      throw Exception('Failed to load banks');
    }
  }*/

*/
  Future<List<BankaListeleriData?>?> fetchBank() async {
    var res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      var jsonBody = BankaListeleri.fromJson(jsonDecode(res.body));
      print(jsonBody.data);
      
      return jsonBody.data;
    } else {
      print("İstek başarısız oldu =>${res.statusCode}");
    }
  }
}
