import 'package:flutter/material.dart';
import 'package:m3allim/ServiceProvider.dart';
import 'package:m3allim/User.dart';
import './crud.dart';
import 'badge.dart';

class displayBadges extends StatefulWidget{

  User u;
  ServiceProvider sv;
  // String path;

  displayBadges(this.u, this.sv);

  @override
  State<StatefulWidget> createState() {

    return _displayBadges(u, sv);
  }

  
}

class _displayBadges extends State<displayBadges> {

  User u;
  // String path;
  ServiceProvider sv;

  _displayBadges(this.u, this.sv);

  String DiamondPath = 'assets/dnew.png';
String crownPath = 'assets/cnew.png';
String handsPath = 'assets/hnew.png';

String DiamondYellowPath = 'assets/dnewYellow.png';
String crownYellowPath = 'assets/cnewYellow.png';
String handsYellowPath = 'assets/hnewYellow.png';


  String pathD = 'assets/dnew.png';
String pathC = 'assets/cnew.png';
String pathH = 'assets/hnew.png';


  changeImage(){

    int badge = fb.previous(sv, u, 'badge');
    print(badge);
    if(badge==-1){

    }
    if(badge==1){
      pathD = DiamondPath;
    }

    if(badge==2){
      print('hellooooo');
      pathC = crownPath;
    }

    if(badge==3){
      pathH = handsPath;
    }


  }


  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 4,
        child: Row(
          //scrollDirection: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(child: FlatButton(
              //materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              onPressed: (){
                setState(() {
                  // changeImage();
                  // pathD = DiamondYellowPath;
              fb.incrementServiceProviderBadges(sv, u, 1);
  
                  
                });
              },
              child: Badge(pathD, sv, 1, DiamondYellowPath, 'btn5',
                  'شي فاخر عالاخر', u),
            ),),

            Container(child: FlatButton(
              //materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              onPressed: () {
                
                setState(() {
                  // changeImage();
                  pathC = crownYellowPath;
                  fb.incrementServiceProviderBadges(sv, u, 2);
                  // print(pathC);
                  
                  // changeImage();                  
                });
              },
              child: Badge(
                  pathC, sv, 2, crownYellowPath, 'btn6', 'احلى معلم', u),
            ),),
           FlatButton(
            // materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              onPressed: () {
                setState(() {
                  // changeImage();
                  pathH = handsYellowPath;
                  print(pathH);
                  fb.incrementServiceProviderBadges(sv, u, 3);
                  
                                    
                });
              },
              child: Badge(
                  pathH, sv, 3, handsYellowPath, 'btn7', 'يسلّمون', u),
            ),
          ],
        ),
      );
  }


  
}
