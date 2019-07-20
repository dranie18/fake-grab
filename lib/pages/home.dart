import 'package:fake_grab/model/phone.dart';
import 'package:fake_grab/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  @override
  State createState() {
    return new HomeState();
  }
}

class HomeState extends State<Home> {
  Phone _phone;

  final _saldo = new NumberFormat("#,###,###", "id");

  @override
  void initState() {
    super.initState();
    _phone = new Phone.fromSharedPreference();
  }

  Widget homeIcon(String iconLocation, String title, GestureTapCallback onTap) {
    return GestureDetector(
      child: Column(
        children: <Widget>[
          Image.asset(
            iconLocation,
            width: 30,
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(title),
        ],
      ),
      onTap: onTap,
    );
  }

  logout() {
    Phone.clearAuth().then((_) {
      Navigator.of(context).pushReplacementNamed("/login");
    });
  }

  Widget customBottomNavigationBar(BuildContext context) {
    double myHeight = 60.0; //Your height HERE
    return Container(
      padding: EdgeInsets.only(top: 5.0),
      decoration: BoxDecoration(
        border: new Border(
            top: BorderSide(
          color: Colors.black.withAlpha(40),
          style: BorderStyle.solid,
          width: 0.4,
        )),
      ),
      height: myHeight,
      child: TabBar(
        tabs: [
          Tab(text: 'Dashboard', icon: Icon(Icons.import_contacts, size: 20.0)),
          Tab(text: 'Aktivitas', icon: Icon(Icons.receipt, size: 20.0)),
          Tab(
              text: 'Pembayaran',
              icon: Icon(Icons.account_balance_wallet, size: 20.0)),
          Tab(text: 'Inbox', icon: Icon(Icons.inbox, size: 20.0)),
          Tab(text: 'Akun', icon: Icon(Icons.account_circle, size: 20.0)),
        ],
        labelPadding: EdgeInsets.only(top: 1.0),
        labelStyle: TextStyle(fontSize: 10.0),
        labelColor: Color(0xff019e35),
        unselectedLabelColor: Colors.black.withAlpha(80),
        indicatorColor: Color(0xff019e35),
      ),
    );
  }

  Widget featureIcon(String assetName, String title) {
    return Container(
      child: Column(
        children: <Widget>[
          Image.asset(
            "assets/" + assetName,
            width: 45.0,
          ),
          SizedBox(
            height: 5.0,
          ),
          Text(
            title,
            style: TextStyle(fontSize: 12.0),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Phone>(
      future: Phone.getPhoneSharedSharedPreference(),
      builder: (BuildContext context, AsyncSnapshot<Phone> snapshot) {
        if (snapshot.data == null) {
          return Login();
        } else {
          _phone = snapshot.data;
          return DefaultTabController(
            length: 5,
            child: Scaffold(
              backgroundColor: Colors.white,
              body: TabBarView(
                children: [
                  Container(
                    color: Colors.white,
                    child: ListView(
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            Container(
                              color: Colors.green,
                              height: 150,
                            ),
                            Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 20.0,
                                ),
                                Container(
                                  child: Column(
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            "Good Evening, ",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          Text(
                                            _phone.name,
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
                                        "What do you want today ?",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0,
                                        ),
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
                                        blurRadius: 5,
                                      )
                                    ],
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5.0)),
                                  ),
                                  margin:
                                      EdgeInsets.only(left: 15.0, right: 15.0),
                                  padding: EdgeInsets.only(
                                    left: 15.0,
                                    right: 15.0,
                                    top: 15.0,
                                  ),
                                  height: 150.0,
                                  child: Column(
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
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
                                                _saldo.format(_phone.saldo),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: <Widget>[
                                          homeIcon("assets/bayar.png", "Bayar",
                                              () {}),
                                          homeIcon("assets/wallet.png",
                                              "Isi Ulang", () => {}),
                                          homeIcon("assets/crown.png",
                                              "Rewards", () => {}),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        GridView.count(
                          shrinkWrap: true,
                          primary: true,
                          padding: EdgeInsets.only(
                            left: 5.0,
                            right: 10.0,
                            top: 20.0,
                          ),
                          crossAxisSpacing: 5.0,
                          crossAxisCount: 4,
                          mainAxisSpacing: 5.0,
                          children: <Widget>[
                            featureIcon("car.png", "Mobil"),
                            featureIcon("scooter.png", "Motor"),
                            featureIcon("food.png", "Makanan"),
                            featureIcon("package.png", "Pengantaran"),
                            featureIcon("save-money.png", "Paket Hemat"),
                            featureIcon("pulsa.png", "Pulsa/Token"),
                            featureIcon("ticket.png", "Ticket"),
                            featureIcon("more.png", "Lainnya"),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          height: 10.0,
                          color: Color(0xffeff1f0),
                        )
                      ],
                    ),
                  ),
                  Container(),
                  Container(),
                  Container(),
                  Container(
                    child: Center(
                      child: FlatButton(
                        child: Text("Logout"),
                        onPressed: logout,
                      ),
                    )
                  ),
                ],
              ),
              bottomNavigationBar: customBottomNavigationBar(context),
            ),
          );
        }
      },
    );
  }
}
