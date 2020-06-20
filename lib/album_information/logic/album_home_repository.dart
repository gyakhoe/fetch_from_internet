import 'package:fetch_from_internet/album_information/data/model/album.dart';
import 'package:fetch_from_internet/album_information/data/model/album_home.dart';
import 'package:fetch_from_internet/album_information/data/model/photo.dart';
import 'package:fetch_from_internet/album_information/data/provider/album_repostiory.dart';
import 'package:fetch_from_internet/album_information/data/provider/photo_repository.dart';

Future<List<AlbumHome>> fetchAlbumHomeScreenDetail() async {
  List<Album> listOfAlbum = await fetchAllAlbum();
  List<Photo> listOfAlbumArt = await fetchAllAlbumPhotos();

  List<AlbumHome> listOfAlbumHomeDetails = List<AlbumHome>();

  for (int index = 0; index < listOfAlbum.length; index++) {
    AlbumHome albumHome = AlbumHome(
      albumId: listOfAlbum.elementAt(index).id,
      thumbnailUrl: listOfAlbumArt.elementAt(index).thumbnailUrl,
      title: listOfAlbum.elementAt(index).title,
    );
    listOfAlbumHomeDetails.add(albumHome);
  }

  return listOfAlbumHomeDetails;
}
