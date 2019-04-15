import 'package:flutter/cupertino.dart';
import 'package:m3allim/home.dart';
import './Categories.dart';

import 'displayCategoriesAndSubCategories.dart';

// void addCategorys()

void main() {
  // [
  //   "نجّار/نجّار",
  //   "ميكانيكي/ميكانيكي",
  //   "طبيب/قلب",
  //   "طبيب/جهاز هضمي",
  //   "طبيب/جهاز تنفسي",
  //   "طبيب/أطفال",
  //   "طبيب/صحة عامة",
  //   "طبيب/جراحة عامة",
  //   "طبيب/نسائي",
  //   "طبيب/أسنان",
  //   "طبيب/جلد",
  //   "ديكور/ديكور",
  //   "دهان و نش/دهان و نش",
  //   "سمكري/سمكري",
  //   "سمسار/سمسار",
  //   "كهربجي/كهربجي",
  //   "عامل بناء/عامل بناء",
  //   "فلّاح/فلّاح",
  //   "بلّاط/بلّاط",
  //   "تنظيف سجّاد/تنظيف سجّاد",
  //   "مدرّس/ابتدائي",
  //   "مدرّس/متوسط",
  //   "مدرّس/ثانوي",
  //   "مدرّس/جامعي",
  //   "خيّاط/خيّاط",
  //   "مصبغة/مصبغة",
  //   "كندرجي/كندرجي",
  //   "صالون/نسائي",
  //   "صالون/رجالي",
  //   "مصوّر/مصوّر",
  //   "حدّاد/حدّاد"
  // ];

  List<Categories> subDoctor = new List<Categories>();
  List<String> doctors = [
    "قلب",
    "جهاز هضمي",
    "نسائي",
    "جلد",
    "أسنان",
    "أطفال",
    "صحة عامة"
  ];
  List<String> doctorsImages = [
    'assets/hearty.jpg',
    'assets/hadme.jpg',
    'assets/women.jpg',
    'assets/skin.jpg',
    'assets/tooth.jpg',
    "assets/hearty.jpg",
    "assets/hearty.jpg"
  ];

  for (int i = 0; i < doctors.length; i++) {
    subDoctor.add(new Categories(doctors[i], doctorsImages[i], []));
  }

  // List<Categories> subDecor = new List<Categories>();
  // List<String> decors = ["اثاث", "دهان", "مهندس ديكور"];
  // List<String> decorsImages = [
  //   "assets/furniture.jpg",
  //   "assets/furniture.jpg",
  //   "assets/furniture.jpg",
  // ];

  // for (int i = 0; i < decors.length; i++) {
  //   subDecor.add(new Categories(decors[i], decorsImages[i], []));
  // }

  List<Categories> subTeacher = new List<Categories>();
  List<String> teachers = [
    "إبتدائي",
    "متوسط",
    "ثانوي",
    "جامعي",
  ];
  List<String> teachersImages = [
    'assets/elementary.jpg',
    'assets/midSchool.jpg',
    'assets/highSchool.jpg',
    'assets/uniStudent.jpg',
  ];

  for (int i = 0; i < teachers.length; i++) {
    subTeacher.add(new Categories(teachers[i], teachersImages[i], []));
  }

  List<Categories> halak = [
    new Categories("نسائي", 'assets/barbermen.jpg', []),
    new Categories("رجالي", 'assets/barberwomen.jpg', []),
  ];

  List<Categories> listy = [
    new Categories('طبيب', 'assets/doctor.jpg', subDoctor),
    new Categories('حدّاد', 'assets/hadad.jpg', []),
    new Categories('ميكانيكي', 'assets/mech.jpg', []),
    new Categories('كهربجي', 'assets/kahrbge.jpg', []),
    // new Categories('بستاني', 'assets/bostane.jpg', []),
    new Categories('خيّاط', 'assets/tailor.jpg', []),
        new Categories('بلّاط', 'assets/ballat.jpg', []),
    new Categories('مدرّس', 'assets/tutor.jpg', subTeacher),
    new Categories('ديكور', 'assets/designImage.jpg', []),
    new Categories('دهان ونش', 'assets/dahan.jpg', []),
    new Categories('عامل بناء', 'assets/constructor.jpg', []),
    new Categories('مصوّر', 'assets/photo.jpg', []),
    new Categories('سمسار', 'assets/realEstate.jpg', []),
    new Categories('سمكري', 'assets/plumber.jpg', []),
    new Categories('كندرجي', 'assets/shoe.jpg', []),
    new Categories('صالون', 'assets/hdresser.jpg', halak),
  ];

  runApp(MyApp(listy, ""));

  // runApp(Home());
}

