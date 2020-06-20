import 'package:fetch_from_internet/album_information/data/model/album_home.dart';
import 'package:fetch_from_internet/album_information/logic/album_home_repository.dart';
import 'package:fetch_from_internet/album_information/ui/widgets/album_detail.dart';
import 'package:flutter/material.dart';

class AlbumHomeScreen extends StatelessWidget {
  AlbumHomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Available Albums'),
      ),
      body: Center(
        child: albumDetails(futerListOfAlbumHome: fetchAlbumHomeScreenDetail()),
      ),
    );
  }
}
