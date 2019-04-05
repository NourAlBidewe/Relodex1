import 'package:flutter/material.dart';
import './actionButton.dart';
import 'package:url_launcher/url_launcher.dart';

import './crud.dart';
import './serviceProvider.dart';

serviceProvider sv;

class Actions extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Actions();
  }

  Actions(serviceProvider s) {
    sv = s;
  }
}

class _Actions extends State<Actions> {


  void  _launchcaller() async {
    fb.incrementCalls(sv);
    var url = "tel:" + sv.phone;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void hello(){

  }

  @override
  Widget build(BuildContext context) {
    return Container(
        //alignment: ,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 6,
        padding: EdgeInsets.only(right: MediaQuery.of(context).size.width/20),
          child: Row(mainAxisAlignment: MainAxisAlignment.center
              ,
              children: <Widget>[
                ActionButton('btn1', Icons.edit, Colors.black38 ,Colors.white,'عدل', hello), //EDIT PAGE
            ActionButton('btn3', Icons.person, Colors.black38,Colors.white, 'هذا انا',hello),
            ActionButton('btn2', Icons.favorite, Colors.redAccent,Colors.white,'مفضل', hello),

            ActionButton('btn1', Icons.phone, Colors.green ,Colors.white,'اتصل', _launchcaller),

          ]),
        );
  }
}


