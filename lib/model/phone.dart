class ResponsePhone {
  List<Phone> data;
  bool public;

  ResponsePhone({this.data, this.public});

  ResponsePhone.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<Phone>();
      json['data'].forEach((v) {
        data.add(new Phone.fromJson(v));
      });
    }
    public = json['public'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['public'] = this.public;
    return data;
  }
}

class Phone {
  int id;
  String phoneNumber;
  int country;
  String name;
  int saldo;

  Phone({this.id, this.phoneNumber, this.country, this.name, this.saldo});

  Phone.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    phoneNumber = json['phone_number'];
    country = json['country'];
    name = json['name'];
    saldo = json['saldo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['phone_number'] = this.phoneNumber;
    data['country'] = this.country;
    data['name'] = this.name;
    data['saldo'] = this.saldo;
    return data;
  }
}
