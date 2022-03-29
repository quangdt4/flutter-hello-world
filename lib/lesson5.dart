/*
LESSON 5: LIST VIEW
  + Sliver app bar: kéo cả appBar xuống mở rộng hơn (tìm hiểu thêm) => custom scroll view
Navigation:
  - push: sang man hinh moi, pop: chuyen ve man cu
  - tim hieu "route" flutter
*/

import 'package:flutter/material.dart';
import 'package:helloworld/lesson3-exercise.dart';

import 'lesson4-exercise-2.dart';

void main() {
  runApp(const Lesson5App());
}

class Routes {
  static const String screen1 = "/screen1";
  static const String screen2 = "/screen2";
}

class Lesson5App extends StatelessWidget {
  const Lesson5App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      home: const Lesson5Homepage(),
        routes: {
          Routes.screen1: (context) => const Lesson5Homepage(),
          Routes.screen2: (context) => const Lesson4Exercise2(),
        }
    );
  }
}

class Lesson5Homepage extends StatefulWidget {
  const Lesson5Homepage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomepageState();
}

class _HomepageState extends State<Lesson5Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              // sliverAppBar()
              // listView1(),
              listViewWithOnClick(),
              scrollView(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: OverflowBar(
            overflowAlignment: OverflowBarAlignment.center,
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Text('pinned'),
                  Switch(
                    onChanged: (bool val) {
                      setState(() {
                        _pinned = val;
                      });
                    },
                    value: _pinned,
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Text('snap'),
                  Switch(
                    onChanged: (bool val) {
                      setState(() {
                        _snap = val;
                        // Snapping only applies when the app bar is floating.
                        _floating = _floating || _snap;
                      });
                    },
                    value: _snap,
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Text('floating'),
                  Switch(
                    onChanged: (bool val) {
                      setState(() {
                        _floating = val;
                        _snap = _snap && _floating;
                      });
                    },
                    value: _floating,
                  ),
                ],
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.screen2);
                  }, child: const Text("Scr2"))
            ],
          ),
        ),
      ),
    );
  }

  bool _pinned = true;
  bool _snap = false;
  bool _floating = false;

  Widget sliverAppBar() {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          pinned: _pinned,
          snap: _snap,
          floating: _floating,
          expandedHeight: 160.0,
          flexibleSpace: const FlexibleSpaceBar(
            title: Text('SliverAppBar'),
            background: FlutterLogo(),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 20,
            child: Center(
              child: Text('Scroll to see the SliverAppBar in effect.'),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                color: index.isOdd ? Colors.white : Colors.black12,
                height: 100.0,
                child: Center(
                  child: Text('$index', textScaleFactor: 5),
                ),
              );
            },
            childCount: 20,
          ),
        )
      ],
    );
  }

  Widget listViewExample() {
    final List<String> entries = <String>['A', 'B', 'C'];
    final List<int> colorCodes = <int>[600, 500, 100];

    return Flexible(
      flex: 1,
      child: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: entries.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 50,
              color: Colors.amber[colorCodes[index]],
              child: Center(child: Text('Entry ${entries[index]}')),
            );
          }),
    );
  }

  Widget listViewWithOnClick() {
    final List<String> entries = <String>[
      'A',
      'B',
      'C',
      'D',
      'E',
      'F',
      'G',
      'H'
    ];
    final List<int> colorCodes = <int>[600, 500, 400, 300, 200, 100, 50, 10];

    return Flexible(
      flex: 1,
      child: ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: entries.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child: Container(
              color: Colors.teal[colorCodes[index]],
              // child: Center(child: Text('Entry ${entries[index]}')),
              child: Center(
                  child: _tile(entries[index], colorCodes[index].toString(),
                      Icons.theaters)),
            ),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Text: ${entries[index]}")));
            },
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }

  Widget scrollView() {
    return CustomScrollView(
      shrinkWrap: true,
      slivers: <Widget>[
        SliverPadding(
          padding: const EdgeInsets.all(20.0),
          sliver: SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                const Text("I'm dedicating every day to you"),
                const Text('Domestic life was never quite my style'),
                const Text('When you smile, you knock me out, I fall apart'),
                const Text('And I thought I was so smart'),
              ],
            ),
          ),
        ),
      ],
    );
  }

  ListTile _tile(String title, String subtitle, IconData icon) {
    return ListTile(
      title: Text(title,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
          )),
      subtitle: Text(subtitle),
      leading: Icon(
        icon,
        color: Colors.blue[500],
      ),
      trailing: Icon(
        icon,
        color: Colors.blue[500],
      ),
      onTap: () {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Text: $title \n$subtitle")));
      },
    );
  }
}
