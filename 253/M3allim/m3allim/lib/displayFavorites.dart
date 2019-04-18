import 'package:flutter/material.dart';
import 'package:m3allim/ServiceProvider.dart';
import 'package:m3allim/User.dart';
import 'package:m3allim/bottomNavigator.dart';
import 'package:m3allim/displayFavoritesCard.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'crud.dart';

class displayFavorites extends StatefulWidget {
  List<ServiceProvider> favoritesList;
  User u;
  displayFavorites(this.favoritesList, this.u);
  @override
  State<StatefulWidget> createState() {
    return _displayFavorites(favoritesList, u);
  }
}

class _displayFavorites extends State<displayFavorites> {
  List<ServiceProvider> favoritesList;
  User u;

  _displayFavorites(this.favoritesList, this.u);


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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search, size: 30,),
              color: Colors.white,
              iconSize: 17.0,
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.info, size: 30,),
              color: Colors.white,
              iconSize: 17.0,
              onPressed: () {
                  toastMessage('اسحب للإزالة من القائمة');
              },
            ),
             
          ],
        ),
        body: Container(
          child: Column(
            children: <Widget>[
             Expanded(child:  ListView.builder(
          itemCount: favoritesList.length,
          itemBuilder: (context, int index){
            return new Dismissible(
              child: diplayFavoritesCard(favoritesList[index], u),
              key: new Key(favoritesList[index].phone),
              onDismissed: (direction){
                 fb.removeFavorite(u, favoritesList[index]);
                Scaffold.of(context).showSnackBar(
                  new SnackBar(
                    content: Text('تمت الازالة من القائمة', textDirection: TextDirection.rtl,),
                  )
                ); 

              },
              

            );
          }
        ),)
            ],
          ),
        ),
        bottomNavigationBar: bottomNavigator(u),
      ),
    );
  }
}
