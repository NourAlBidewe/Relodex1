import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class serviceProvider {
  String name, phone, address, email, prof_path;
  double average_rating;
  List<int> badges = new List<int>(3);
  List<String> images;
  bool gender;
  int age, number_rates, calls;
  GeoPoint location;

  serviceProvider(
      this.address,
      this.age,
      this.average_rating,
      this.badges,
      this.email,
      this.gender,
      this.images,
      this.name,
      this.number_rates,
      this.phone,
      this.calls,
      this.prof_path,
      this.location);

  serviceProvider.fromSnapshot(DocumentSnapshot snapshot) {
    name = snapshot["name"];
    phone = snapshot["phone"];
    address = snapshot["address"];
    email = snapshot["email"];
    prof_path = snapshot["path"];
    average_rating = snapshot["average_rating"];
    badges = snapshot["badges"].cast<int>();
    images = snapshot["images"].cast<String>();
    age = snapshot["age"];
    number_rates = snapshot["number_rates"];
    calls = snapshot["calls"];
    gender = snapshot["gender"];
    location = snapshot["location"];
  }

  toJson() {
    return {
      "name": name,
      "phone": phone,
      "address": address,
      "email": email,
      "prof_path": prof_path,
      "average_rating": average_rating,
      "badges": badges,
      "images": images,
      "age": age,
      "number_rates": number_rates,
      "calls": calls,
      "gender": gender,
      "location": location
    };
  }
}