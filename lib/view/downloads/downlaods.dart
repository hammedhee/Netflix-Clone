import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Downlaods extends StatelessWidget {
  const Downlaods({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Downlaods',
            style: TextStyle(fontSize: 30),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Text('No downloads'),
        ));
  }
}
