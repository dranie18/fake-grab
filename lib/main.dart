import 'package:fake_grab/pages/login.dart';
/**
 * Aplikasi Fake Grab ( Grab Palsu )
 * Author : Supan Adit Pratama
 * Email : supanadit@gmail.com
 * Date : 10 July 2019
 */
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fake Grab',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Login(),
    );
  }
}