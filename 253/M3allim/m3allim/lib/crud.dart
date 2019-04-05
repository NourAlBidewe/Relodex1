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
//  when called, the method where it is called should be async, and put "await" before the call
  static getServicers(String categoryAndSub) async {
    QuerySnapshot out = await Firestore.instance
        .collection("Service Providers/" + categoryAndSub)
        .getDocuments();
    List<Servicer> lst = new List<Servicer>();
    for (DocumentSnapshot ds in out.documents)
      lst.add(Servicer.fromSnapshot(ds));
    return lst;
  }

//  p is object (provider or user) to be deleted from database
  static delete(var p) {
    String path = (p is User)
        ? "Users/961-${p.phone}"
        : "Service Providers/${p.prof_path}/961-${p.phone}";
    Firestore.instance.document(path).delete();
  }

  static updateServicerStars(Servicer sv, User us, int num_stars) {
    String path = "Service Providers/${sv.prof_path}/961-${sv.phone}";
    DocumentReference dr = Firestore.instance.document(path);
    dr.get().then((out) {
      sv.number_rates = out["number_rates"];
      sv.average_rating =
          (out["average_rating"] * sv.number_rates + num_stars) /
              (sv.number_rates+1);
      sv.number_rates += 1;
      dr.updateData({
        "average_rating": sv.average_rating,
        "number_rates": sv.number_rates
      });
    });
    path = "Users/961-${us.phone}";
    DocumentReference dr2 = Firestore.instance.document(path);
    dr2.get().then((out) {
      us.ratings = out["ratings"];
      if (us.ratings[sv.phone] != null)
        us.ratings[sv.phone]["stars"] = num_stars;
      else
        us.ratings.addAll({sv.phone: {"badge": 0, "stars": num_stars}});
      dr2.updateData({"ratings": us.ratings});
    });
  }

//  badge_index 1 or 2 or 3
  static incrementServicerBadges(Servicer sv, User us, int badge_index) {
    String path = "Service Providers/${sv.prof_path}/961-${sv.phone}";
    sv.badges[badge_index - 1] += 1;
    DocumentReference dr = Firestore.instance.document(path);
    dr.get().then((out) {
      List<int> badges = out["badges"].cast<int>();
      badges[badge_index - 1]++;
      dr.updateData({"badges": badges});
    });
    path = "Users/961-${us.phone}";
    DocumentReference dr2 = Firestore.instance.document(path);
    dr2.get().then((out) {
      us.ratings = out["ratings"];
      if (us.ratings[sv.phone] != null)
        us.ratings[sv.phone]["badge"] = badge_index;
      else
        us.ratings.addAll({sv.phone: {"badge": badge_index, "stars": 0}});
      dr2.updateData({"ratings": us.ratings});
    });
  }

  static incrementCalls(var p) {
    String path = (p is User)
        ? "Users/961-${p.phone}"
        : "Service Providers/${p.prof_path}/961-${p.phone}";
    DocumentReference dr = Firestore.instance.document(path);
    dr.get().then((out) {
      p.calls = out["calls"];
      dr.updateData({"calls": ++p.calls});
    });
  }

  static addFavorite(User us, Servicer sv) {
    String path = "Users/961-${us.phone}";
    DocumentReference dr = Firestore.instance.document(path);
    dr.get().then((out) {
      us.favorites.addAll({"961-${sv.phone}": sv.prof_path});
      dr.updateData({"favorites": us.favorites});
    });
  }

  static addImage(Servicer sv, Image img) {}
}
