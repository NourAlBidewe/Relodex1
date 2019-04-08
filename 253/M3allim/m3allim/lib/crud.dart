import 'package:cloud_firestore/cloud_firestore.dart';
  
import './User.dart';
import './serviceProvider.dart';
import 'package:flutter/material.dart';



class fb {
//  p is object (provider or user) to be added to database
  static add(var p) {
    String path = (p is User) ? "Users" : "Service Providers/" + p.prof_path;
    Firestore.instance.document(path + "/961-${p.phone}").setData(p.toJson());
  }

//  categoryAndSub is like doctors/Cardiologists
//  should return a list, it returns future
  static getServicers(String categoryAndSub) async {
    QuerySnapshot out = await Firestore.instance
        .collection("Service Providers/" + categoryAndSub)
        .getDocuments();
    List<serviceProvider> lst = new List<serviceProvider>();
    for (DocumentSnapshot ds in out.documents)
      lst.add(serviceProvider.fromSnapshot(ds));
    return lst;
  }

//  p is object (provider or user) to be deleted from database
  static delete(var p) {
    String path = (p is User)
        ? "Users/961-${p.phone}"
        : "Service Providers/${p.prof_path}/961-${p.phone}";
    Firestore.instance.document(path).delete();
  }

  static updateServicerStars(serviceProvider p, double num_stars) {
    double new_num_stars =
        (p.average_rating * p.number_rates + num_stars) / (p.number_rates + 1);
    String path = "Service Providers/${p.prof_path}/961-${p.phone}";
    Firestore.instance.document(path).updateData(
        {"average_rating": new_num_stars, "number_rates": p.number_rates + 1});
    return new_num_stars;
  }

//  badge_index 1 or 2 or 3
  static incrementServicerBadges(serviceProvider p, int badge_index) {
    String path = "Service Providers/${p.prof_path}/961-${p.phone}";
    p.badges[badge_index] += 1;
    Firestore.instance.document(path).updateData({"badges": p.badges});
  }

  static decrementServicerBadges(serviceProvider p, int badge_index) {
    String path = "Service Providers/${p.prof_path}/961-${p.phone}";
    p.badges[badge_index] -= 1;
    Firestore.instance.document(path).updateData({"badges": p.badges});
  }


  static incrementCalls(var p) {
    String path = (p is User)
        ? "Users/961-${p.phone}"
        : "Service Providers/${p.prof_path}/961-${p.phone}";
    Firestore.instance.document(path).updateData({"calls": p.calls + 1});
  }

//  adding a review of a servicer to the user object
  static addReview(User us, serviceProvider sp, int stars, int badge) {
    us.ratings_badges.addAll({"961-${sp.phone}": {"badge": badge, "stars": stars}});
    String path = "Users/961-${us.phone}";
    Firestore.instance.document(path).updateData({"ratings_badges": us.ratings_badges});
  }

  static addImage(serviceProvider p, Image img) {}
}