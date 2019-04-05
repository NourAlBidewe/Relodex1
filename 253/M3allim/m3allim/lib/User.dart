import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:m3allim/Person.dart';

class User {
  String name, phone;
  int age, calls;
  bool gender;
  GeoPoint location;

//  Map<String, List<int>>
  Map<dynamic, dynamic> ratings_badges;
  List<Map<dynamic, dynamic>> favorites;

  User(this.age, this.gender, this.location, this.name, this.phone,
      this.ratings_badges, this.calls, this.favorites);

  User.fromSnapshot(DocumentSnapshot snapshot) {
    name = snapshot["name"];
    phone = snapshot["phone"];
    age = snapshot["age"];
    calls = snapshot["calls"];
    gender = snapshot["gender"];
    location = snapshot["location"];
    ratings_badges = snapshot["ratings_badges"];
    favorites = snapshot["favorites"];
  }

  toJson() {
    return {
      "name": name,
      "phone": phone,
      "age": age,
      "calls": calls,
      "gender": gender,
      "location": location,
      "ratings_badges": ratings_badges,
      "favorites": favorites
    };
  }
}