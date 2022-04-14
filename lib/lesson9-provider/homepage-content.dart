import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controller.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  BuildContext? dialogContext;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'You have pushed the button this many times:',
          ),
          Selector<HomeController, int>(
            builder: (_, count, __) {
              return Text(
                '$count',
                style: Theme.of(context).textTheme.headline4,
              );
            },
            selector: (_, controller) => controller.homeState.count,
          ),
          Selector<HomeController, bool>(
            builder: (ctx, doing, __) {
              if (doing) {
                _showMaterialDialog(ctx);
              } else {
                _hideDialog();
              }
              return const SizedBox();
            },
            selector: (_, controller) => controller.homeState.doing,
          ),
          InkWell(
            child: Selector<HomeController, bool>(
              selector: (_, controller) => controller.homeState.isOdd,
              builder: (_, isOdd, __) {
                return Container(
                  color: isOdd ? Colors.yellow : Colors.blue,
                  width: 50,
                  height: 50,
                );
              },
            ),
            onTap: () {
              context.read<HomeController>().colorClicked();
            },
          ),
        ],
      ),
    );
  }

  void _showMaterialDialog(BuildContext context) {
    Future.microtask(
      () {
        showDialog(
          context: context,
          builder: (ctx) {
            dialogContext = ctx;
            return const AlertDialog(
              title: Text('Material Dialog'),
              content: Center(
                child: CircularProgressIndicator(),
              ),
              actions: <Widget>[],
            );
          },
        );
      },
    );
  }

  void _hideDialog() {
    if (dialogContext != null) {
      Navigator.of(dialogContext!).pop();
    }
    dialogContext = null;
  }
}
