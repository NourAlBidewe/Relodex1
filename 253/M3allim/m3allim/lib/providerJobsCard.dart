import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:m3allim/ServiceProvider.dart';
import 'package:m3allim/User.dart';
import 'package:m3allim/displayServiceProvider.dart';


class providerJobsCard extends StatelessWidget{
  ServiceProvider sv;
  User u;
  providerJobsCard(this.sv, this.u);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:  () {
        Navigator.push(
             context, MaterialPageRoute(builder: (context) => Display(sv, u)));
      },
      child: Card(
        elevation: 1.0,
      child: Column(
        children: <Widget>[
          //Text(sv.name, style: TextStyle(fontWeight: FontWeight.bold),),
          Text(sv.getProfession(), style: TextStyle(fontWeight: FontWeight.bold),),
          StarRating(
              size: MediaQuery.of(context).size.width / 20,
              rating: sv.average_rating,
              color: Colors.orange,
            ),

        ],
      ),
    ),
    )
    ;
  }



}
