import 'package:fetch_from_internet/album_information/data/model/album_home.dart';
import 'package:fetch_from_internet/album_information/ui/album_detail_screen.dart';
import 'package:flutter/material.dart';

Widget albumDetails({
  @required Future<List<AlbumHome>> futerListOfAlbumHome,
}) {
  return FutureBuilder(
    future: futerListOfAlbumHome,
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        return _albumList(snapshot);
      } else if (snapshot.hasError) {
        return Text('${snapshot.error}');
      } else {
        return CircularProgressIndicator();
      }
    },
  );
}

Widget _albumList(AsyncSnapshot snapshot) {
  List<AlbumHome> listOfAlbumHomeDetail = snapshot.data;
  return ListView.builder(
    itemCount: listOfAlbumHomeDetail.length,
    itemBuilder: (context, index) {
      AlbumHome albumHome = listOfAlbumHomeDetail.elementAt(index);
      return ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        trailing: Icon(Icons.arrow_forward_ios),
        leading: Image(
          image: NetworkImage(albumHome.thumbnailUrl),
        ),
        title: Text(albumHome.title),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AlbumDetailScreen(
                        albumId: albumHome.albumId,
                        albumTitle: albumHome.title,
                      )));
        },
      );
    },
  );
}
