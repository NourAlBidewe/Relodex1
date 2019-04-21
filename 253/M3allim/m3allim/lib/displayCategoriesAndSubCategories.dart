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

// class MyApp extends StatelessWidget {
//   String name; //the name is tabeeb
//   List<Categories> listCategories;
//   MyApp(this.listCategories, this.name);

//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//       home: _MyApp(this.listCategories, this.name),
//     );
//   }
// }

// class MyApp extends StatelessWidget{
//    String name; //the name is tabeeb
//   List<Categories> listCategories;
//   MyApp(this.listCategories, this.name);
//   @override
//   Widget build(BuildContext context) {
    
//     return MaterialApp(home: App(listCategories, name),);
//   }

  
// }


class MyApp extends StatefulWidget{
  String name; //the name is tabeeb
  List<Categories> listCategories;
  MyApp(this.listCategories, this.name);

  @override
  State<StatefulWidget> createState() {
     
      return _MyApp(this.listCategories, this.name);  
  
  }    
}


class _MyApp extends State<MyApp>{
  final TextEditingController txtEditor = new TextEditingController();
  User u = new User(20, false, [10, 11], "حسام", "10010551");
  List<Categories> categoriesList;
  String name;
  List<Categories> temp ;
  _MyApp( list1, nm){
    this.categoriesList = list1;
     this.name = nm;
     temp = list1;
      }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 7.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: Container(
                  width: 250,
                  height: 38,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(220, 220, 208, 255),
                    borderRadius: BorderRadius.all(Radius.circular(15.0)
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 0.1),
                child: TextField(
                  controller: txtEditor,
                  onChanged: (newValue){
                  if(newValue != null){
                    temp= [];
                    for(int i = 0; i < categoriesList.length; i++){
                      if(categoriesList[i].name.contains(newValue)){
                        temp.add(categoriesList[i]);
                      }
                    }                 
                    } else{
                      temp = new List<Categories>.from(categoriesList);
                    }
                    setState(() { 
                    });
                    
                  },
                  decoration: InputDecoration(
                    hintText: "ابحث عن الفئة",
                    hintStyle: TextStyle(color: Colors.grey[200]),
                    icon: Icon(Icons.search, color: Colors.white),
                  ),
                ),
              )
               ) ],
          ),
        ),
        // actions: <Widget>[
        //   IconButton(
        //     icon: Icon(Icons.search),
        //     color: Colors.white,
        //     iconSize: 17.0,
        //     onPressed: () {},
        //   ),
        // ],
      ),
      body: GridView.extent(
        //crossAxisCount: 2,
        padding: EdgeInsets.all(8.0),
        crossAxisSpacing: 5.0,
        maxCrossAxisExtent: 300,
        mainAxisSpacing: 5.0,
        children: temp
            ?.map((data) => GestureDetector(
                  child: displayOneCard(data),
                  onTap: () async {
                   // u = User.fromSnapshot(await Firestore.instance.document("Users/961-10010551").get());
                    if (data.sub.length != 0) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  MyApp(data.sub, data.name)));
                    } else {
                      String catName = '';
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
            ?.toList()??[]
      ),
      bottomNavigationBar: bottomNavigator(u),
    );
  }
}