//  import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'dart:convert';
// import 'package:flutter/services.dart';
// import 'dart:async';
// import 'dart:math';
// import 'package:firebase_auth/firebase_auth.dart';

// void main() {
//   runApp(MyApp2());
// }

// void prnt(a) {
//   print(a);
// }

// Future<String> loadUsers() async {
//   return await rootBundle.loadString('assets/Users.txt');
// }

// Future<String> loadServiceProviders() async {
//   return await rootBundle.loadString('assets/ServiceProviders.txt');
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(),
//       home: MyHomePage(title: "my homr page"),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);
//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//   User us;
//   ServiceProvider sv;

//   void _incrementCounter() async {
// //  List<String> lst = (await loadUsers()).split("\n");
// //  for(String s in lst)
// //    await fb.add(User.fromList(s.trim().split("|")));
// //  print("done")

//     if (us == null)
//       us = User.fromSnapshot(
//           await Firestore.instance.document("Users/961-10303283").get());

//     if (sv == null)
//       sv = ServiceProvider.fromSnapshot(
//           await Firestore.instance.document("طبيب/961-00051515151").get());

//     print(
//         (await fb.getnServiceProviders("طبيب", "قلب", 100, "rating", true, us))
//             .length);
// //    ServiceProvider svv = ServiceProvider("beirut, hamra, sidani street", 32, true, GeoPoint(33.4, 35.5), "اسم عربي بدل", "76980760", "حداد/حداد");
// //

// //    print(us.ratings["961-${sv.phone}"]["badge"]);
// //    print(sv.badges);
// //    await fb.incrementServiceProviderBadges(sv, us, 3);
// //    print(us.ratings["961-${sv.phone}"]["badge"]);
// //    print(sv.badges);

// //    print(us.ratings["961-${sv.phone}"]);
// //    print(sv.badges);
// //    fb.incrementServiceProviderBadges(sv, us, 1);
// //    print(us.ratings["961-${sv.phone}"]);
// //    print(sv.badges);

// //    DocumentReference dr = Firestore.instance.document("Users/961-10303283");
// //    dr.addSnapshotListener

//     setState(() {
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'hello there',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.display1,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }

// class User {
//   String name, phone;
//   int age, calls = 0;
//   bool gender;
//   GeoPoint location;
//   Map<dynamic, dynamic> ratings = Map(), favorites = Map();

//   User(this.age, this.gender, this.location, this.name, this.phone);

//   User.fromList(List<String> lst) {
//     age = int.parse(lst[0]);
//     calls = int.parse(lst[1]);
//     favorites = json.decode(lst[2].replaceAll("'", '"'));
//     gender = lst[3] == "True";
//     location = GeoPoint(
//         double.parse(lst[4].split(",")[0]), double.parse(lst[4].split(",")[1]));
//     name = lst[5];
//     phone = lst[6];
//     ratings = json.decode(lst[7].replaceAll("'", '"'));
//   }

//   User.fromSnapshot(DocumentSnapshot snapshot) {
//     if (snapshot["phone"] != null) {
//       age = snapshot["age"];
//       calls = snapshot["calls"];
//       favorites = snapshot["favorites"];
//       gender = snapshot["gender"];
//       location = snapshot["location"];
//       name = snapshot["name"];
//       phone = snapshot["phone"];
//       ratings = snapshot["ratings"];
//     }
//   }

//   toJson() {
//     return {
//       "age": age,
//       "calls": calls,
//       "favorites": favorites,
//       "gender": gender,
//       "location": location,
//       "name": name,
//       "phone": phone,
//       "ratings": ratings
//     };
//   }
// }

