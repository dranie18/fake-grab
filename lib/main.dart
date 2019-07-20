import 'package:fake_grab/pages/home.dart';
import 'package:fake_grab/pages/login.dart';
/**
 * Aplikasi Fake Grab ( Grab Palsu )
 * Author : Supan Adit Pratama
 * Email : supanadit@gmail.com
 * Date : 10 July 2019
 */
import 'package:flutter/material.dart';

void main() => runApp(FakeGrab());

class FakeGrab extends StatefulWidget {
  @override
  State createState() {
    return new FakeGrabState();
  }
}

class FakeGrabState extends State<FakeGrab> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fake Grab',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
      routes: <String, WidgetBuilder>{
        '/login': (BuildContext context) => new Login(),
        '/home': (BuildContext context) => new Home(),
      },
    );
  }
}
