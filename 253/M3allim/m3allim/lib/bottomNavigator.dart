import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:m3allim/ServiceProvider.dart';
import 'package:m3allim/User.dart';
import 'package:m3allim/displayFavorites.dart';
import 'crud.dart';
import 'addServiceProvider.dart';

// import 'x.dart';
// import './reemApp.dart';
class bottomNavigator extends StatefulWidget {
  User u;

  bottomNavigator(this.u);
  @override
  State<StatefulWidget> createState() {
    return _bottomNavigator(u);
  }
}

class _bottomNavigator extends State<bottomNavigator> {
  User u;

  _bottomNavigator(this.u);

  int indexy = 0;

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      color: Colors.white,
      //  initialIndex: 0,
      animationDuration: Duration(milliseconds: 150),
      backgroundColor: Colors.deepPurpleAccent,
      items: <Widget>[
        Icon(
          Icons.home,
          size: 30,
          color: Colors.deepPurpleAccent,
        ),
        Icon(Icons.add, size: 30, color: Colors.deepPurpleAccent),
        Icon(Icons.favorite, size: 30, color: Colors.deepPurpleAccent),
      ],
      onTap: (index) async {
        u = User.fromSnapshot(await Firestore.instance.document("Users/961-10010551").get());
         
        // setState(()  {
         
          if (index == 1) {
            
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MyApp(u)));
          }
          if (index == 2) {
              List<ServiceProvider> listOfFavorites = await fb.getFavorites(u);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        displayFavorites(listOfFavorites, u)));
          }
        // });
      },
    );
  }
}
