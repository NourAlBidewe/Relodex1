import 'package:flutter/material.dart';


void main() => runApp(new MyApp());

String names = " الموقع رقم الهاتف  المهنة";
String name = "name";

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      //debugShowCheckedModeBanner: false,
      title: 'Flutter Carousel',
      home: Scaffold(
        body: UploadBody()
      ),
    );
  }
}

class UploadBody extends StatefulWidget{
  // UploadBodyState createState() => new UploadBodyState();

  @override
  State<StatefulWidget> createState() {
    return UploadBodyState();
  }

}

class UploadBodyState extends State<UploadBody>{
  @override
  Widget build(BuildContext context){
    return Column(
        // padding: const EdgeInsets.symmetric(horizontal: 16.0),
        children: <Widget>[
        // new Container(
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.only(
        //         topLeft: Radius.circular(15.0),
        //         bottomRight: Radius.circular(15.0)),
        //     color: Colors.amber.withOpacity(0.5),
        //   ),
        // ),
        new TextFormField(
          decoration: const InputDecoration(
            border: UnderlineInputBorder(),
            filled:true,
            labelText: "الاسم",
          ),
        ),
        new TextFormField(
          decoration: const InputDecoration(
            border: UnderlineInputBorder(),
            filled:true,
            icon: Icon(Icons.gps_fixed),
            labelText: "الموقع",
          ),
        ),
        new TextFormField(
          decoration: const InputDecoration(
            border: UnderlineInputBorder(),
            filled:true,
            labelText: "رقم الهاتف",
            prefixText: "+961"
          ),
        ),
        new Container(
        )
        ],
    );
  }

}