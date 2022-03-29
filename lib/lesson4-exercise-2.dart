import 'package:flutter/material.dart';

void main() {
  runApp(const Lesson4Exercise2());
}

class Lesson4Exercise2 extends StatelessWidget {
  const Lesson4Exercise2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Manrope"),
      home: const L4Ex2HomePage(),
    );
  }
}

class L4Ex2HomePage extends StatefulWidget {
  const L4Ex2HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomepageState();
}

class _HomepageState extends State<L4Ex2HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Travel"),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Expanded(flex: 1, child: _hanoi()),
              const Divider(
                thickness: 0.5,
                indent: 40,
                endIndent: 40,
                color: Colors.black,
              ),
              Expanded(flex: 1, child: _paris()),
              const Divider(
                thickness: 0.5,
                indent: 40,
                endIndent: 40,
                color: Colors.black,
              ),
              Expanded(flex: 1, child: _london()),
            ],
          ),
        ),
      ),
    );
  }
}

const String _hanoiS =
    "https://i.natgeofe.com/n/39181071-db55-488f-bd54-707759ad924e/river-hanoi-vietnam_3x2.jpg";
const String _parisS =
    "https://pix6.agoda.net/geo/city/15470/1_15470_02.jpg?ca=6&ce=1&s=1920x822";
const String _londonS =
    "https://menback.com/wp-content/uploads/2021/06/dong-ho-bigben-london.jpg";

Widget _hanoi() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SizedBox(
        width: 160,
        height: 120,
        child: Image.network(_hanoiS),
      ),
      const SizedBox(width: 10),
      SizedBox(
        width: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text(
              "Hanoi, Vietnam",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "Founded over 1000 years ago, Vietnam's capital city is rich in history, with the streets of its rambling Old Quarter dating back to the 14th century.",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
            )
          ],
        ),
      )
    ],
  );
}

Widget _paris() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SizedBox(
        width: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text(
              "Paris, France",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "Paris is the capital city of France, and the largest city in France. The area is 105 square kilometres, and around 2.15 million people live there. If suburbs are counted, the population of the Paris area rises to 10.7 million people.",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
            )
          ],
        ),
      ),
      const SizedBox(width: 10),
      SizedBox(
        width: 160,
        height: 120,
        child: Image.network(_parisS),
      )
    ],
  );
}

Widget _london() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SizedBox(
        width: 160,
        height: 120,
        child: Image.network(_londonS),
      ),
      const SizedBox(width: 10),
      SizedBox(
        width: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text(
              "London, UK",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "London is the capital city of the United Kingdom. It is the U.K.'s largest metropolis and its economic, transportation, and cultural centre. London is also among the oldest of the world's great cities, with its history spanning nearly two millennia.",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
            )
          ],
        ),
      )
    ],
  );
}
