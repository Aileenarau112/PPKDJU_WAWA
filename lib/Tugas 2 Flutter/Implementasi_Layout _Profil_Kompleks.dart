import 'package:flutter/material.dart';

class ImplementasiLayoutProfilKompleks extends StatelessWidget {
const ImplementasiLayoutProfilKompleks({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: const Color(0xFFFAF6F0),
      appBar: AppBar(
        title: Text(
          'Detail Merchant',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
          
        centerTitle: true,
        backgroundColor: const Color(0xFFB5838D),
        elevation: 0,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [

            SizedBox(height: 24),

            Center(
              child: Column(
                children: [
                  Text(
                    '🎀 MEMOIRE',
                    style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4A2E35),
                    ),
                  ),
                  
                  SizedBox(height: 28),
                  Text(
                    '"A little booth for your little moments."',
                    style: TextStyle(
                      fontSize: 14,
                      fontStyle: FontStyle.italic,
                      color: Color(0xFFB5838D),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 24),

          ],
        ),
      ),
    );
  }
}