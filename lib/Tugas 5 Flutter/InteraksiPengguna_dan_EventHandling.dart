import 'package:flutter/material.dart';

class InteraksiPenggunaDanEventHandling extends StatefulWidget {
  InteraksiPenggunaDanEventHandling({Key? key}) : super(key: key);

  @override
  State<InteraksiPenggunaDanEventHandling> createState() =>
      _InteraksiPenggunaDanEventHandlingState();
}

class _InteraksiPenggunaDanEventHandlingState
    extends State<InteraksiPenggunaDanEventHandling> {
      bool _showSecretText = false;
      bool _isLiked = false;
      bool _showDescription = false;
      String _inkWellStatus = "";
      int _counter = 0;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Interaksi Flutter', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(24.0),
        child: Column(
          children: [
            Text('Ini Tentang ElevatedButton;', style: TextStyle(color: Colors.grey)),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _showSecretText = !_showSecretText;
                });
              }, child: Text('Klik Saya!'),
            ),

            if (_showSecretText) Text('Halo, Saya Developer!', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),

            SizedBox(height: 20),

            Text('Ini Tentang IconButton', style: TextStyle(color: Colors.grey)),
            IconButton(
              iconSize: 40, 
              icon: Icon(
                _isLiked ? Icons.favorite : Icons.favorite_border, 
                color: _isLiked ? Colors.red : Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  _isLiked = !_isLiked;
                });
              },
            ),

            Text(_isLiked ? 'Disukai' : 'Belum Disukai'),

            SizedBox(height: 20),

            Text('Ini Tentang TextButton:', style: TextStyle(color: Colors.grey)),
            TextButton(
              onPressed: () {
                setState(() {
                  _showDescription = !_showDescription;
                });
            }, 
            
            child: Text(_showDescription ? 'Sembunyikan Deskripsi' : 'Lihat Deskripsi'),
          ),

          if (_showDescription) Text('Ini adalah deskripsi tambahan yang sebelumnya tersembunyi.', textAlign: TextAlign.center),

          SizedBox(height: 20),

          Text('Ini Tentang InkWell:', style: TextStyle(color: Colors.grey)),
          Material(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(12),
            child: InkWell(
              onTap: () {
                print('Sentuhan Terdeteksi:');
                setState(() {
                  _inkWellStatus = "Sentuhan Terdeteksi!";
                });
              },

              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 24),
                alignment: Alignment.center,
                child: Text('Sentuh Kotak Ini', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ),
          ),

          if (_inkWellStatus.isNotEmpty) Text(_inkWellStatus),

          SizedBox(height: 20),

          Text('Ini Tentang GestureDetectore:', style: TextStyle(color: Colors.grey)),
          GestureDetector(
            onTap: () => setState(() { _counter += 1; print('Ditekan Sekali'); }),
            onDoubleTap: () => setState(() { _counter += 2; print('Ditekan Dua Kali'); }),
            onLongPress: () => setState(() { _counter += 3; print('Tahan Lama'); }),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 24),
              decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(30)),
              alignment: Alignment.center,
              child: Text('Angka: $_counter', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          ),

          SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('• Tap = +1\n• Double Tap = +2\n• Long Press = +3'),
              FloatingActionButton.small(
                onPressed: () => setState(() => _counter--),
                child: Icon(Icons.remove),
              ),
            ],
          )
          ],
        ),
      ),
    );
  }
}