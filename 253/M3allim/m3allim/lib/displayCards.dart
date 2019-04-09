import 'package:flutter/material.dart';
import 'package:m3allim/User.dart';
import './ServiceProvider.dart';
import 'package:flutter_rating/flutter_rating.dart';
import './displayServiceProvider.dart';

class ServiceDisplay extends StatelessWidget {
  List<ServiceProvider> lst;
  User u;

  ServiceDisplay(list, u) {
    this.lst = list;
    this.u = u;
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
        children: this
                .lst
                ?.map((element) => GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Display(element, u)));
                    },
                    child: Container(
                        
                        margin: EdgeInsets.only(right: 7, left: 7, top: 5),
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
                                        element.name,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textDirection: TextDirection.rtl,
                                      ),
                                      Text(
                                        element.address,
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textDirection: TextDirection.rtl,
                                      ),
                                      Container(
                                        height: 50,
                                        width: 150,
                                        child: new StarRating(
                                          size: 30,
                                          rating: element.average_rating,
                                          color: Colors.orange,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 10),
                                  child: 
                                  Image.asset(
                                    "assets/mech.jpg",
                                    alignment: Alignment.centerRight,
                                    width: 100.0,
                                    // height: 150.0,
                                  ),
                                ),
                              ],
                            )
                            /*
                          shape: RoundedRectangleBorder(
                            
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: <Widget>[
                              Align(
                                alignment: Alignment(0.0, 0.0),
                                child: Text(
                                  element.name,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textDirection: TextDirection.rtl,
                                ),
                              ),
                              Align(
                                  alignment: Alignment(0.0, 0.0),
                                  child: Text(
                                    element.address,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textDirection: TextDirection.rtl,
                                  )),
                              Align(
                                alignment: Alignment(0.0, 0.0),
                                child: Container(
                                  height: 50,
                                  width: 150,
                                  child: new StarRating(
                                    size: 30,
                                    rating: element.average_rating,
                                    color: Colors.orange,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          */
                            ))))
                ?.toList() ??
            []);
  }
}
