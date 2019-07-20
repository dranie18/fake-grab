import 'dart:convert';

import 'package:fake_grab/model/phone.dart';
import 'package:http/http.dart' as http;
class Api {
  final String _url;

  Api(this._url);

  Future<ResponsePhone> login(String phoneNumber) async {
    final response =
        await http.get(_url + "phone?filter[phone_number][eq]=$phoneNumber");

    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON.
      return ResponsePhone.fromJson(json.decode(response.body));
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }
}

Api apiHomestead = new Api("http://fakegrab.com/_/items/");
Api apiNgrok = new Api("http://5fedb0b2.ngrok.io/_/items/");

// Change Below
Api api = apiNgrok;
