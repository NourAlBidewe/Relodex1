import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:convert';


class ServiceProvider {
  String name, phone, address, email, prof_path, description;
  double average_rating = 0, distance = 0;
  List<int> badges = [0, 0, 0];
  List<String> images;
  bool gender;
  int age, number_rates = 0, calls = 0;
  GeoPoint location;

  // fields to be initialized at the moment of creating, the rest are to be filled by the servicer later on
  
  ServiceProvider(
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

  // this is used by the database auto populator
  ServiceProvider.fromList(List<String> lst) {
    address = lst[0];
    age = int.parse(lst[1]);
    average_rating = double.parse(lst[2]);
    badges = json.decode(lst[3]).cast<int>();
    calls = int.parse(lst[4]);
    description = lst[5];
    email = lst[6];
    gender = lst[7] == "True";
    images = lst[8].split(", ");
    location = GeoPoint(double.parse(lst[9].split(",")[0]), double.parse(lst[9].split(",")[1]));
    name = lst[10];
    number_rates = int.parse(lst[11]);
    phone = lst[12];
    prof_path = lst[13];
  }

  ServiceProvider.fromSnapshot(DocumentSnapshot snapshot) {
    if (snapshot["phone"] != null) {
      address = snapshot["address"];
      age = snapshot["age"];
      average_rating = snapshot["average_rating"] + 0.0;
      badges = snapshot["badges"].cast<int>();
      calls = snapshot["calls"];
      description = snapshot["description"];
      email = snapshot["email"];
      gender = snapshot["gender"];
      images = snapshot["images"].cast<String>();
      location = snapshot["location"];
      name = snapshot["name"];
      number_rates = snapshot["number_rates"];
      phone = snapshot["phone"];
      prof_path = snapshot["prof_path"];
    }
  }

  toJson() {
    return {
      "address": address,
      "age": age,
      "average_rating": average_rating,
      "badges": badges,
      "calls": calls,
      "description": description,
      "distance": distance,
      "email": email,
      "gender": gender,
      "images": images,
      "location": location,
      "name": name,
      "number_rates": number_rates,
      "phone": phone,
      "prof_path": prof_path
    };
  }
}