// class ServiceProvider {
// //  estimated size on firebase = 3220 bytes, 3.1455 KB
// //  description string size limit 200 characters
// //  images list limit 20 images (links of length 134)
// //  assuming half of providers will pay to have 50 images, a doc can
// //  safely take up to 200 providers.
//   String name, phone, address, email = "", prof_path, description = "";
//   double average_rating = 0, distance = 0;
//   List<int> badges = [0, 0, 0];
//   List<String> images = List();
//   bool gender;
//   int age, number_rates = 0, calls = 0;
//   GeoPoint location;

// //  address as string, location as a function call which returns a GeoPoint object, corresponding to the address
//   ServiceProvider(this.address, this.age, this.gender, this.location, this.name,
//       this.phone, this.prof_path);

//   ServiceProvider.fromList(List<String> lst) {
//     address = lst[0];
//     age = int.parse(lst[1]);
//     average_rating = double.parse(lst[2]);
//     badges = json.decode(lst[3]).cast<int>();
//     calls = int.parse(lst[4]);
//     description = lst[5];
//     email = lst[6];
//     gender = lst[7] == "True";
//     images = lst[8].split(", ");
//     location = GeoPoint(
//         double.parse(lst[9].split(",")[0]), double.parse(lst[9].split(",")[1]));
//     name = lst[10];
//     number_rates = int.parse(lst[11]);
//     phone = lst[12];
//     prof_path = lst[13];
//   }

//   ServiceProvider.fromSnapshot(DocumentSnapshot snapshot) {
//     if (snapshot["phone"] != null) {
//       address = snapshot["address"];
//       age = snapshot["age"];
//       average_rating = snapshot["average_rating"] + 0.0;
//       badges = snapshot["badges"].cast<int>();
//       calls = snapshot["calls"];
//       description = snapshot["description"];
//       email = snapshot["email"];
//       gender = snapshot["gender"];
//       images = snapshot["images"].cast<String>();
//       location = snapshot["location"];
//       name = snapshot["name"];
//       number_rates = snapshot["number_rates"];
//       phone = snapshot["phone"];
//       prof_path = snapshot["prof_path"];
//     }
//   }

//   toJson() {
//     return {
//       "address": address,
//       "age": age,
//       "average_rating": average_rating,
//       "badges": badges,
//       "calls": calls,
//       "description": description,
//       "distance": distance,
//       "email": email,
//       "gender": gender,
//       "images": images,
//       "location": location,
//       "name": name,
//       "number_rates": number_rates,
//       "phone": phone,
//       "prof_path": prof_path
//     };
//   }
// }

// class fb {
// //  p is object (provider or user) to be added to database
//   static add(var p) {
//     String path = (p is User) ? "Users" : p.prof_path.split("/")[0];
//     Firestore.instance.document(path + "/961-${p.phone}").setData(p.toJson());
//   }

//   static addEfficient(ServiceProvider sv) {
//     String path = "${sv.prof_path.split("/")[0]}/961-${sv.phone}";
//     print(path);
//   }

// //  category and subCategory should exactly math the names on firebase
// //  when called, the method where it is called should be async, and put "await" before the call
// //  sorting_criteria is either by "rating" or "distance"
// //  us is which user is requesting the list, helpful now and later
//   static getnServiceProviders(String category, String subCategory, int n,
//       String sorting_criteria, bool descending, User us) async {
//     Query cr = Firestore.instance
//         .collection(category)
//         .where("prof_path", isEqualTo: "$category/$subCategory");
//     QuerySnapshot out = sorting_criteria == "distance"
//         ? await cr.getDocuments()
//         : await cr
//             .orderBy("average_rating", descending: descending)
//             .limit(n)
//             .getDocuments();
//     List<ServiceProvider> lst = new List<ServiceProvider>();
//     for (DocumentSnapshot ds in out.documents)
//       lst.add(ServiceProvider.fromSnapshot(ds));
//     if (sorting_criteria == "distance") {
//       for (ServiceProvider sv in lst) sv.distance = getDistance(sv, us);
//       lst.sort((ServiceProvider a, ServiceProvider b) =>
//           (descending ? -1 : 1) * a.distance.compareTo(b.distance));
//     }
//     lst.sublist(min(lst.length, n));
//     return lst;
//   }

