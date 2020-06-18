import 'package:fetch_from_internet/album_information/data/model/album_detail.dart';
import 'package:fetch_from_internet/album_information/data/provider/album_detail_repository.dart';
import 'package:flutter/material.dart';

class AlbumDetailScreen extends StatefulWidget {
  final int albumId;
  final String albumTitle;

  const AlbumDetailScreen({
    Key key,
    @required this.albumId,
    @required this.albumTitle,
  }) : super(key: key);

  @override
  _AlbumDetailScreenState createState() => _AlbumDetailScreenState();
}

class _AlbumDetailScreenState extends State<AlbumDetailScreen> {
  Future<List<AlbumDetail>> futureAlbumDetails;
  @override
  void initState() {
    super.initState();
    futureAlbumDetails = fetchAlbumDetail(albumId: widget.albumId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Album Detail'),
      ),
      body: FutureBuilder(
        future: futureAlbumDetails,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<AlbumDetail> listOfAlbumDetail = snapshot.data;
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height * 0.40,
                    width: MediaQuery.of(context).size.width,
                    color: Theme.of(context).primaryColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: 200,
                          width: 200,
                          child: Image(
                            image: NetworkImage(
                                listOfAlbumDetail.elementAt(0).url),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 10),
                            child: Text(
                              widget.albumTitle,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: listOfAlbumDetail.length,
                    itemBuilder: (context, index) => ListTile(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 5,
                      ),
                      leading: Image(
                        image: NetworkImage(
                            listOfAlbumDetail.elementAt(index).thumbnailUrl),
                      ),
                      title: Text(listOfAlbumDetail.elementAt(index).title),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
