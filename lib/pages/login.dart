import 'package:fake_grab/config/api.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
        requestCount = 0;
        setState(() {
          request = false;
        });
        if (phoneNumberResponse.data.length != 0) {
          _scaffoldKey.currentState.showSnackBar(SnackBar(
            content:
                Text("Selamat Datang " + phoneNumberResponse.data.first.name),
            duration: Duration(seconds: 3),
          ));
        } else {
          _scaffoldKey.currentState.showSnackBar(SnackBar(
            content: Text("Nomor tidak ditemukan"),
            duration: Duration(seconds: 3),
          ));
        }
      });
    }
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: Scaffold(
          key: _scaffoldKey,
          backgroundColor: Color(0xff019e35),
          body: ListView(
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
      ),
    );
  }
}
