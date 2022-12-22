
class BankaListeleriData {
/*
{
  "bankName": "T.C. ZİRAAT BANKASI A.Ş.",
  "bankIban": "TR33 0006 1005 1978 6457 8413 26",
  "bankAccountName": "Sanalira",
  "descriptionNo": "SL123456789"
} 
*/

  String? bankName;
  String? bankIban;
  String? bankAccountName;
  String? descriptionNo;

  BankaListeleriData({
    this.bankName,
    this.bankIban,
    this.bankAccountName,
    this.descriptionNo,
  });
  BankaListeleriData.fromJson(Map<String, dynamic> json) {
    bankName = json['bankName']?.toString();
    bankIban = json['bankIban']?.toString();
    bankAccountName = json['bankAccountName']?.toString();
    descriptionNo = json['descriptionNo']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['bankName'] = bankName;
    data['bankIban'] = bankIban;
    data['bankAccountName'] = bankAccountName;
    data['descriptionNo'] = descriptionNo;
    return data;
  }
}

class BankaListeleriResponse {
/*
{
  "code": 200,
  "message": "Success!"
} 
*/

  int? code;
  String? message;

  BankaListeleriResponse({
    this.code,
    this.message,
  });
  BankaListeleriResponse.fromJson(Map<String, dynamic> json) {
    code = json['code']?.toInt();
    message = json['message']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    return data;
  }
}

class BankaListeleri {
/*
{
  "response": {
    "code": 200,
    "message": "Success!"
  },
  "data": [
    {
      "bankName": "T.C. ZİRAAT BANKASI A.Ş.",
      "bankIban": "TR33 0006 1005 1978 6457 8413 26",
      "bankAccountName": "Sanalira",
      "descriptionNo": "SL123456789"
    }
  ]
} 
*/

  BankaListeleriResponse? response;
  List<BankaListeleriData?>? data;

  BankaListeleri({
    this.response,
    this.data,
  });
  BankaListeleri.fromJson(Map<String, dynamic> json) {
    response = (json['response'] != null) ? BankaListeleriResponse.fromJson(json['response']) : null;
  if (json['data'] != null) {
  final v = json['data'];
  final arr0 = <BankaListeleriData>[];
  v.forEach((v) {
  arr0.add(BankaListeleriData.fromJson(v));
  });
    this.data = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (response != null) {
      data['response'] = response!.toJson();
    }
    if (this.data != null) {
      final v = this.data;
      final arr0 = [];
  v!.forEach((v) {
  arr0.add(v!.toJson());
  });
      data['data'] = arr0;
    }
    return data;
  }
}