// //  distance is in meters
// //  6371000 is earth's mean radius in meters
//   static getDistance(ServiceProvider sv, User us) {
//     double svLat = sv.location.latitude, svLon = sv.location.longitude;
//     double usLat = us.location.latitude, usLon = us.location.longitude;
//     double latDif = (svLat - usLat), lonDif = (svLon - usLon);
//     double a = pow(sin(latDif * pi / 360), 2) +
//         cos(svLat) * cos(usLat) * pow(sin(lonDif * pi / 360), 2);
//     a = a < 0 ? (-1) * a : a;
//     double c = 2 * atan2(sqrt(a), sqrt(1 - a));
//     return 6371000 * c;
//   }

// //  p is object (provider or user) to be deleted from database
//   static delete(var p) {
//     String path = (p is User)
//         ? "Users/961-${p.phone}"
//         : "${p.prof_path.split("/")[0]}/961-${p.phone}";
//     Firestore.instance.document(path).delete();
//   }

//   static updateServiceProviderStars(
//       ServiceProvider sv, User us, int num_stars) async {
//     String path = "${sv.prof_path.split("/")[0]}/961-${sv.phone}";
//     DocumentReference dr = Firestore.instance.document(path);
//     dr.get().then((out) {
//       sv.number_rates = out["number_rates"] - previous(sv, us, "stars");
//       sv.average_rating =
//           (out["average_rating"] * sv.number_rates + num_stars) /
//               (sv.number_rates + 1);
//       sv.number_rates += 1;
//       dr.updateData({
//         "average_rating": sv.average_rating,
//         "number_rates": sv.number_rates
//       });
//     });
//     path = "Users/961-${us.phone}";
//     DocumentReference dr2 = Firestore.instance.document(path);
//     dr2.get().then((out) {
//       us.ratings = out["ratings"];
//       if (us.ratings["961-${sv.phone}"] != null)
//         us.ratings["961-${sv.phone}"]["stars"] = num_stars;
//       else
//         us.ratings.addAll({
//           "961-${sv.phone}": {"badge": 0, "stars": num_stars}
//         });
//       dr2.updateData({"ratings": us.ratings});
//     });
//   }

//   static previous(ServiceProvider sv, User us, String rate) {
//     if (us.ratings["961-${sv.phone}"] == null)
//       return 0;
//     else
//       return us.ratings["961-${sv.phone}"][rate];
//   }

// //  badge_index 1 or 2 or 3
//   static incrementServiceProviderBadges(
//       ServiceProvider sv, User us, int badge_index) {
//     String path = "${sv.prof_path.split("/")[0]}/961-${sv.phone}";
//     DocumentReference dr = Firestore.instance.document(path);
//     dr.get().then((out) {
//       sv.badges = out["badges"].cast<int>();
//       if (previous(sv, us, "badge") == 1)
//         sv.badges[us.ratings["961-${sv.phone}"]["badge"] - 1] -= 1;
//       sv.badges[badge_index - 1] += 1;
//       dr.updateData({"badges": sv.badges});
//     });
//     path = "Users/961-${us.phone}";
//     DocumentReference dr2 = Firestore.instance.document(path);
//     dr2.get().then((out) {
//       us.ratings = out["ratings"];
//       if (us.ratings["961-${sv.phone}"] != null)
//         us.ratings["961-${sv.phone}"]["badge"] = badge_index;
//       else
//         us.ratings.addAll({
//           "961-${sv.phone}": {"badge": badge_index, "stars": 0}
//         });
//       dr2.updateData({"ratings": us.ratings});
//     });
//     print(">${sv.badges}");
//   }

//   static incrementCalls(var p) {
//     String path = (p is User)
//         ? "Users/961-${p.phone}"
//         : "${p.prof_path.split("/")[0]}/961-${p.phone}";
//     DocumentReference dr = Firestore.instance.document(path);
//     dr.get().then((out) {
//       p.calls = out["calls"];
//       dr.updateData({"calls": ++p.calls});
//     });
//   }

//   static addFavorite(User us, ServiceProvider sv) {
//     String path = "Users/961-${us.phone}";
//     DocumentReference dr = Firestore.instance.document(path);
//     dr.get().then((out) {
//       us.favorites.addAll({"961-${sv.phone}": sv.prof_path});
//       dr.updateData({"favorites": us.favorites});
//     });
//   }

