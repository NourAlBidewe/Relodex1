import 'package:flutter/material.dart';
import './displayCards.dart';
import './Servicer.dart';


class menubutton extends StatefulWidget {
  List<Servicer> lst;
  List<Servicer> fav;
  menubutton(this.lst, this.fav);
  @override
  State<StatefulWidget> createState() {
    return MenuButton(this.lst, this.fav);
  }
}
class MenuButton extends State<menubutton>{
  List<Servicer> lst;
  List<Servicer> fav;
  List<String> _filters = ["المدينة","المسافة","التقييم"];
  bool val2 = false;
  MenuButton(this.lst, this.fav);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
        return
          Container(
            width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/8,
              child : Row(children: <Widget>[

                Padding(
                    padding: EdgeInsets.only(left:  MediaQuery.of(context).size.width/15, right: MediaQuery.of(context).size.width/2),
                    child :Container( child  : Switch(value: this.val2, onChanged: (bool _value){
                      setState(() {
                        if(this.val2 = true){
                          this.val2 = _value;
                          ServiceDisplay(this.lst);
                        }
                        else{
                          this.val2 = _value;
                          print("dont show favorits" + val2.toString());

                        }
                      });
                    }),)
                ),
                Padding(
                  padding: EdgeInsets.only(left:  0),
                  child :  Container(
                    margin: EdgeInsets.only(bottom: 20, top: 15),
                    child: DropdownButton<String>(
                        hint: Text(' تصنيف'),
                        items: _filters.map((filter){
                          return DropdownMenuItem(
                            value: filter,
                            child: Text(filter),
                          );
                        }).toList(),
                        onChanged: (v) {
                          setState(() {
                            if (v == "التقييم"){
                              print("رتب حسب التقييم");

                            } else if( v == "المحفظة"){
                              print("رتب حسب المحافظة");
                            } else {
                              print("رتب حسب البلدة");
                            }
                          }
                          );
                        }
                    ),
                  ),
                ),
              ],)
          );
//          Align(
//      alignment: Alignment(0.85, -0.9),
//      child :  Container(
//        margin: EdgeInsets.only(bottom: 20, top: 15),
//        child: DropdownButton<String>(
//            hint: Text('إظهار حسب'),
//            items: _filters.map((filter){
//              return DropdownMenuItem(
//                value: filter,
//                child: Text(filter),
//              );
//            }).toList(),
//            onChanged: (v) {
//              setState(() {
//                if (v == "التقييم"){
//                  print("رتب حسب التقييم");
//
//                } else if( v == "المحفظة"){
//                  print("رتب حسب المحافظة");
//                } else {
//                  print("رتب حسب البلدة");
//                }
//              }
//              );
//            }
//        ),
//      ),
//    );
  }
  }







