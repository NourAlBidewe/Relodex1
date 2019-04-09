import 'package:flutter/material.dart';
import './Categories.dart';

class displayOneCard extends StatelessWidget {
  Categories data;
  displayOneCard(Categories data){
    this.data = data;
  }

  @override
  Widget build(BuildContext context) {
    return 
      
      Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      elevation: 1.0,
      child:
          Column(
        children: <Widget>[
          Container(
            height: 131.0,
            width: 170.0,
            child: Image.asset(
              data.imageName,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            data.name,
            style: TextStyle(
                background: Paint()..color = Colors.transparent,
                color: Colors.black,
                fontSize: 17.0,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    
    );
  }
}
