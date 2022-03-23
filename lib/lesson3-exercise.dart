import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const Lesson3Exercise());
}

class Lesson3Exercise extends StatelessWidget {
  const Lesson3Exercise({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      home: const L3ExHomepage(),
    );
  }
}

class L3ExHomepage extends StatefulWidget {
  const L3ExHomepage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomepageState();
}

class _HomepageState extends State<L3ExHomepage> {
  int _counter = 0;
  int numberCheck = 0;
  var color = <Color>[Colors.greenAccent, Colors.white60];
  var random = Random();
  var controllerGetText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: (_counter % 2 == 0 && _counter != 0)
          ? color[random.nextInt(2)]
          : Colors.white,
      appBar: AppBar(
        title: const Text("Lesson 3 Exercise"),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Number: $_counter"),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: onClickNumberPlus, child: const Icon(Icons.add)),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                thickness: 0.5,
                indent: 50,
                endIndent: 50,
                color: Colors.black,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const Text("Nhap so can check:"),
                    const SizedBox(
                      width: 10,
                    ),
                    Flexible(
                        child: TextField(
                      controller: controllerGetText,
                      decoration: const InputDecoration(hintText: "10"),
                    )),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          onClickNumberCheck();
                        },
                        child: const Text("Check"))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onClickNumberPlus() {
    setState(() {
      _counter++;
    });
  }

  void onClickNumberCheck() {
    setState(() {
      String content = checkSoNguyenTo(int.parse(controllerGetText.text))
          ? "la so nguyen to"
          : "khong phai la so nguyen to";
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("${controllerGetText.text} $content")));
    });
  }

  bool checkSoNguyenTo(int n) {
    if (n <= 1) {
      return false;
    } else {
      for (int i = 2; i <= n / 2; i++) {
        if (n % i == 0) return false;
      }
    }
    return true;
  }

  @override
  void dispose() {
    controllerGetText.dispose();
    super.dispose();
  }
}
