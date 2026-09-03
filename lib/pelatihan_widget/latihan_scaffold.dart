import 'package:flutter/material.dart';

class LatihanScaffold extends StatelessWidget {
const LatihanScaffold({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Belajar Scaffold'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
        Text(
          'Hallo, ini sebuah text yang dibungkus oleh widget column dan scaffold'
          )
        ],
      ),
    );
  }
}