import 'package:flutter/material.dart';

class CaseHalamanProfilSederhana extends StatelessWidget {

  const CaseHalamanProfilSederhana({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text('Profil Saya'),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            CircleAvatar(
              radius: 100,
              backgroundColor: Colors.blue,
              child: CircleAvatar(
                radius: 90,
                backgroundImage: AssetImage(
                  'assets/images/hallo.jpeg',
                ),
              ),
            ),

            SizedBox(height: 20),

            Text(
              'Syalwa Khusnulkhotimah Suhartono',
              style: TextStyle(
                fontSize: 24,
              ),
            ),

            SizedBox(height: 15),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.location_on),
                SizedBox(width: 5),
                Text('Jakarta'),
              ],
            ),

            SizedBox(height: 15),

            Text(
              'Mahasiswa yang sedang belajar Flutter.',
            ),

          ],
        ),
      ),

    );
  }
}