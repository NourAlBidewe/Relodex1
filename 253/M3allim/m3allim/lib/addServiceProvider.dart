import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:geolocator/geolocator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:m3allim/Categories.dart';
import 'serviceProvider.dart';
import './crud.dart';
import 'package:fluttertoast/fluttertoast.dart';

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


var images = [];
var constImage = [Image.asset("assets/insertImage.png")];

int indexElement = 0;



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

bool deleteConfirmed = false;

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
  final profController = TextEditingController();
  final addressController = TextEditingController();

  PageController pagecontroller;

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
        backgroundColor: Colors.deepPurple,
        elevation: 0.0,
        title: Text(
          'UPLOAD',
          style: TextStyle(
              fontFamily: 'Montserrat', fontSize: 15.0, color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          iconSize: 17.0,
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            color: Colors.white,
            iconSize: 17.0,
            onPressed: () {},
          ),
        ],
      ),
      body: new SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                GestureDetector(
                  child: imageCarousel(),
                  onLongPress: () {
                    _showDeleteOption();
                    // deleteConfirmed = false;
                    // if(deleteConfirmed == true){

                    // }
                  },
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: iconsDisplay(Icons.camera),
                ),
              ],
            ),
            typer("Name", nameController, "", TextInputType.text),
            typer("phone", phoneController, "961-", TextInputType.phone),
            typer("description", descriptionController, "", TextInputType.text),
            typer("address", addressController, "", TextInputType.text),
            FlatButton(
                child: Text(profController.text),
                onPressed: (){
                    handle(listy);
                    setState(() {                   
                    });
                }),
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
                    child: iconsDisplay(Icons.gps_fixed)),
                // Padding(
                //     padding:
                //         EdgeInsets.only(top: 15.0, right: 20.0, left: 20.0),
                //     child: iconsDisplay(Icons.camera)),
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
                          ServiceProvider p = new ServiceProvider(
                              addressController.text,
                              23,
                              true,
                              GeoPoint(0, 0),
                              nameController.text,
                              phoneController.text,
                              profController.text,
                              
                              );
                              print(nameController.text);
                              print(addressController.text);
                              print(phoneController.text);
                              print(profController.text);
                              p.description = descriptionController.text;
                              // p.images = images;
                              fb.add(p);
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

  void handle(List<Categories> lst){
    popUp(context, lst);
    getPath();

  }
String path = '';
String  catName = '';
String subCatName = '';

