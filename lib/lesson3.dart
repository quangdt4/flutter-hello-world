import 'package:flutter/material.dart';

/* LESSON 3:
+ build UI
+ vòng đời State
+ MediaQuary flutter de lay size man hinh
+ tim hieu de lay text trong textfield ra snackbar
+ tim hieu postioned de custom vi tri cua widget
*/

void main() {
  runApp(Lesson3App());
}

class Lesson3App extends StatelessWidget {
  const Lesson3App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        home: Lesson3Homepage());
  }
}

class Lesson3Homepage extends StatefulWidget {
  const Lesson3Homepage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return HomepageState();
  }
}

class HomepageState extends State<Lesson3Homepage> {
  int _counter = 1;

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "App Bar",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              // verticalDirection: VerticalDirection.up,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text("Lesson 3"),
                Text(
                  "Number: $_counter ",
                  style: Theme.of(context).textTheme.headline5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Expanded(child: Text("Stamford: ")),
                    // expanded: mo rong het muc co the
                    Flexible(child: Text("Stamford: ")),
                    const SizedBox(
                      width: 16,
                    ),
                    Image.network(
                      "https://upload.wikimedia.org/wikipedia/commons/thumb/7/7c/Stamford_Bridge_-_West_Stand.jpg/800px-Stamford_Bridge_-_West_Stand.jpg",
                      width: 100,
                      // queryData.size.width
                      height: 100,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("clicked")));
                        },
                        child: const Text("Click me!"))
                  ],
                ),
                TextField(
                  controller: TextEditingController(),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.plus_one),
        onPressed: () {
          setState(() {
            _counter++;
          });
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void deactivate() {
    super.deactivate();
  }

/*@override
  void didUpdateWidget(T oldWidget) {
    super.didUpdateWidget(oldWidget);
  }*/
}
