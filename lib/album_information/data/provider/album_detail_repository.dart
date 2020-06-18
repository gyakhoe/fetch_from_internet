import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:fetch_from_internet/album_information/data/model/album_detail.dart';

Future<List<AlbumDetail>> fetchAlbumDetail({@required int albumId}) async {
  final String _serviceUrl =
      'http://jsonplaceholder.typicode.com/albums/$albumId/photos';
  final response = await http.get('$_serviceUrl');
  if (response.statusCode == 200) {
    List<AlbumDetail> listOfAlbumDetail = (json.decode(response.body) as List)
        .map((data) => AlbumDetail.fromMap(data))
        .toList();
    return listOfAlbumDetail;
  } else {
    throw Exception('Failed to laod album');
  }
}
