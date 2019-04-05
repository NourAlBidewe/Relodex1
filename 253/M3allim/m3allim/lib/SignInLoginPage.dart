import 'package:flutter/material.dart';

import './form_page.dart';
import './blueButton.dart';


String logo = 'assets/logo.png';

class EnterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(padding: EdgeInsets.all(MediaQuery.of(context).size.height/10),
            child:  Image.asset(logo, height: 145, width:145
            ),),

            // ADD THE LOGO IMAGE
            // BRING THE BUTTON DOWN
            Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/8,), child: new BlueBottum("انشاء حساب", FormPage()),)

          ],
        )),
      ),
    );
  }
}
