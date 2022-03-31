import 'package:flutter/material.dart';

void main() {
  runApp(const Lesson5Exercise1());
}

class Routes {
  static const String screen1 = "/screen1";
  static const String screen2 = "/screen2";
}

class Lesson5Exercise1 extends StatelessWidget {
  const Lesson5Exercise1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      home: const L5ExHomepage(),
      routes: {
        Routes.screen1: (context) => const Lesson5Exercise1(),
        // Routes.screen2: (context) => const Lesson5Exercise2(),
      },
    );
  }
}

class L5ExHomepage extends StatefulWidget {
  const L5ExHomepage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomepageState();
}

class _HomepageState extends State<L5ExHomepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [Flexible(child: gridView())],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget appBar() {
    return AppBar(
      backgroundColor: Colors.purple,
      title: const Text("My Club"),
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () {
          onClickMenu();
        },
      ),
      actions: [
        IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              onClickShoppingCart();
            }),
        IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              onClickMoreVert();
            })
      ],
    );
  }

  void onClickMenu() {
    setState(() {});
  }

  void onClickShoppingCart() {
    setState(() {});
  }

  void onClickMoreVert() {
    setState(() {});
  }

  final List<String> clubs = <String>[
    'Chelsea',
    'Hanoi',
    'Barcelona',
    'Bayern',
    'Liverpool',
    'Real Madrid',
    'Paris',
    'Burnley'
  ];

  var logoExample =
      "https://cambodianfootball.com/upload/catalog/c/973/s_chelsea-football-club.png";
  final List<String> logos = <String>[
    'https://cambodianfootball.com/upload/catalog/c/973/s_chelsea-football-club.png',
    'https://upload.wikimedia.org/wikipedia/en/thumb/2/24/Hanoi_FC_logo.svg/800px-Hanoi_FC_logo.svg.png',
    'https://upload.wikimedia.org/wikipedia/vi/thumb/9/91/FC_Barcelona_logo.svg/1200px-FC_Barcelona_logo.svg.png',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1b/FC_Bayern_München_logo_%282017%29.svg/1200px-FC_Bayern_München_logo_%282017%29.svg.png',
    'https://upload.wikimedia.org/wikipedia/vi/thumb/0/0c/Liverpool_FC.svg/800px-Liverpool_FC.svg.png',
    'https://upload.wikimedia.org/wikipedia/vi/thumb/c/c7/Logo_Real_Madrid.svg/1200px-Logo_Real_Madrid.svg.png',
    'https://upload.wikimedia.org/wikipedia/vi/thumb/a/a7/Paris_Saint-Germain_F.C..svg/1200px-Paris_Saint-Germain_F.C..svg.png',
    'https://upload.wikimedia.org/wikipedia/vi/1/1a/Burnley_FC.png'
  ];

  Widget gridView() {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              crossAxisCount: 2,
            ),
            itemCount: 8,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Image.network(logoExample),
                      Container(
                        height: 60,
                        color: Colors.black87,
                        child: Row(
                          children: [
                            const Expanded(
                                flex: 1,
                                child: Icon(
                                  Icons.favorite_border,
                                  color: Colors.purple,
                                  size: 20,
                                )),
                            Expanded(
                              flex: 3,
                              child: Text(clubs[index],
                                  style: const TextStyle(color: Colors.white)),
                            ),
                            const Expanded(
                              flex: 1,
                              child: Icon(
                                Icons.shopping_cart,
                                color: Colors.purple,
                                size: 20,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                onTap: () {
                  pushToScreen2();
                },
              );
            }),
      ),
    );
  }
}

void pushToScreen2() {}
