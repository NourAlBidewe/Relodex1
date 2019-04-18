import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:m3allim/ServiceProvider.dart';
import 'package:m3allim/User.dart';
import './crud.dart';
import 'package:m3allim/displayServiceProvider.dart';

class diplayFavoritesCard extends StatefulWidget {
  ServiceProvider sv;
  User u;
  diplayFavoritesCard(this.sv, this.u);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _diplayFavoritesCard(sv, u);
  }

  
}

  class _diplayFavoritesCard extends State<diplayFavoritesCard>{

      ServiceProvider sv;
  User u;
  _diplayFavoritesCard(this.sv, this.u);

  //  _onSelected(dynamic val) {
  //   setState(() => _datas.removeWhere((data) => data == val));
  // }

  //    removeFromFavoritesDialog(){
  //       showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return AlertDialog(
  //           title: new Text('هل تريد ازالته من قائمة المفضلين؟'),
  //         actions: <Widget>[
  //           new FlatButton(
  //             child: const Text('نعم'),
  //             onPressed: () {
  //               setState(() {
  //                fb.removeFavorite(u, sv); 
  //               });
  //               Navigator.of(context).pop(true);
  //             },
  //           ),
  //           new FlatButton(
  //             child: const Text('كلا'),
  //             onPressed: () {
  //               Navigator.of(context).pop(true);
  //             },
  //           ),
  //         ],
  //       );
  //           // content: FlatButton(
  //           //    //child: Text("هل تريد ازالة هذا المعلم من قائمة المضلين؟"),
  //           //    child: Text('delete'),
  //           //   onPressed: () {
               
  //           //   },
  //           //   //child: Text("Delete"),
  //           // ),
          
  //       });
  // }


        @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Display(sv, u)));
      },
      child: Card(
          elevation: 10.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10, right: 15),
                child: Column(
                  children: <Widget>[
                    Text(
                      sv.name,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                    Text(
                      sv.getProfession(),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 2.5,
                      child: Text.rich(
                        TextSpan(
                          children: <TextSpan>[
                            TextSpan(text: sv.address),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 150,
                      child: new StarRating(
                        size: 30,
                        rating: sv.average_rating,
                        color: Colors.orange,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: Image.asset(
                  "assets/mech.jpg",
                  alignment: Alignment.centerRight,
                  width: 100.0,
                  // height: 150.0,
                ),
              ),
            ],
          )),
    );
  }

  }



 





