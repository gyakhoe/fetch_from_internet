import 'package:fetch_from_internet/album_information/ui/album_home.dart';
import 'package:fetch_from_internet/post_detail/ui/post_home_screen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fecth From Internet'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          FlatButton(
            child: Text('Album Details'),
            color: Theme.of(context).primaryColor,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return AlbumHomeScreen();
              }));
            },
          ),
          FlatButton(
            child: Text('Post Details'),
            color: Theme.of(context).primaryColor,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return PostHomeScreen();
              }));
            },
          ),
        ],
      ),
    );
  }
}
