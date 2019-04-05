// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// import './home.dart';
// import './blueButton.dart';

// class SignUp extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return _SignUp();
//   }
// }

// class _SignUp extends State<SignUp> {
//   final scaffoldKey = new GlobalKey<ScaffoldState>();
//   final formKey = new GlobalKey<FormState>();

//   String _email;
//   int age;
//   String _firstName;
//   String _password;
//   String _phoneNum;

//   Future<void> _submit() async {
//     final form = formKey.currentState;
//     if (form.validate()) {
//       form.save();
//       try {
//         FirebaseUser user = await FirebaseAuth.instance
//             .signInWithEmailAndPassword(email: _email, password: _password);
//         //performLogin();

//         Navigator.push(
//             context, MaterialPageRoute(builder: (context) => Home()));
//       } catch (e) {
//         print(e.message);
//         performLogin();
//       }
//     }
//   }

//   void performLogin() {
//     final snackBar = new SnackBar(
//       content: new Text("unavailable account"),
//     );
//     scaffoldKey.currentState.showSnackBar(snackBar);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold( 
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         iconTheme: IconThemeData(
//           color: Colors.black, //change your color here
//         ),
//         elevation: 0.0,
//         bottomOpacity: 0.0,
//         centerTitle: true,
//         //   title: Text(
//         //   "دخول",
//         // style: TextStyle(color: Colors.black, fontSize: 20.0),
//         //),
//         backgroundColor: Colors.white,
//       ),
//       key: scaffoldKey,
//       body: Center(child: Container(child: SingleChildScrollView(padding: const EdgeInsets.all(20.0),
//           child: Form(
//               key: formKey,
//               child: Center(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     new TextFormField(
//                       decoration: InputDecoration(
//                         labelText: "الاسم الاول",
//                       ),
//                     ),
      
//                     new TextFormField(
//                       decoration: InputDecoration(
//                         labelText: 'الاسم الثاني',
//                       ),
//                     ),
//                       new TextFormField(
//                       decoration: InputDecoration(
//                         labelText: "رقم الهاتف",
//                       ),
//                     ),
//                       new TextFormField(
//                       decoration: InputDecoration(
//                         labelText: "الاسم الاول",
//                       ),
                    
//                     ),
//                     new BlueBottum('انشاء حساب', Home()),
//                   ],
//                 ),
//               )))
//           ),
//     ));
//   }
// }
