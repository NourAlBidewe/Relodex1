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
    return _Display(u, sv);
  }
}

class _Display extends State<Display> {
  User u;
  ServiceProvider sv;
  _Display(this.u, this.sv);

  var images = [
    'https://firebasestorage.googleapis.com/v0/b/wen-lmaalem.appspot.com/o/Berries.jpg?alt=media&token=6b61b7b2-9375-4b58-bbcd-8116027ff260',
    'https://firebasestorage.googleapis.com/v0/b/wen-lmaalem.appspot.com/o/Cup%20of%20Joe.jpg?alt=media&token=79780731-ff91-4ea3-a0d2-15f8109c7c6f',
    'https://firebasestorage.googleapis.com/v0/b/wen-lmaalem.appspot.com/o/Flowers.jpg?alt=media&token=df388aa2-ead2-4469-9284-d0870b027e3b'
  ];

  Map<String, String> rightImage = Map();

  // List<String> prof_paths = [
  //   "حداد/حداد",
  //   "مصور/استديو",
  //   "مصور/حفلات",
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
  //   "كهربجي/منزلي",
  //   "كهربجي/صناعي",
  //   "كهربجي/آليات",
  //   "بستاني/بستاني",
  //   "عامل/بناء",
  //   "عامل/فلاح",
  //   "عامل/بلاط",
  //   "عامل/منظف سجاد",
  //   "سمسار/سمسار",
  //   "ديكور/دهان",
  //   "ديكور/أثاث",
  //   "ديكور/مهندس ديكور",
  //   "ميكانيكي/سيارات",
  //   "ميكانيكي/صناعي",
  //   "ميكانيكي/آليات",
  //   "ميكانيكي/إختصاصي مرسيدس",
  //   "ميكانيكي/إختصاصي BMW",
  //   "ميكانيكي/إختصاصي رانج روفر",
  //   "سمكري/سمكري",
  //   "أستاذ/جامعي",
  //   "أستاذ/ثانوي",
  //   "أستاذ/تمهيدي",
  //   "أستاذ/متوسط",
  //   "أستاذ/إبتدائي"
  // ];

  List<String> prof_paths = [
    "حدّاد/حدّاد",
    "مصوّر/مصوّر",
    "صالون/رجالي",
    "صالون/نسائي",
    "كندرجي/كندرجي",
    "خيّاط/خيّاط",
    "طبيب/قلب",
    "طبيب/مناعة",
    "طبيب/جهاز تنفسي",
    "طبيب/أطفال",
    "طبيب/صحة عامة",
    "طبيب/نسائي",
    "طبيب/أسنان",
    "طبيب/جلد",
    "كهربجي/كهربجي",
    // "بستاني/بستاني",
    "عامل بناء/عامل بناء",
    "فلّاح/فلّاح",
    "بلّاط/بلّاط",
    "تنظيف سجاد/تنظيف سجاد",
    "سمسار/سمسار",
    "دهان ونش/دهان ونش",
    "ديكور/ديكور",
    "ميكانيكي/ميكانيكي",
    "سمكري/سمكري",
    "مدرّس/جامعي",
    "مدرّس/ثانوي",
    "مدرّس/متوسط",
    "مدرّس/إبتدائي",
    "بلّاط/بلّاط",

  ];

  List<String> imagess = [
    'assets/hadad.jpg',
    'assets/photo.jpg',
    'assets/barbermen.jpg',
    'assets/barberwomen.jpg',
    'assets/shoe.jpg',
    'assets/tailor.jpg',
    'assets/hearty.jpg',
    'assets/immune.jpg',
    'assets/doctor.jpg',
    'assets/doctor.jpg',
    'assets/general.jpg',
    'assets/women.jpg',
    'assets/tooth.jpg',
    'assets/skin.jpg',
    'assets/kahrbge.jpg',
    // 'assets/bostane.jpg',
    'assets/constructor.jpg',
    'assets/bostane.jpg',
    'assets/dahan.jpg',
    'assets/tailor.jpg',
    'assets/realEstate.jpg',
    'assets/dahan.jpg',
    'assets/designImage.jpg',
    'assets/mech.jpg',
    'assets/plumber.jpg',
    'assets/uniStudent.jpg',
    'assets/highSchool.jpg',
    'assets/midSchool.jpg',
    'assets/elementary.jpg',
        'assets/ballat.jpg',

  ];

  void constructMap(List<String> paths, List<String> images) {
    for (var i = 0; i < paths.length; i++) {
      rightImage[paths[i]] = images[i];
    }
  }

  @override
  Widget build(BuildContext context) {
    constructMap(prof_paths, imagess);
    return new MaterialApp(
      home: Scaffold(
          //appBar: AppBar(title: Text('hello'), backgroundColor: Colors.transparent,),
          body: ListView(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3,
                //constraints: BoxConstraints.expand(),
                child: Image.asset(
                  //'assets/mech.jpg',
                  rightImage[sv.prof_path],
                  fit: BoxFit.cover,
                ),
              ),
              DisplayInfo(sv),
              Actions(sv, u),
              UpdateInfo(sv, u),
              CarouselSlider(
                height: 300,
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
            ],
          ),
          bottomNavigationBar: bottomNavigator()),
    );
  }
}
