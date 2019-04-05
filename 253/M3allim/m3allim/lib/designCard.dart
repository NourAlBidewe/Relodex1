import 'package:flutter/material.dart';
import './Categories.dart';
import './test.dart';

class card extends StatelessWidget {
  List<Categories> c1 = new List();
  card(list) {
    c1 = list;
  }

  @override
  Widget build(BuildContext context) {
    final title = 'SubCategories';
    return MaterialApp(
        title: title,
        home: Scaffold(
            appBar: AppBar(
              title: Text(title),
              backgroundColor: Color.fromRGBO(54, 82, 254, 1.0),
            ),
            body: new Center(
                child: GridView.builder(
                    itemCount: c1.length,
                    gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemBuilder: (BuildContext context, int index) {
                      return test(c1, index);
                    }))));

  }
}
