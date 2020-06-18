import 'dart:convert';
import 'package:fetch_from_internet/album_information/data/model/album.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

final String _serviceUrl = 'https://jsonplaceholder.typicode.com/albums/';
Future<Album> fetchAlbum({@required String albumId}) async {
  final response = await http.get('$_serviceUrl$albumId');
  if (response.statusCode == 200) {
    return Album.fromJson(response.body.toString());
  } else {
    throw Exception('Failed to load album');
  }
}

Future<List<Album>> fetchAllAlbum() async {
  final response = await http.get('$_serviceUrl');

  if (response.statusCode == 200) {
    List<Album> listOfAlbum = (json.decode(response.body) as List)
        .map((data) => Album.fromMap(data))
        .toList();
    return listOfAlbum;
  } else {
    throw Exception('Failed to laod album');
  }
}
