import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import './ServiceProvider.dart';
import './Doha.dart';


import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import './Categories.dart';
import './designCard.dart';
import './test.dart';
import 'reemApp.dart';


// void main(){

//     var reem = ServiceProvider('راس بيروت', 29, 3.0, [1,5,10], "xx", true, ["hello"], "محمد فواخرجي", 9, '70922772', 6, "blacksmiths/Blacksmiths", GeoPoint(33,33));
//   var rami =  ServiceProvider('حمرا', 29, 3.9, [6,5,9], "xx", true, ["hello"], "علي العلبي", 9, '71089778', 6, "blacksmiths/Blacksmiths", GeoPoint(33,33));
//   var sundus = ServiceProvider('مار الياس', 29, 4.0, [0,1,3], "xx", true, ["hello"], "راما بديوي", 9, '78765234', 6, "blacksmiths/Blacksmiths", GeoPoint(33,33));
//   var nadeem =ServiceProvider('حي السلم', 29, 2.0, [1,2,7], "xx", true, ["hello"], "مازن قانصو", 9, '03123446', 6, "blacksmiths/Blacksmiths", GeoPoint(33,33));
//   List<ServiceProvider> prof = [reem,rami,sundus,nadeem];
//   return runApp(Myapp(prof));
// }

void main() {
  Map<String, List<String>> servicers = {
    "طبيب,assets/doctor.jpg": ["طبيب قلب,assets/heart.jpg", "جهاز هضمي,assets/hadme.jpg",  "طبيب نسائي,assets/women.jpg",  "أخصائي مناعة,assets/immune.jpg",  "أنف أذن حنجرة,assets/nose.jpg",  "طبيب جلد,assets/skin.jpg",  "طبيب أسنان,assets/tooth.jpg",  "طبيب عام,assets/general.jpg",  "طبيب أعصاب,assets/nerve.jpg"],
    "حداد,assets/hadad.jpg": ["حداد,assets/hadad.jpg"],
    "حلاق,assets/hdresser.jpg": ["نسائي,assets/barberwomen.jpg", "رجالي,assets/barbermen.jpg"],
    "كهربائي,assets/doctor.jpg": ["كهربائي,assets/kahrbge.jpg"],
    "بستاني,assets/bostane.jpg": ["بستاني,bostane.jpg"],
    "عمال,assets/constructor.jpg": ["عامل بناء,assets/constructor.jpg","تنظيف سجاد,assets/carpet.png","خياط,assets/tailor.jpg"],
    "ميكانيكي,assets/mechanic.jpg": ["ميكانيكي,assets/mechanic.jpg"],
    //"سباك,assets/san.png": ["سباك"],
    //"مصور,assets/san.png": ["مصور"]
  };

  Map<Categories, List<Categories>> c = buildd(servicers);
  runApp(MyApp(c));
}

  Map<Categories, List<Categories>> buildd(Map<String, List<String>> servicers) {
  Map<Categories, List<Categories>> c = Map();
  for (String key in servicers.keys) {
    Categories v, k = Categories(key.split(",")[0], key.split(",")[1], servicers[key].length > 1);
    for (String subs in servicers[key]) {
      v = Categories(subs.split(",")[0], subs.split(",")[1], false);
      if (c[k] == null)
        c.addAll({k: [v]});
      else
        c[k].add(v);
    }
  }
  return c;
}










//  DO NOT LOSE
//Align(
//          alignment: Alignment(0.85, -0.9),
//        child :  Container(
//           margin: EdgeInsets.only(bottom: 20, top: 15),
//       child: DropdownButton<String>(
//           hint: Text('إظهار حسب'),
//              items: _filters.map((filter){
//                      return DropdownMenuItem(
//                                  value: filter,
//                                  child: Text(filter),
//                      );
//              }).toList(),
//              onChanged: (v) {
//            setState(() {
//                if (v == "التقييم"){
//                    print("رتب حسب التقييم");
//                } else if( v == "المحفظة"){
//                   print("رتب حسب المحافظة");
//                } else {
//                  print("رتب حسب البلدة");
//                }
//            }
//            );
//          }
//          ),
//         ),
//          ),
//          Column(children:
//copy from here to your class
//
//             _products.map((element) => GestureDetector(
//                      onTap: (){
//                      print("clicked");
//                                      } ,
//                  child : Container(
//                                height: 130,
//                                width: 300,
//                                margin: EdgeInsets.only(right: 7, left: 7),
//                                child: Card(child:
//                                       ListView(children: <Widget>[
//                                          Align (alignment: Alignment(0.8,-06),
//                                          child:  Text(element, style: TextStyle(color: Colors.black, fontSize: 20, fontWeight:FontWeight.bold,  ), textDirection: TextDirection.rtl,),),
//                                          Align(alignment: Alignment(0.8,1.0),
//                                              child: Text("بيروت",style: TextStyle(color: Colors.black, fontSize: 15, fontWeight:FontWeight.bold,  ), textDirection: TextDirection.rtl,)),
//                                       Align(alignment : Alignment(0.90, 0.8),
//                                           child : Container(
//                                          height: 80,
//                                            width: 150,
//                                            child : Image.asset('assets/mechanic.jpg')
//
//                                           ),
//                                       ),
//
//                  ],
//                  ),
//                  ))
//              )
//           ).toList(),)
