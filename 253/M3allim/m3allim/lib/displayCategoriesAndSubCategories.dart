import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:m3allim/User.dart';
import 'package:m3allim/bottomNavigator.dart';
import 'package:m3allim/ServiceProvider.dart';

import './displayOneCategoryCard.dart';
import './Categories.dart';

import './crud.dart';
import 'DisplayServiceProvidersList.dart';

// getUser() async {
//   User u = User.fromSnapshot(await Firestore.instance.document("Users/961-33196876").get());
//   return u;
// }

class MyApp extends StatelessWidget {
  String name; //the name is tabeeb
  List<Categories> listCategories;
  MyApp(this.listCategories, this.name);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: _MyApp(listCategories, name));
  }
}

class _MyApp extends StatelessWidget {
  // User u = new User(20, false, [10, 11], "حسام", "10010551");
  User u;

  List<Categories> categoriesList;
  String name;
  _MyApp(this.categoriesList, this.name);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            color: Colors.white,
            iconSize: 17.0,
            onPressed: () {},
          ),
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(8.0),
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 5.0,
        children: categoriesList
            .map((data) => GestureDetector(
                  child: displayOneCard(data),
                  onTap: () async {
                    u = User.fromSnapshot(await Firestore.instance.document("Users/961-10010551").get());
                    if (data.sub.length != 0) {
                      // print('FROM CATEGORY TO SUBCATEGORY');
                      // print('category name: ' + name);
                      // print('subCategory name: ' + data.name);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  MyApp(data.sub, data.name)));
                    } else {
                      String catName = '';
                      //  print('FROM CATEGORY TO LIST');
                      // print('category name: ' + name);
                      // print('subCategory name: ' + data.name);
                      if (name.isEmpty) {
                        name = data.name;
                      }
                      List<ServiceProvider> prof =
                          await fb.getnServiceProviders(
                              name, data.name, 50, 'rating', true, u);
                      catName = name;
                      name = "";
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DisplayServiceProvidersList(
                                  prof, u, catName, data.name)));
                    }
                  },
                ))
            .toList(),
      ),
      bottomNavigationBar: bottomNavigator(u),
    );
  }
}
