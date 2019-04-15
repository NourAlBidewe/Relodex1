import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class ServiceProvider {
//  estimated size on firebase = 3220 bytes, 3.1455 KB
//  description string size limit 200 characters
//  images list limit 20 images (links of length 134) (or method 2: normal path)
//  assuming half of providers will pay to have 50 images, a doc can
//  safely take up to 200 providers.
  String name, phone, address, email = "", prof_path, description = "";
  double average_rating = 0, distance = 0;
  List<int> badges = [0, 0, 0];
  List<String> images = List();
  bool gender;
  int age, number_rates = 0, calls = 0;
  GeoPoint location;

//  address as string, location as a function call which returns a GeoPoint object, corresponding to the address
  ServiceProvider(this.address, this.age, this.gender, this.location, this.name, this.phone, this.prof_path);

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
  
    String getProfession(){
    var prof = this.prof_path;
    List<String> listy = prof.split("/");
    if(listy[0] == listy[1])
      return listy[0];
    else{
      return listy[0] + " " + listy[1];
    }
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
