import 'package:flutter/material.dart';

class Screen3 extends StatelessWidget {
  var _initialData;

  Screen3(this._initialData);

  @override
  Widget build(BuildContext context) {
    var data;
    if (_initialData != '') {
      data = _initialData;
    } else {
      data = ModalRoute.of(context)?.settings.arguments;
    }

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen 3'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(data),
              ElevatedButton(
                  onPressed: () {
                    var resultData = 'data from screen 3';
                    Navigator.pop(context, resultData);
                  },
                  child: Text('Back to previous Screen'))
            ],
          ),
        ),
      ),
    );
  }
}