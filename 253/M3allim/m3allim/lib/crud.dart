import 'package:cloud_firestore/cloud_firestore.dart';
  
import './User.dart';
import './serviceProvider.dart';
import 'package:flutter/material.dart';
import 'dart:math';



class fb {

//  p is object (provider or user) to be added to database
  static add(var p) {
    String path = (p is User) ? "Users" : p.prof_path.split("/")[0];
    Firestore.instance.document(path + "/961-${p.phone}").setData(p.toJson());
  }

//  category and subCategory should exactly math the names on firebase
//  when called, the method where it is called should be async, and put "await" before the call
//  sorting_criteria is either by "rating" or "distance"
//  us is which user is requesting the list, helpful now and later
  static getnServiceProviders(String category, String subCategory, int n, String sorting_criteria, bool descending, User us) async {
    CollectionReference cr = Firestore.instance.collection(category).where("prof_path", isEqualTo: "$category/$subCategory");
    QuerySnapshot out = sorting_criteria == "distance"
        ? await cr.limit(n).getDocuments()
        : await cr.orderBy("average_rating", descending: descending).limit(n).getDocuments();
    List<ServiceProvider> lst = new List<ServiceProvider>();
    for (DocumentSnapshot ds in out.documents)
      lst.add(ServiceProvider.fromSnapshot(ds));
    if (sorting_criteria == "distance") {
      for (ServiceProvider sv in lst)
        sv.distance = getDistance(sv, us);
      lst.sort((ServiceProvider a, ServiceProvider b) => a.distance.compareTo(b.distance));
    }
    lst.sublist(min(lst.length, n));
    return lst;
  }

//  distance is in meters
//  6371000 is earth's mean radius in meters
  static getDistance(ServiceProvider sv, User us) {
    double svLat = sv.location.latitude, svLon = sv.location.longitude;
    double usLat = us.location.latitude, usLon = us.location.longitude;
    double latDif = (svLat - usLat), lonDif = (svLon - usLon);
    double a = pow(sin(latDif * pi / 360), 2) +
        cos(svLat) * cos(usLat) * pow(sin(lonDif * pi / 360), 2);
    a = a < 0 ? (-1) * a : a;
    double c = 2 * atan2(sqrt(a), sqrt(1 - a));
    return 6371000 * c;
  }

//  p is object (provider or user) to be deleted from database
  static delete(var p) {
    String path = (p is User)
        ? "Users/961-${p.phone}"
        : "${p.prof_path.split("/")[0]}/961-${p.phone}";
    Firestore.instance.document(path).delete();
  }

  static updateServiceProviderStars(ServiceProvider sv, User us, int num_stars) {
    String path = "${sv.prof_path.split("/")[0]}/961-${sv.phone}";
    DocumentReference dr = Firestore.instance.document(path);
    dr.get().then((out) {
      sv.number_rates = out["number_rates"];
      sv.average_rating =
          (out["average_rating"] * sv.number_rates + num_stars) /
              (sv.number_rates + 1);
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
        us.ratings.addAll({
          sv.phone: {"badge": 0, "stars": num_stars}
        });
      dr2.updateData({"ratings": us.ratings});
    });
  }

//  badge_index 1 or 2 or 3
  static incrementServiceProviderBadges(ServiceProvider sv, User us, int badge_index) {
    String path = "${sv.prof_path.split("/")[0]}/961-${sv.phone}";
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
        us.ratings.addAll({
          sv.phone: {"badge": badge_index, "stars": 0}
        });
      dr2.updateData({"ratings": us.ratings});
    });
  }

  static incrementCalls(var p) {
    String path = (p is User)
        ? "Users/961-${p.phone}"
        : "${p.prof_path.split("/")[0]}/961-${p.phone}";
    DocumentReference dr = Firestore.instance.document(path);
    dr.get().then((out) {
      p.calls = out["calls"];
      dr.updateData({"calls": ++p.calls});
    });
  }

  static addFavorite(User us, ServiceProvider sv) {
    String path = "Users/961-${us.phone}";
    DocumentReference dr = Firestore.instance.document(path);
    dr.get().then((out) {
      us.favorites.addAll({"961-${sv.phone}": sv.prof_path});
      dr.updateData({"favorites": us.favorites});
    });
  }

  static getFavorites(User us) async {
    String path = "Users/961-${us.phone}";
    DocumentSnapshot qs = await Firestore.instance.document(path).get();
    List<ServiceProvider> lst = List();
    Map<String, List<String>> m = Map();
    for (String s in qs["favorites"].keys) {
      if (m[qs["favorites"][s].split("/")[0]] != null)
        m[qs["favorites"][s].split("/")[0]].add(s);
      else
        m.addAll({
          qs["favorites"][s].split("/")[0]: [s]
        });
    }
    for (String s in m.keys) {
      for(String num in m[s]) {
        QuerySnapshot qs = await Firestore.instance.collection(s).where(
            "phone", isEqualTo: num.split("-")[1]).getDocuments();
        if (qs.documents.length != 0)
          lst.add(ServiceProvider.fromSnapshot(qs.documents[0]));
      }
    }
    return lst;
  }

  static addImage(ServiceProvider sv, Image img) {}
}
