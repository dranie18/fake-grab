import 'package:shared_preferences/shared_preferences.dart';

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

  Future<SharedPreferences> saveToSharedPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt("id", this.id);
    await prefs.setString("phoneNumber", this.phoneNumber);
    await prefs.setInt("country", this.country);
    await prefs.setString("name", this.name);
    await prefs.setInt("saldo", this.saldo);
    return prefs;
  }

  static Future<Phone> getPhoneSharedSharedPreference() async {
    bool isAuthenticate = await isAuth();
    if (isAuthenticate) {
      return Phone.fromSharedPreference();
    } else {
      return null;
    }
  }

  static clearAuth() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  static Future<bool> isAuth() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int id = prefs.getInt("id");
    String phoneNumber = prefs.getString("phoneNumber");
    int country = prefs.getInt("country");
    String name = prefs.getString("name");
    int saldo = prefs.getInt("saldo");

    bool authenticate = true;
    if (_isEmpty(id)) {
      authenticate = false;
    }
    if (_isEmpty(phoneNumber)) {
      authenticate = false;
    }
    if (_isEmpty(country)) {
      authenticate = false;
    }
    if (_isEmpty(name)) {
      authenticate = false;
    }
    if (_isEmpty(saldo)) {
      authenticate = false;
    }
    return authenticate;
  }

  Phone.fromSharedPreference() {
    SharedPreferences.getInstance().then((prefs) {
      this.id = prefs.getInt("id");
      this.phoneNumber = prefs.getString("phoneNumber");
      this.country = prefs.getInt("country");
      this.name = prefs.getString("name");
      this.saldo = prefs.getInt("saldo");
    });
  }

  bool isEmpty() {
    bool empty = false;
    if (_isEmpty(this.id)) {
      empty = true;
    }
    if (_isEmpty(this.phoneNumber)) {
      empty = true;
    }
    if (_isEmpty(this.country)) {
      empty = true;
    }
    if (_isEmpty(this.name)) {
      empty = true;
    }
    if (_isEmpty(this.saldo)) {
      empty = true;
    }
    return empty;
  }

  static bool _isEmpty(var data) {
    bool isEmpty = true;
    if (data != null) {
      isEmpty = false;
    }
    return isEmpty;
  }
}