//   static getFavorites(User us) async {
//     String path = "Users/961-${us.phone}";
//     DocumentSnapshot qs = await Firestore.instance.document(path).get();
//     List<ServiceProvider> lst = List();
//     Map<String, List<String>> m = Map();
//     for (String s in qs["favorites"].keys) {
//       if (m[qs["favorites"][s].split("/")[0]] != null)
//         m[qs["favorites"][s].split("/")[0]].add(s);
//       else
//         m.addAll({
//           qs["favorites"][s].split("/")[0]: [s]
//         });
//     }
//     for (String s in m.keys) {
//       for (String num in m[s]) {
//         QuerySnapshot qs = await Firestore.instance
//             .collection(s)
//             .where("phone", isEqualTo: num.split("-")[1])
//             .getDocuments();
//         if (qs.documents.length != 0)
//           lst.add(ServiceProvider.fromSnapshot(qs.documents[0]));
//       }
//     }
//     return lst;
//   }

//   static addImage(ServiceProvider sv, Image img) {}
// }

// class MyApp2 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(),
//       home: SignInPage(),
//     );
//   }
// }

// class SignInPage extends StatefulWidget {
//   @override
//   SignInPageState createState() => SignInPageState();
// }

// User us = User(12, true, GeoPoint(12, 12), "محمود حسن", "+96176661878");

// class SignInPageState extends State<SignInPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFFFFFFFF),
//       body: Center(
//         child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: <Widget>[
//               Image.asset("assets/logo.PNG", height: 180, width: 180),
//               Text(
//                 "أهلاً ${us.name.split(" ")[0]}",
//                 style: TextStyle(color: Colors.black, fontSize: 40),
//               ),
//               Text(
//                 "لتأكيد رقم الهاتف تم إرسال رقم مؤلف من 4 أعداد في رسالة الرجاء كتابته أدناه",
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 22,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//               Text(
//                 message,
//                 style: TextStyle(color: Color(0xFFFF0000)),
//               ),
//               SingleChildScrollView(
//                 child: SizedBox(
//                 width: 120.0,
//                 height: 40.0,
//                 child: TextFormField(
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 30,
//                   ),
//                   //keyboardType: TextInputType.number,
//                   controller: verificationController,
//                   textAlign: TextAlign.center,
//                   decoration: InputDecoration(
//                     hintText: '- - - -',
//                     contentPadding: EdgeInsets.all(5),
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//               ),
//               ),
//               RaisedButton(
//                 color: Color(0xFF0000FF),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: Text(
//                   "تم",
//                   style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                       fontSize: 20.0),
//                 ),
//                 onPressed: verifyPhoneNumber,
//               ),
//             ]),
//       ),
//     );
//   }

//   TextEditingController verificationController = TextEditingController();
//   String message = '';
//   String verificationId;
//   FirebaseAuth auth = FirebaseAuth.instance;

//   void verifyPhoneNumber() async {
//     final PhoneVerificationCompleted verificationCompleted =
//         (FirebaseUser user) {
//       setState(() {
//         message = '';
//       });
//     };

//     final PhoneVerificationFailed verificationFailed =
//         (AuthException authException) {
//       setState(() {
//         message =
//             'خطأ. Code: ${authException.code}. Message: ${authException.message}';
//       });
//     };

//     final PhoneCodeSent codeSent =
//         (String verId, [int forceResendingToken]) async {
//       verificationId = verId;
//     };

//     final PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
//         (String verId) {
//       verificationId = verId;
//     };

//     await auth.verifyPhoneNumber(
//         phoneNumber: us.phone,
//         timeout: const Duration(seconds: 5),
//         verificationCompleted: verificationCompleted,
//         verificationFailed: verificationFailed,
//         codeSent: codeSent,
//         codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
//   }

// // Example code of how to sign in with phone.
//   void _signInWithPhoneNumber() async {
//     final AuthCredential credential = PhoneAuthProvider.getCredential(
//       verificationId: verificationId,
//       smsCode: verificationController.text
//     );
//     final FirebaseUser user = await auth.signInWithCredential(credential);
//     final FirebaseUser currentUser = await auth.currentUser();
//     assert(user.uid == currentUser.uid);
//     setState(() {
//       if (user != null)
//         message = 'Successfully signed in, uid: ' + user.uid;
//       else
//         message = 'Sign in failed';
//     });
//   }
// }