getPath(){
  if(catName==''){
    path = subCatName + '/' + subCatName;
  }
  else{
    path = catName +'/' +subCatName;
  }
  profController.text = path;
}





  Future<bool> popUp(context, List<Categories> listy) {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context){        
        return AlertDialog(
        title: const Text('Select Job'),
        content: new Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  height: 300,
                  width: 300,
                  child: ListView(
                    shrinkWrap: true,
                    children: listy
                        .map((data) => GestureDetector(
                              child: textRetriever(data),
                              onTap: () {
                                setState(() {
                                  if (data.sub.length != 0) {
                                    catName = data.name;
                                    Navigator.of(context).pop(true);
                                    popUp(context, data.sub);
                                  } else {
                                    subCatName = data.name;
                                    // profController.text = data.name;
                                    Navigator.of(context).pop(true);
                                    
                                  }
                                  getPath();
                                }
                                );
                              },
                            ))
                        .toList(),
                  ))
            ]));
      }
    );
  }


  Widget _showDeleteOption() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            // content: Expanded(
            content: FlatButton(
              // child: Text("Delete"),
              onPressed: () {
                if (images.length != 0) {
                  images.removeAt(indexElement);
                  deleteConfirmed = true;
                  Navigator.pop(context);
                  print(deleteConfirmed);
                } else {
                  toastMessage("Nothing to Delete");
                  deleteConfirmed = false;
                  Navigator.pop(context);
                  // Navigator.pop(context);
                }
              },
              child: Text("Delete"),
            ),
          );
        });
  }

  Widget iconsDisplay(IconData type) {
    return IconButton(
      alignment: Alignment.topRight,
      iconSize: 50,
      icon: Icon(
        type,
        color: Colors.black,
      ),
      onPressed: () async {
        if (type == Icons.camera) {
          _pickImageFromCamera();
        } else {
          position = await Geolocator()
              .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
        }
      },
    );
  }

  Widget typer(String text, TextEditingController myController, String pref,
      TextInputType keyboard) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: TextField(
        controller: myController,
        textDirection: TextDirection.rtl,
        autocorrect: false,
        autofocus: true,
        textAlign: TextAlign.right,
        keyboardType: keyboard,
        decoration: new InputDecoration(
          border: OutlineInputBorder(),
          fillColor: Colors.white,
          filled: true,
          labelText: text,
          prefixText: pref,
        ),
      ),
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

  // List<Widget> listmywidgets(List fields) {
  //   List<Widget> list = new List();
  //   for (var i in fields) {
  //     list.add(typer(i));
  //   }
  //   return list;
  // }

  Future<Null> _pickImageFromGallery() async {
    final File imageFile =
        await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() => this._imageFile = imageFile);
    if (imageFile != null) {
      images.add(imageFile);
    }
  }

  Future<Null> _pickImageFromCamera() async {
    final File imageFile =
        await ImagePicker.pickImage(source: ImageSource.camera);
    // print("Acess");
    setState(() => this._imageFile = imageFile);
    if (imageFile != null) {
      images.add(imageFile);
    }
  }

  int indexedPage = indexElement;

  Widget imageCarousel() {
    return images.length != 0
        ? CarouselSlider(
            height: 200,
            //autoPlayInterval: Duration(seconds: 2),
            //autoPlay: true,
            onPageChanged: (index) {
              setState(() {
                indexElement = index;
                if (deleteConfirmed == true) {
                  indexedPage++;
                  // pagecontroller.previousPage(duration: Duration(milliseconds: 0), curve: Curves.bounceIn);
                }
                print("Index Element ${indexElement}    Index: ${index}");
              });
            },
            initialPage: indexedPage,
            items: images.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    padding: EdgeInsets.only(top: 10),
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    child: Image.file(i),
                  );
                },
              );
            }).toList(),
          )
        : Align(
            alignment: Alignment.center,
            //child: Image.asset("assets/insertImage.png"),
          );
  }

  Widget toastMessage(String toastMessage) {
    Fluttertoast.showToast(
        msg: toastMessage,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static List<Categories> subDoctor = [
    new Categories("قلب", 'assets/hearty.jpg', []),
    new Categories("جهاز هضمي", 'assets/hadme.jpg', []),
    new Categories("نسائي", 'assets/women.jpg', []),
    new Categories("جلد", 'assets/skin.jpg', []),
    new Categories("اسنان", 'assets/tooth.jpg', []),
    new Categories("صحة عامة", 'assets/hearty.jpg', []),
  ];

  static List<Categories> subDecor = [
    new Categories("اثاث", 'assets/furniture.jpg', []),
    new Categories("دهان", 'assets/furniture.jpg', []),
    new Categories("مهندس ديكور", 'assets/furniture.jpg', []),
  ];

  static List<Categories> subTeacher = [
    new Categories("ابتدائي", 'assets/elementary.jpg', []),
    new Categories("تمهيدي", 'assets/elementary.jpg', []),
    new Categories("متوسط", 'assets/midSchool.jpg', []),
    new Categories("ثانوي", 'assets/highSchool.jpg', []),
    new Categories("جامعي", 'assets/uniStudent.jpg', []),
  ];

  static List<Categories> halak = [
    new Categories("للرجال", 'assets/barbermen.jpg', []),
    new Categories("للنساء", 'assets/barberwomen.jpg', [])
  ];

  List<Categories> listy = [
    new Categories('طبيب', 'assets/doctor.jpg', subDoctor),
    new Categories('حداد', 'assets/hadad.jpg', []),
    new Categories('كهربجي', 'assets/kahrbge.jpg', []),
    new Categories('بستاني', 'assets/bostane.jpg', []),
    new Categories('خياط', 'assets/tailor.jpg', []),
    new Categories('استاذ', 'assets/tutor.jpg', subTeacher),
    new Categories('ديكور', 'assets/designImage.jpg', subDecor),
    new Categories('سمسار', 'assets/realEstate.jpg', []),
    new Categories('سمكري', 'assets/plumber.jpg', []),
    new Categories('قندرجي', 'assets/shoe.jpg', []),
    new Categories('حلاق', 'assets/hdresser.jpg', halak),
    new Categories('مصور', 'assets/photo.jpg', []),
    new Categories('عامل', 'assets/kahrbge.jpg', []),
  ];

}

class textRetriever extends StatefulWidget {
  Categories jobKind;

  textRetriever(this.jobKind);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _textRetriever(this.jobKind);
  }
}

class _textRetriever extends State<textRetriever> {
  Categories jobKind;

  _textRetriever(this.jobKind);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Center(child: Text(
        jobKind.name,
        textAlign: TextAlign.right,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),),
    );
  }
}







