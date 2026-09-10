import 'package:flutter/material.dart';

class LatihanScrollingLayout extends StatelessWidget {
const LatihanScrollingLayout({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Latihan SingleChildScrollView'),
        backgroundColor: Colors.amber,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Text('Latihan SingleChildScrollView'),
            SizedBox(height: 800),
            Text('Text ini akan overflow di emulator'),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
      