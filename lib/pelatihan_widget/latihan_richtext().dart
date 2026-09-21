import 'package:flutter/material.dart';

class LatihanRichtext extends StatelessWidget {
const LatihanRichtext({ super.key });

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Belajar Richtext'),
        backgroundColor: Colors.yellow,
      ),
      body: RichText(
        text: TextSpan(
          // Gaya text default untuk seluruh paragraf
          style: const TextStyle(color: Colors.black, fontSize: 18),
          children: <TextSpan>[
            const TextSpan(text: 'Belajar'),
            TextSpan(
              text: 'Flutter',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blue[700],
                // Membuat kata 'Flutter' jadi tebal dan biru
              ),
            ),
            const TextSpan(text: 'itu'),
            const TextSpan(
              text: 'Mudah!',
              style: TextStyle(
                fontStyle: FontStyle.italic,
                color: Colors.green
                // Membuat kata 'Mudah! jadi miring dan hijau
              ),
            ),
          ],
        ),
      ),
    );
  }
}