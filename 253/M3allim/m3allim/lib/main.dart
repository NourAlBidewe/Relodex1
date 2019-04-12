import 'package:flutter/cupertino.dart';
import './Categories.dart';

import 'displayCategoriesAndSubCategories.dart';



void main() {
  List<Categories> subDoctor = [new Categories("قلب", 'assets/hearty.jpg', []), 
  new Categories("جهاز هضمي", 'assets/hadme.jpg', []),
  new Categories("نسائي", 'assets/women.jpg', []),
  new Categories("جلد", 'assets/skin.jpg', []),
  new Categories("اسنان", 'assets/tooth.jpg', []),
  new Categories("صحة عامة", 'assets/hearty.jpg', []),
   ];

  List<Categories> subDecor = [new Categories("اثاث", 'assets/furniture.jpg', []),
  new Categories("دهان", 'assets/furniture.jpg', []),
  new Categories("مهندس ديكور", 'assets/furniture.jpg', []),

  ];

  List<Categories> subTeacher = [new Categories("ابتدائي", 'assets/elementary.jpg', []),
  new Categories("تمهيدي", 'assets/elementary.jpg', []),
  new Categories("متوسط", 'assets/midSchool.jpg', []),
  new Categories("ثانوي", 'assets/highSchool.jpg', []),
  new Categories("جامعي", 'assets/uniStudent.jpg', []),
  ];

  List<Categories> halak = [new Categories("للرجال", 'assets/barbermen.jpg', []),
  new Categories("للنساء", 'assets/barberwomen.jpg', []),
  
  ];






  List<Categories> listy = [new Categories('طبيب', 'assets/doctor.jpg', subDoctor),
   new Categories('حداد', 'assets/hadad.jpg', []), 
   new Categories('كهربجي', 'assets/kahrbge.jpg', []),
   new Categories('بستاني', 'assets/bostane.jpg', []),
   new Categories('خياط', 'assets/tailor.jpg', []),
   new Categories('أستاذ', 'assets/tutor.jpg', subTeacher),
   new Categories('ديكور', 'assets/designImage.jpg', subDecor),
   new Categories('سمسار', 'assets/realEstate.jpg', []),
   new Categories('سمكري', 'assets/plumber.jpg', []),
   new Categories('قندرجي', 'assets/shoe.jpg', []),
   new Categories('حلاق', 'assets/hdresser.jpg', halak),
   new Categories('مصور', 'assets/photo.jpg', []),
   new Categories('عامل', 'assets/kahrbge.jpg', []),


   ];
  
  runApp(MyApp(listy,""));
}

 


