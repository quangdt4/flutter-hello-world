import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingHomePage extends StatelessWidget {
  const LoadingHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
