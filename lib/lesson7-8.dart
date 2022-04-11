// LESSON 7-8: LẬP TRÌNH BẤT ĐỒNG BỘ, API
// - Lập trình bất đồng bộ: future, async, await, then
// + Cho phép thực hiện công việc trong khi chờ việc khác. Ví dụ:
// + lấy data từ CSDL, API...
// - http request, call API trả về json

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:helloworld/lesson5-exercise/model/AlbumRes.dart';
import 'package:helloworld/lesson5-exercise/model/AlbumReq.dart';
import 'API.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<AlbumRes> futureAlbumFromGET;
  final TextEditingController _controller = TextEditingController();
  Future<AlbumReq>? _futureAlbumFromPOST;

  @override
  void initState() {
    super.initState();
    futureAlbumFromGET = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              getAPI(),
              postAPI(),
            ],
          ),
        ),
      ),
    );
  }

  Widget getAPI() {
    return FutureBuilder<AlbumRes>(
      future: futureAlbumFromGET,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data!.title);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return const CircularProgressIndicator();
      },
    );
  }

  Widget postAPI() {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(8.0),
      child:
          (_futureAlbumFromPOST == null) ? buildColumn() : buildFutureBuilder(),
    );
  }

  Column buildColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextField(
          controller: _controller,
          decoration: const InputDecoration(hintText: 'Enter Title'),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _futureAlbumFromPOST = createAlbum(_controller.text);
            });
          },
          child: const Text('Create Data'),
        ),
      ],
    );
  }

  FutureBuilder<AlbumReq> buildFutureBuilder() {
    return FutureBuilder<AlbumReq>(
      future: _futureAlbumFromPOST,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data!.title);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
