import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:m3allim/User.dart';

import './ServiceProvider.dart';
import './displayInfo.dart';
import './actions.dart';
import './updateInfo.dart';
import './bottomNavigator.dart';




//GIVE RATY TO FIREBASE
class Display extends StatefulWidget {
  ServiceProvider sv;
  User u;

  Display(ServiceProvider serP, u) {
    sv = serP;
    this.u = u;
  }

  @override
  State<StatefulWidget> createState() {
    return _Display(u,sv);
  }

  
}

class _Display extends State<Display> {
 
  User u;
  ServiceProvider sv;
  _Display(this.u, this.sv);
  
 
  var images = ['https://firebasestorage.googleapis.com/v0/b/wen-lmaalem.appspot.com/o/Berries.jpg?alt=media&token=6b61b7b2-9375-4b58-bbcd-8116027ff260',
  'https://firebasestorage.googleapis.com/v0/b/wen-lmaalem.appspot.com/o/Cup%20of%20Joe.jpg?alt=media&token=79780731-ff91-4ea3-a0d2-15f8109c7c6f'
  , 'https://firebasestorage.googleapis.com/v0/b/wen-lmaalem.appspot.com/o/Flowers.jpg?alt=media&token=df388aa2-ead2-4469-9284-d0870b027e3b'];




  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: Scaffold(
        
        body: ListView(children: <Widget>[

          Image.asset('assets/mech.jpg'),
          DisplayInfo(sv),
          Actions(sv,u),
          UpdateInfo(sv, u),
          CarouselSlider(
            height: 300,
            //autoPlayInterval: Duration(seconds: 2),
           //autoPlay: true,
            items: images.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    padding: EdgeInsets.only(top: 30, bottom: 30),
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),

                      child: Image.network(i),
                  );
                },
              );
            }).toList(),
          )
        ],),
         bottomNavigationBar: bottomNavigator()
      ),
    );
  }
}
