import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:m3allim/Person.dart';

class User {
  String name, phone;
  int age, calls = 0;
  bool gender;
  GeoPoint location;
  Map<dynamic, dynamic> ratings, favorites;
  
  User(this.age, this.gender, this.location, this.name, this.phone);
  
  // this is used by the database auto populator
  User.fromList(List<String> lst) {
    age = int.parse(lst[0]);
    calls = int.parse(lst[1]);
    favorites = json.decode(lst[2].replaceAll("'", '"'));
    gender = lst[3] == "True";
    location = GeoPoint(double.parse(lst[4].split(",")[0]), double.parse(lst[4].split(",")[1]));
    name = lst[5];
    phone = lst[6];
    ratings = json.decode(lst[7].replaceAll("'", '"'));
  }

  User.fromSnapshot(DocumentSnapshot snapshot) {
    if (snapshot["phone"] != null) {
      age = snapshot["age"];
      calls = snapshot["calls"];
      favorites = snapshot["favorites"];
      gender = snapshot["gender"];
      location = snapshot["location"];
      name = snapshot["name"];
      phone = snapshot["phone"];
      ratings = snapshot["ratings"];
    }
  }

  toJson() {
    return {
      "age": age,
      "calls": calls,
      "favorites": favorites,
      "gender": gender,
      "location": location,
      "name": name,
      "phone": phone,
      "ratings": ratings
    };
  }
}
