import 'package:flutter/material.dart';
import 'package:m3allim/actionButton.dart';
import 'package:m3allim/displayCards.dart';
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

// fb.getnServiceProviders('حداد', 'حداد', 3, 'distance', true, u),
  Future<void> _neverSatisfied() async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Rewind and remember'),
        content: SingleChildScrollView(
          child: Column(
            children: <Widget>[
               // List<ServiceProvider> l = fb.getnServiceProviders('حداد', 'حداد', 3, 'distance', true, u),
                //ServiceDisplay(listy,u),
                //child: fb.getnServiceProviders('حداد', 'حداد', 3, 'distance', true, u),
              
            ],
          )
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Regret'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

  void hello() {}

  void booga() {
    fb.addFavorite(u, sv);
    print("HELLOOO");
    print(u.favorites);
  }

  @override
  Widget build(BuildContext context) {
    if (sv.phone == u.phone) {
      print("HELLOOOO");
      return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ActionButton('btn1', Icons.edit, Colors.black38, Colors.white,
                'عدل', hello), //EDIT PAGE
            ActionButton('btn3', Icons.remove_red_eye, Colors.black38,
                Colors.white, 'اعمال اخرى له', hello),
            ActionButton('btn2', Icons.favorite, Colors.redAccent, Colors.white,
                'مفضل', booga),
            ActionButton('btn9', Icons.phone, Colors.green, Colors.white,
                'اتصل', _launchcaller),
          ]);
    } else {
      print(sv.phone);
      print(u.phone);
      return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ActionButton('btn3', Icons.remove_red_eye, Colors.black38,
                Colors.white, 'انظر ايضا', _neverSatisfied),
            ActionButton('btn2', Icons.favorite, Colors.redAccent, Colors.white,
                'مفضل', booga),
            ActionButton('btn9', Icons.phone, Colors.green, Colors.white,
                'اتصل', _launchcaller),
          ]);
    }
  }
}
