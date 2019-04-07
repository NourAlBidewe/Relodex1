import 'package:flutter/material.dart';
import './Servicer.dart';
import 'package:flutter_rating/flutter_rating.dart';
import './displayServiceProvider.dart';
class ServiceDisplay extends StatelessWidget{
   List<Servicer> lst ;

   ServiceDisplay(list){
        this.lst= list;
      }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(children : this.lst?.map((element) =>
        GestureDetector(
            onTap: () {
               Navigator.push(
            context, MaterialPageRoute(builder: (context) => Display(element)));
            },
            child: Container(
                decoration: BoxDecoration(boxShadow: [
                  new BoxShadow(
                    color: Colors.blueGrey,
                    blurRadius: 30.0,
                    spreadRadius: 2.0,
                  ),
                ]),
                margin: EdgeInsets.only(right: 7, left: 7,top: 5),
                child: Card(
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14)
                ),
                  child : Column(children: <Widget>[
                    Align(alignment: Alignment(0.0,0.0),
                       child: Text(element.name, style: TextStyle(
                        color: Colors.black,
                        fontSize: 23,
                        fontWeight: FontWeight.bold,),
                        textDirection: TextDirection.rtl,),),
                    Align(alignment: Alignment(0.0, 0.0),
                        child: Text(element.address, style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,),
                          textDirection: TextDirection.rtl,)),

                    Align(alignment: Alignment(0.0,0.0),
                      child: Container(
                        height: 50,
                        width: 150,
                        child: new StarRating(
                          size: 30,
                          rating :element.average_rating,
                          color: Colors.orange,
                        ),
                      ),
                    ),

                  ],),




                
                )
        )
        ))?.toList()??[]);
  }

}
