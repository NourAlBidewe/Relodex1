import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


import './Crud.dart';
import './home.dart';
import './User.dart';


class FormPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FormPageState();
  }
}

class _FormPageState extends State<FormPage> {
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();

  //String _email;
  //String _password;
  String _phoneNum;


  static getServiceProviders(String categoryAndSub) async {
    QuerySnapshot qs = await Firestore.instance
        .collection("Service Providers/" + categoryAndSub)
        .getDocuments();
    List<User> lst = new List<User>();
    for (DocumentSnapshot ds in qs.documents) lst.add(User.fromSnapshot(ds));
    return lst;
  }


  // ServiceProvider s = ServiceProvider("ابو علي", 4.1, "بيروت", 22.3, "+96176661878", 'ميكانيكي', [1,2,4]);
  //service_provider s = 
  //List<User> listy = getServiceProviders('blacksmiths/Blacksmiths');
  //static var x = listy[0];
  // print
  //ServiceProvider s = listy[0];

  //ServiceProvider s = ServiceProvider('بيروت', 29, true, [1,4,8], "xx", true, ["hello"], "النجار ابو علي", 9, '12664237', 6, "blacksmiths/Blacksmiths", GeoPoint(33,33));
   //ServiceProvider(this.address, this.age, this.gender, this.location, this.name, this.phone, this.prof_path);


  Future<void> _submit() async {
    final form = formKey.currentState;
    print("hello");
    if (form.validate()) {
      print("hello");
      form.save();
      try {
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => Display(s)));
           // context, MaterialPageRoute(builder: (context) => ServiceDisplay()));
      } catch (e) {
        print(e.message);
        performLogin();
      }
    }
  }

  void performLogin() {
    final snackBar = new SnackBar(
      content: new Text("unavailable account"),
    );
    scaffoldKey.currentState.showSnackBar(snackBar);
  }

  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.parse(s, (e) => null) != null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          elevation: 0.0,
          bottomOpacity: 0.0,
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        key: scaffoldKey,
        body: Center(
          child: Container(
              child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                      key: formKey,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            // TO-DO ADD THE LARGE TEXT
                            new TextFormField(
                              decoration: InputDecoration(
                                labelText: "رقم الهاتف",
                              ),
                              validator: (val) =>
                                  val.length != 8 || !isNumeric(val)
                                      ? 'الرجاء ادخال رقم صالح'
                                      : null,
                              onSaved: (val) => _phoneNum = val,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: RaisedButton(
                                  child: Center(
                                    child: Text(
                                      'تسجيل',
                                      style: new TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 20.0),
                                    ),
                                  ),
                                  color: Color.fromRGBO(54, 82, 254, 1.0),
                                  padding: const EdgeInsets.only(
                                      left: 75.0,
                                      right: 75.0,
                                      top: 5,
                                      bottom: 5),
                                  onPressed: () {
                                    _submit();
                                  },
                                  shape: new RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(30.0))),
                            )

                            //    new BlueBottum('تسجيل', _submit()),
                          ],
                        ),
                      )))),
        ));
  }
}
