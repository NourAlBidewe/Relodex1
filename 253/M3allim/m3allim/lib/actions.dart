import 'package:flutter/material.dart';
import 'package:m3allim/User.dart';
import './actionButton.dart';
import 'package:url_launcher/url_launcher.dart';

import './crud.dart';
import './ServiceProvider.dart';
import './chooseRightActionButtons.dart';

ServiceProvider sv;
User u;

class Actions extends StatefulWidget {

  ServiceProvider sv;
  User u;

  @override
  State<StatefulWidget> createState() {
    return _Actions(u, sv);
  }

  Actions(this.sv, this.u) {
    
    

  }
}

class _Actions extends State<Actions> {
  
  User u;
  ServiceProvider sv;
  _Actions(this.u, this.sv);


  @override
  Widget build(BuildContext context) {
    return Container(
        //alignment: ,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 6,
        padding: EdgeInsets.only(right: MediaQuery.of(context).size.width/20),
        child: chooseRightActionButtons(sv, u),
          // child: Row(mainAxisAlignment: MainAxisAlignment.center
          //     ,
          //     children: <Widget>[
                
          //       //ActionButton('btn1', Icons.edit, Colors.black38 ,Colors.white,'عدل', hello), //EDIT PAGE
          //   //ActionButton('btn3', Icons.person, Colors.black38,Colors.white, 'هذا انا',hello),
          //   ActionButton('btn2', Icons.favorite, Colors.redAccent,Colors.white,'مفضل', booga),
          //   ActionButton('btn9', Icons.phone, Colors.green ,Colors.white,'اتصل', _launchcaller),

          // ]),
        );
  }
}


