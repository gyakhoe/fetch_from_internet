import 'package:fetch_from_internet/album_information/data/model/album_home.dart';

import 'package:fetch_from_internet/album_information/data/provider/album_home_repository.dart';
import 'package:fetch_from_internet/album_information/ui/album_detail_screen.dart';
import 'package:flutter/material.dart';

class AlbumHomeScreen extends StatefulWidget {
  AlbumHomeScreen({Key key}) : super(key: key);

  @override
  _AlbumHomeScreenState createState() => _AlbumHomeScreenState();
}

class _AlbumHomeScreenState extends State<AlbumHomeScreen> {
  Future<List<AlbumHome>> _futureAlbumHomeList;
  @override
  void initState() {
    _futureAlbumHomeList = fetchAlbumHomeScreenDetail();
    super.initState();
  }

  @override
  void dispose() {
    _futureAlbumHomeList = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Available Albums'),
      ),
      body: Center(
        child: FutureBuilder(
          future: _futureAlbumHomeList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<AlbumHome> listOfAlbumHomeDetail = snapshot.data;
              return ListView.builder(
                itemCount: listOfAlbumHomeDetail.length,
                itemBuilder: (context, index) => ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  trailing: Icon(Icons.arrow_forward_ios),
                  leading: Image(
                    image: NetworkImage(
                        listOfAlbumHomeDetail.elementAt(index).thumbnailUrl),
                  ),
                  title: Text(listOfAlbumHomeDetail.elementAt(index).title),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AlbumDetailScreen(
                                  albumId: listOfAlbumHomeDetail
                                      .elementAt(index)
                                      .albumId,
                                  albumTitle: listOfAlbumHomeDetail
                                      .elementAt(index)
                                      .title,
                                )));
                  },
                ),
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
