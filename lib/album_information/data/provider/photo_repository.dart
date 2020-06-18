import 'dart:convert';
import 'package:fetch_from_internet/album_information/data/model/photo.dart';
import 'package:http/http.dart' as http;

final String _serviceUrl = 'http://jsonplaceholder.typicode.com/photos/';

Future<List<Photo>> fetchAllAlbumPhotos() async {
  final response = await http.get('$_serviceUrl');

  if (response.statusCode == 200) {
    List<Photo> listOfAlbumPhotos = (json.decode(response.body) as List)
        .map((data) => Photo.fromMap(data))
        .toList();
    return listOfAlbumPhotos;
  } else {
    throw Exception('Failed to laod album');
  }
}
