import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';

import './ServiceProvider.dart';

ServiceProvider sv;

class DisplayInfo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DisplayInfo();
  }

  DisplayInfo(ServiceProvider s) {
    sv = s;
  }
}

class _DisplayInfo extends State<DisplayInfo> {

 


  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        // height: MediaQuery.of(context).size.height / 5,

        child: Column(children: <Widget>[
          Align(
              alignment: Alignment(0, 0),
              child: Padding(
                padding: EdgeInsets.only(top: 0),
                child: Container(
                 
                  child: new Text(
                    sv.name,
                    textAlign: TextAlign.right,
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 34,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )),
                  Align(
              alignment: Alignment(0, 0),
              child: Container(
               
                child: Text(
                  sv.getProfession(),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )),

  //        List<String> prof_paths = [
  //   "حداد/حداد",
  //   "مصور/مصور",

  //   "حلاق/للرجال",
  //   "حلاق/للنساء",
  //   "قندرجي/قندرجي",
  //   "خياط/خياط",
  //   "طبيب/قلب",
  //   "طبيب/مناعة",
  //   "طبيب/جهاز تنفسي",
  //   "طبيب/أطفال",
  //   "طبيب/صحة عامة",
  //   "طبيب/نسائي",
  //   "طبيب/أسنان",
  //   "طبيب/جلد",
  //   "كهربجي/كهربجي",

  //   "بستاني/بستاني",
  //   "عامل/بناء",
  //   "عامل/فلاح",
  //   "عامل/بلاط",
  //   "عامل/منظف سجاد",
  //   "سمسار/سمسار",
  //   "مهندس ديكور/مهندس ديكور",
  //   "ميكانيكي/ميكانيكي",

  //   "سمكري/سمكري",
  //   "أستاذ/جامعي",
  //   "أستاذ/ثانوي",
  //   "أستاذ/تمهيدي",
  //   "أستاذ/متوسط",
  //   "أستاذ/إبتدائي"
  // ];

  //  List<String> imagess = [
  //   'assets/hadad.jpg',
  //   'assets/photo.jpg',
  //   'assets/barbermen.jpg',
  //   'assets/barberwomen.jpg',
  //   'assets/shoe.jpg',
  //   'assets/tailor.jpg',
  //   'assets/hearty.jpg',
  //   'assets/immune.jpg',
  //   'assets/doctor.jpg',
  //   'assets/doctor.jpg',
  //   'assets/general.jpg',
  //   'assets/women.jpg',
  //   'assets/tooth.jpg',
  //   'assets/skin.jpg',
  //   'assets/kahrbge.jpg',
  //   'assets/bostane.jpg',
  //   'assets/constructor.jpg',
  //   'assets/bostane.jpg',
  //   'assets/dahan.jpg',
  //   'assets/tailor.jpg',
  //   'assets/realEstate.jpg',
  //   'assets/designImage.jpg',

  //   'assets/mech.jpg',
  //   'assets/plumber.jpg',
  //   'assets/uniStudent.jpg',
  //   'assets/highSchool.jpg',
  //   'assets/elementary.jpg',
  //   'assets/midSchool.jpg',
  //   'assets/elementary.jpg',
  // ];


          Container(
            width: MediaQuery.of(context).size.width -
                MediaQuery.of(context).size.width / 8,
            alignment: Alignment.center,
            child: Container(
              child: Text.rich(
                TextSpan(
                  children: <TextSpan>[
                    TextSpan(text: sv.address),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 20, top: 10),
            child:
             new StarRating(
              size: MediaQuery.of(context).size.width / 15,
              rating: sv.average_rating,
              color: Colors.orange,
            ),
          )
        ]));
  }
}
