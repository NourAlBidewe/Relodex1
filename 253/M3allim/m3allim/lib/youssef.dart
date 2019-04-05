import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:geolocator/geolocator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import './bottomNavigator.dart';

void main() => runApp(MyApp());

List<String> fields = [
  "name",
  "phone",
  "address",
  "email",
  "prof_path",
  "description",
  "age"
];

class Servicer {
  String name, phone, address, email, prof_path, description;
  double average_rating;
  List<int> badges = new List<int>(3);
  List<String> images;
  bool gender;
  int age, number_rates, calls;
  Position location;

  Servicer(
      this.address,
      this.age,
      this.average_rating,
      this.badges,
      this.calls,
      this.description,
      this.email,
      this.gender,
      this.images,
      this.location,
      this.name,
      this.number_rates,
      this.phone,
      this.prof_path);
  toJson() {
    return {
      "address": address,
      "age": age,
      "average_rating": average_rating,
      "badges": badges,
      "calls": calls,
      "description": description,
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

var images = [
  'https://firebasestorage.googleapis.com/v0/b/wen-lmaalem.appspot.com/o/Berries.jpg?alt=media&token=6b61b7b2-9375-4b58-bbcd-8116027ff260',
  'https://firebasestorage.googleapis.com/v0/b/wen-lmaalem.appspot.com/o/Cup%20of%20Joe.jpg?alt=media&token=79780731-ff91-4ea3-a0d2-15f8109c7c6f',
  'https://firebasestorage.googleapis.com/v0/b/wen-lmaalem.appspot.com/o/Flowers.jpg?alt=media&token=df388aa2-ead2-4469-9284-d0870b027e3b'
];

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File _imageFile;
  static const menuItems = <String>["نجار", "طبيب", "سمكري"];
  static const genterTypes = <String>["انثى", "ذكر"];
  String _selectedMenuValue;
  String _selectedGenderValue;
  Position position;
  var x = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final descriptionController = TextEditingController();
  final genderController = TextEditingController();

  Map<String, double> userLocation;

  final List<DropdownMenuItem<String>> _dropMenuItems = menuItems
      .map(
        (String value) =>
        DropdownMenuItem<String>(value: value, child: Text(value)),
  )
      .toList();

  final List<DropdownMenuItem<String>> _dropGenderItems = genterTypes
      .map(
        (String value) =>
        DropdownMenuItem<String>(value: value, child: Text(value)),
  )
      .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          'UPLOAD',
          style: TextStyle(
              fontFamily: 'Montserrat', fontSize: 15.0, color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          iconSize: 17.0,
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            color: Colors.black,
            iconSize: 17.0,
            onPressed: () {},
          ),
        ],
      ),
      body: new SingleChildScrollView(
        child: Column(
          children: <Widget>[
            CarouselSlider(
              height: 200,
              //autoPlayInterval: Duration(seconds: 2),
              //autoPlay: true,
              items: images.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      padding: EdgeInsets.only(top: 30, bottom: 30),
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      child: Image.network(i),
                    );
                  },
                );
              }).toList(),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                controller: nameController,
                textDirection: TextDirection.rtl,
                autocorrect: false,
                autofocus: true,
                // textInputAction: ,
                textAlign: TextAlign.right,
                keyboardType: TextInputType.text,

                decoration: new InputDecoration(
                  border: OutlineInputBorder(),
                  fillColor: Colors.white,
                  filled: true,
                  labelText: "الاسم الكامل",
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                controller: phoneController,
                textDirection: TextDirection.rtl,
                autocorrect: false,
                autofocus: true,
                // textInputAction: ,
                textAlign: TextAlign.right,
                keyboardType: TextInputType.number,

                decoration: new InputDecoration(
                  border: OutlineInputBorder(),
                  fillColor: Colors.white,
                  filled: true,
                  labelText: "رقم الهاتف",
                  prefixText: '961-',
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                controller: emailController,
                textDirection: TextDirection.rtl,
                autocorrect: false,
                autofocus: true,
                // textInputAction: ,
                textAlign: TextAlign.right,
                keyboardType: TextInputType.emailAddress,

                decoration: new InputDecoration(
                  border: OutlineInputBorder(),
                  fillColor: Colors.white,
                  filled: true,
                  labelText: "البريد الالكتروني",
                ),
              ),
            ),


            ListTile(
              trailing: DropdownButton(
                value: _selectedMenuValue,
                hint: Text(" المهنة"),
                onChanged: (String newValue) {
                  setState(() {
                    _selectedMenuValue = newValue;
                  });
                },
                items: _dropMenuItems,
              ),
            ),

            ListTile(
              trailing: DropdownButton(
                value: _selectedGenderValue,
                hint: Text(" الجنس"),
                onChanged: (String newValue) {
                  setState(() {
                    _selectedGenderValue = newValue;
                  });
                },
                items: _dropGenderItems,
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Align(alignment: Alignment.bottomLeft,),
                Padding(
                    padding:
                    EdgeInsets.only(top: 15.0, right: 20.0, left: 20.0),
                    child: IconButton(
                      iconSize: 70.0,
                      icon: Icon(
                        Icons.gps_fixed,
                        color: Colors.black,
                      ),
                      onPressed: () async {
                        // var x = _getLocation();
                        position = await Geolocator().getCurrentPosition(
                            desiredAccuracy: LocationAccuracy.high);
                        print("Entered GPS Button");
                        print(position);
                      },
                    )
                  // Align(alignment: Alignment.bottomRight,),
                ),
                Padding(
                    padding:
                    EdgeInsets.only(top: 15.0, right: 20.0, left: 20.0),
                    child: IconButton(
                      iconSize: 70.0,
                      icon: Icon(
                        Icons.camera,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        _pickImageFromCamera();
                      },
                    )),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0, top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  ButtonTheme(
                    child: OutlineButton(
                        child: Text("Arsel"),
                        highlightElevation: 2.0,
                        onPressed: () {
                          Servicer p = new Servicer("", 23, 4, [], 3, "Kabirr", emailController.text, true, images, Position(), nameController.text, 4, phoneController.text, "teacher");
                          String path = (p is Servicer) ? "Users" : "Service providers/" + p.prof_path;
                          Firestore.instance.document(path + "/961-${p.phone}").setData(p.toJson());
                          // retreiveContents(textEditingControllers);
                        }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: bottomNavigator(),
    );
  }

  List<String> retreiveContents(List<TextEditingController> list) {
    List<String> content;
    for (var i in list) {
      content.add(i.text);
      // print(i);
    }
    print(content);
    return content;
  }

  Widget typer(String text) {
    var myController = TextEditingController();
    // textEditingControllers.add(myController);
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: TextField(
        controller: myController,
        textDirection: TextDirection.rtl,
        autocorrect: false,
        autofocus: true,
        // textInputAction: ,
        textAlign: TextAlign.right,
        // keyboardType: TextInputType.datetime,

        decoration: new InputDecoration(
          border: OutlineInputBorder(),
          fillColor: Colors.white,
          filled: true,
          labelText: text,
          prefixText: text == " رقم الهاتف" ? "961-" : "",
        ),
      ),
    );
  }

  List<Widget> listmywidgets(List fields) {
    List<Widget> list = new List();
    for (var i in fields) {
      list.add(typer(i));
    }
    return list;
  }

  Future<Null> _pickImageFromGallery() async {
    final File imageFile =
    await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() => this._imageFile = imageFile);
  }

  Future<Null> _pickImageFromCamera() async {
    final File imageFile =
    await ImagePicker.pickImage(source: ImageSource.camera);
    // print("Acess");
    setState(() => this._imageFile = imageFile);
  }
}