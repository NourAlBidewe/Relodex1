import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:m3allim/actionButton.dart';
import 'package:m3allim/displayCards.dart';
import 'package:m3allim/providerJobsCard.dart';
import 'package:url_launcher/url_launcher.dart';

import './Categories.dart';
import './ServiceProvider.dart';
import './User.dart';
import './crud.dart';

class chooseRightActionButtons extends StatefulWidget {
  ServiceProvider sv;
  User u;
  

  chooseRightActionButtons(this.sv, this.u);

  @override
  State<StatefulWidget> createState() {
    return _chooseRightActionButtons(sv, u);
  }
}

class _chooseRightActionButtons extends State<chooseRightActionButtons> {
  ServiceProvider sv;
  User u;
  bool changeBoarder = false;
   
  //static User us = new User(27, true, GeoPoint(33, 11), 'hello', 'x');

  _chooseRightActionButtons(this.sv, this.u);

  void _launchcaller() async {
    fb.incrementCalls(sv);
    var url = "tel:" + sv.phone;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  displayOtherJobsByServiceProvider() async {
    List<ServiceProvider> listy =
        await fb.getnServiceProviders('سمكري', 'سمكري', 5, 'distance', false, u);
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          int counter = 0;
          StreamController<String> controller =
              StreamController<String>.broadcast();
          return AlertDialog(
            title: Center(
              child: Column(
                children: <Widget>[
                  Text(
                    'اعمال اخرى ل',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    sv.name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            content: Container(
              width: MediaQuery.of(context).size.height / 2,
              height: MediaQuery.of(context).size.height / 2,
              child: ListView.builder(
                itemCount: listy.length,
                itemBuilder: (context, int) {
                  return providerJobsCard(listy[int], u);
                },
              ),
            ),
          );
        });
  }

  void hello() {}

  void addFavorite() {
    fb.addFavorite(u, sv);
    setState(() {
      changeBoarder = true;
      final snackBar = SnackBar(
        content: Text('تمت الاضافة الى قائمة المفضلين',textDirection: TextDirection.rtl, ),
      );
      Scaffold.of(context).showSnackBar(snackBar);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (sv.phone == u.phone) {
      print("HELLOOOO");
      return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ActionButton('btn1', Icons.edit, Colors.black38, Colors.white,
                'عدل', hello,false), //EDIT PAGE
            ActionButton(
                'btn3',
                Icons.remove_red_eye,
                Colors.black38,
                Colors.white,
                'اعمال اخرى',
                displayOtherJobsByServiceProvider,false),
            ActionButton('btn2', Icons.favorite, Colors.redAccent, Colors.white,
                'مفضل', addFavorite, changeBoarder),
            ActionButton('btn9', Icons.phone, Colors.green, Colors.white,
                'اتصل', _launchcaller,false),
          ]);
    } else {
      // print(prof_paths.length);
      // print(imagess.length);
      print(sv.phone);
      print(u.phone);
      return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ActionButton('btn10', Icons.work, Colors.black38,
                Colors.white, 'اعمال اخرى', displayOtherJobsByServiceProvider,false),
            ActionButton('btn2', Icons.favorite, Colors.redAccent, Colors.white,
                'مفضل', addFavorite,changeBoarder),
            ActionButton('btn9', Icons.phone, Colors.green, Colors.white,
                'اتصل', _launchcaller,false),
          ]);
    }
  }
}
