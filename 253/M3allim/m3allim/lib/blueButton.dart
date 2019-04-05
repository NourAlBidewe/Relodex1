import 'package:flutter/material.dart';

class BlueBottum extends StatelessWidget {
  String text = '';
  Widget f;

  BlueBottum(this.text, this.f);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(20),
      child: RaisedButton(
          child: Center(
            child: Text(
              text,
              style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 20.0),
            ),
          ),

          color: Color.fromRGBO(54, 82, 254, 1.0),
          padding:
              const EdgeInsets.only(left: 75.0, right: 75.0, top: 5, bottom: 5),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => f));
          },
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0))),
    );
  }
}
