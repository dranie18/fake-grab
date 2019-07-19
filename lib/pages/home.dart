import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State createState() {
    return new HomeState();
  }
}

class HomeState extends State<Home> {
  Widget homeIcon(String iconLocation, String title){
    return Column(
      children: <Widget>[
        Image.asset(
          iconLocation,
          width: 40,
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(title),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Container(
            color: Colors.green,
            height: 150,
          ),
          ListView(
            children: <Widget>[
              SizedBox(
                height: 20.0,
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Good Evening, ",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          "Supan Adit Pratama",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "What do you want to today ?",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        offset: Offset(0, 1),
                        blurRadius: 5)
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
                margin: EdgeInsets.only(left: 15.0, right: 15.0),
                padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
                height: 160.0,
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Saldo OVO",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              height: 15.0,
                              alignment: Alignment.topRight,
                              child: Text(
                                "RP",
                                style: TextStyle(
                                  fontSize: 10.0,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 2.0,
                            ),
                            Text(
                              "50.000.000",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Divider(),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        homeIcon("assets/bayar.png", "Bayar"),
                        homeIcon("assets/wallet.png", "Isi Ulang"),
                        homeIcon("assets/crown.png", "Rewards"),
                      ],
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
