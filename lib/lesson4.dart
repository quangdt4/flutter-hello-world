/* LESSON 4: EXPAND - FLEXIBLE - STACK - GRADIENT - IMPORT IMAGE
- expand: được sử dụng để set bố cục row/column, nằm trong mảng children[],
 expand dùng để mở rộng nhất có thể ~ match parent
- flexible: cũng như expand nhưng mềm dẻo hơn
  + fit = loose => = wrap content
  + flex = weigt (chia bố cục thành từng phần)
- Container: là layout dùng để chứa đựng các widget
- Column = LinearLayout, Row = TableRow
- Stack: layout chồng lên nhau = FrameLayout
  + topStart: vị trí
  + clipped: bị ẩn đi
  + alignment: sắp xếp vị trí tương đối so vs cha
  + Positioned(): custom vị trí

- Cách import ảnh:
  + tạo file assets
  + khai báo ảnh trong pubspec.yaml
  + xuống mục flutter:
  + copy:
      assets:
      - assets/image/ic_ferb.png

- ListTile: danh sahcs
  + leading: bên trái
  + trailing: bên phải
*/

import 'package:flutter/material.dart';

void main() {
  runApp(Lesson4App());
}

class Lesson4App extends StatelessWidget {
  const Lesson4App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      home: const Lesson4Homepage(),
    );
  }
}

class Lesson4Homepage extends StatefulWidget {
  const Lesson4Homepage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomepageState();
}

class _HomepageState extends State<Lesson4Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
            // child: _expandFlexible(),
            // child: _stack(),
            child: _cardView()),
      ),
    );
  }
}

Widget _cardView() {
  return SizedBox(
    height: 210,
    child: Card(
      child: Column(
        children: [
          ListTile(
            title: const Text(
              '1625 Main Street',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            subtitle: const Text('My City, CA 99984'),
            trailing: Icon(
              Icons.restaurant_menu,
              color: Colors.blue[500],
            ),
          ),
          const Divider(),
          ListTile(
            title: const Text(
              '(408) 555-1212',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            leading: Icon(
              Icons.contact_phone,
              color: Colors.blue[500],
            ),
          ),
          ListTile(
            title: const Text('costa@example.com'),
            leading: Icon(
              Icons.contact_mail,
              color: Colors.blue[500],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _expandFlexible() {
  return Column(
    children: <Widget>[
      Container(
        color: Colors.blue,
        height: 100,
        width: 100,
      ),
      Expanded(
        child: Container(
          color: Colors.amber,
          width: 100,
        ),
      ),
      Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: <Widget>[
            Flexible(
              child: Container(
                color: Colors.blueGrey,
                height: 150,
              ),
            ),
            Container(
              color: Colors.brown,
              height: 150,
              width: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Flexible(
                fit: FlexFit.loose,
                child: Container(
                  color: Colors.cyan,
                  child: const Text('Short text'),
                ),
              ),
            )
          ],
        ),
      ),
      Expanded(
        flex: 2,
        child: Container(
          color: Colors.red,
          width: 100,
        ),
      ),
    ],
  );
}

Widget _stack() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      _stackExample(),
      _sizedBox10(),
      _gradientExample(),
      _buildCircleAvatar()
    ],
  );
}

Widget _sizedBox10() {
  return const SizedBox(
    height: 10,
  );
}

Widget _gradientExample() {
  return SizedBox(
    // GRADIENT
    width: 250,
    height: 250,
    child: Stack(
      children: <Widget>[
        Container(
          width: 250,
          height: 250,
          color: Colors.blue,
        ),
        Container(
          padding: const EdgeInsets.all(5.0),
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                Colors.black.withAlpha(0),
                Colors.black12,
                Colors.black45
              ],
            ),
          ),
          child: const Text(
            'Foreground Text',
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          ),
        ),
      ],
    ),
  );
}

Widget _stackExample() {
  return Stack(
    alignment: Alignment.topRight,
    children: <Widget>[
      Container(
        width: 100,
        height: 100,
        color: Colors.red,
      ),
      Container(
        width: 90,
        height: 90,
        color: Colors.green,
      ),
      Positioned(
        bottom: 0,
        right: 0,
        child: Container(
          width: 80,
          height: 80,
          color: Colors.blue,
        ),
      ),
    ],
  );
}

Widget _buildCircleAvatar() {
  return Stack(
    alignment: const Alignment(0.6, 0.6),
    children: [
      const CircleAvatar(
        backgroundImage: AssetImage('assets/image/ic_ferb.png'),
        radius: 100,
      ),
      Container(
        decoration: const BoxDecoration(
          color: Colors.black45,
        ),
        child: const Text(
          'Mia B',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    ],
  );
}
