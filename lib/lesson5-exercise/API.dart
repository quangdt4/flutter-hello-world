import 'dart:convert';

import 'model/AlbumRes.dart';
import 'package:http/http.dart' as http;

import 'model/AlbumReq.dart';

Future<AlbumRes> fetchAlbum() async {
  //GET - FETCH
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

  if (response.statusCode == 200) {
    return AlbumRes.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

Future<AlbumReq> createAlbum(String title) async {
  //POST
  final response = await http.post(
    Uri.parse('https://jsonplaceholder.typicode.com/albums'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'title': title,
    }),
  );

  if (response.statusCode == 201) {
    return AlbumReq.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to create album.');
  }
}
