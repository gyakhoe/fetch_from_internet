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
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.music_note),
            title: Text('Album Details'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return AlbumHomeScreen();
              }));
            },
          ),
          ListTile(
            leading: Icon(Icons.local_post_office),
            title: Text('Post Details'),
            onTap: () {
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
