import 'package:fake_grab/config/api.dart';
import 'package:fake_grab/model/phone.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:url_launcher/url_launcher.dart';

class Login extends StatefulWidget {
  @override
  State createState() {
    return new LoginState();
  }
}

class LoginState extends State<Login> {
  TextEditingController phoneNumber = TextEditingController();

  bool request = false;
  int requestCount = 0;

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  void auth() {
    if (requestCount < 1) {
      setState(() {
        request = true;
      });
      requestCount += 1;
      api.login(phoneNumber.text).then((phoneNumberResponse) {
        if (phoneNumberResponse.data.length != 0) {
          phoneNumberResponse.data.first
              .saveToSharedPreference()
              .then((sharedPreference) {
            requestCount = 0;
            setState(() {
              request = false;
            });
            _scaffoldKey.currentState.showSnackBar(SnackBar(
              content:
                  Text("Selamat Datang " + phoneNumberResponse.data.first.name),
              duration: Duration(seconds: 1),
            ));
            Navigator.of(context).pushReplacementNamed("/home");
          });
        } else {
          requestCount = 0;
          setState(() {
            request = false;
          });
          _scaffoldKey.currentState.showSnackBar(SnackBar(
            content: Text("Nomor tidak ditemukan"),
            duration: Duration(seconds: 1),
          ));
        }
      }).catchError((error) {
        requestCount = 0;
        setState(() {
          request = false;
        });
        _serverFailed(context);
      });
    }
  }

  _serverFailed(context) {
    Alert(
      context: context,
      type: AlertType.warning,
      title: "Tidak Dapat Terhubung",
      desc: "Gunakan data palsu saja dengan nomor sekarang ?",
      buttons: [
        DialogButton(
          child: Text(
            "Ya",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: _loginFakeData(),
          color: Color.fromRGBO(0, 179, 134, 1.0),
        ),
        DialogButton(
          child: Text(
            "Tidak",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          gradient: LinearGradient(colors: [
            Color.fromRGBO(116, 116, 191, 1.0),
            Color.fromRGBO(52, 138, 199, 1.0)
          ]),
        )
      ],
    ).show();
  }

  _openFacebook() async {
    const url = 'https://www.facebook.com/supanadit';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _openGithub() async {
    const url = 'https://github.com/supanadit';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _openLinkedin() async {
    const url = 'https://www.linkedin.com/in/supan-adit-pratama-403117151/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _loginFakeData() {
    Phone(
      id: 1,
      phoneNumber: phoneNumber.text,
      country: 0,
      name: "User",
      saldo: 0,
    ).saveToSharedPreference().then((sharedPreference) {
      Navigator.of(context).pushReplacementNamed("/home");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Color(0xff019e35),
        body: SafeArea(
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: 50.0,
              ),
              Row(
                children: <Widget>[
                  Image.asset(
                    "assets/grab.jpg",
                    width: 170.0,
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 50.0,
                    ),
                    Text(
                      "Welcome",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 25.0),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      "Enter your phone number",
                      style: TextStyle(color: Colors.white, fontSize: 17.0),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    TextField(
                      controller: phoneNumber,
                      style: TextStyle(color: Colors.white),
                      keyboardType: TextInputType.numberWithOptions(
                          signed: false, decimal: false),
                      decoration: InputDecoration(
                        labelText: "Phone Number",
                        labelStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.white, style: BorderStyle.solid),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.white, style: BorderStyle.solid),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.white, style: BorderStyle.solid),
                        ),
                        focusColor: Colors.white,
                      ),
                    ),
                    FlatButton(
                      child: request
                          ? Container(
                              child: CircularProgressIndicator(
                                valueColor: new AlwaysStoppedAnimation<Color>(
                                  Color(0xff019e35),
                                ),
                              ),
                              height: 25,
                              width: 25,
                            )
                          : Text(
                              "Sign In",
                              style: TextStyle(color: Color(0xff019e35)),
                            ),
                      color: Colors.white,
                      onPressed: auth,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: 65.0,
          color: Colors.white,
          child: Center(
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 20.0,
                ),
                Text(
                  "By Supan Adit Pratama",
                ),
                SizedBox(
                  width: 5.0,
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      IconButton(
                        // Use the FontAwesomeIcons class for the IconData
                        icon: new Icon(FontAwesomeIcons.facebook),
                        onPressed: _openFacebook,
                      ),
                      IconButton(
                        // Use the FontAwesomeIcons class for the IconData
                        icon: new Icon(FontAwesomeIcons.linkedin),
                        onPressed: _openLinkedin,
                      ),
                      IconButton(
                        // Use the FontAwesomeIcons class for the IconData
                        icon: new Icon(FontAwesomeIcons.github),
                        onPressed: _openGithub,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
