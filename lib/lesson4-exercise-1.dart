import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const Lesson4Exercise());
}

class Lesson4Exercise extends StatelessWidget {
  const Lesson4Exercise({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      home: const L4ExHomepage(),
    );
  }
}

class L4ExHomepage extends StatefulWidget {
  const L4ExHomepage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomepageState();
}

class _HomepageState extends State<L4ExHomepage> {
  final _controllerGetA = TextEditingController();
  final _controllerGetB = TextEditingController();
  dynamic _result = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculator"),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(100),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 200,
                      width: 200,
                      child: Image.asset("assets/image/ic_ferb.png"),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      maxLines: 1,
                      controller: _controllerGetA,
                      decoration: const InputDecoration(hintText: "Nhap so A"),
                    ),
                    TextField(
                      maxLines: 1,
                      controller: _controllerGetB,
                      decoration: const InputDecoration(hintText: "Nhap so B"),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text("Ket qua = $_result",
                        style: const TextStyle(fontSize: 20))
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        cal(1);
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.purple,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          textStyle: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      child: const Text("+")),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        cal(2);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.amberAccent,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        textStyle: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      child: const Text("-")),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        cal(3);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.redAccent,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        textStyle: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      child: const Text("x")),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        cal(4);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.teal,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        textStyle: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      child: const Text(":"))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void cal(int a) {
    setState(() {
      switch (a) {
        case 1:
          _result =
              int.parse(_controllerGetA.text) + int.parse(_controllerGetB.text);
          break;
        case 2:
          _result =
              int.parse(_controllerGetA.text) - int.parse(_controllerGetB.text);
          break;
        case 3:
          _result =
              int.parse(_controllerGetA.text) * int.parse(_controllerGetB.text);
          break;
        case 4:
          _result = int.parse(_controllerGetA.text) ~/
              int.parse(_controllerGetB.text);
          break;
      }
    });
  }
}
