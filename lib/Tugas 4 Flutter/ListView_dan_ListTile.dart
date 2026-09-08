import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Tugas4Page(),
    debugShowCheckedModeBanner: false,
  ));
}

class Tugas4Page extends StatelessWidget {
  const Tugas4Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Laporan & Riwayat Udara'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Text(
            'Laporan Kondisi Udara',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          SizedBox(height: 12),

          TextField(
            decoration: InputDecoration(
              labelText: 'Titik Lokasi (Nama Jalan/Gedung)',
              prefixIcon: Icon(Icons.map_outlined),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            ),
          ),

          SizedBox(height: 12),

          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Skor AQI Teramati',
              prefixIcon: Icon(Icons.air),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            ),
          ),

          SizedBox(height: 12),

          TextField(
            decoration: InputDecoration(
              labelText: 'Nama Pelapor',
              prefixIcon: Icon(Icons.person_outline),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            ),
          ),

          SizedBox(height: 12),

          TextField(
            maxLines: 2,
            decoration: InputDecoration(
              labelText: 'Catatan Tambahan',
              prefixIcon: Icon(Icons.notes),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            ),
          ),

          SizedBox(height: 24),

          Text(
            'Riwayat Laporan Terakhir',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          SizedBox(height: 12),

          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.red,
              child: Icon(Icons.warning, color: Colors.white),
            ),
            title: Text('Jakarta Pusat'),
            subtitle: Text('AQI: 156 - Tidak Sehat. Dilaporkan 5 menit lalu.'),
            trailing: Icon(Icons.chevron_right),
          ),

          Divider(),

          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.orange,
              child: Icon(Icons.cloud, color: Colors.white),
            ),
            title: Text('Bandung Kota'),
            subtitle: Text('AQI: 95 - Sedang. Dilaporkan 30 menit lalu.'),
            trailing: Icon(Icons.chevron_right),
          ),

          Divider(),

          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.green,
              child: Icon(Icons.check_circle, color: Colors.white),
            ),
            title: Text('Yogyakarta'),
            subtitle: Text('AQI: 42 - Baik. Dilaporkan 1 jam lalu.'),
            trailing: Icon(Icons.chevron_right),
          ),

          Divider(),

          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.orange,
              child: Icon(Icons.cloud, color: Colors.white),
            ),
            title: Text('Semarang'),
            subtitle: Text('AQI: 120 - Sensitif. Dilaporkan 2 jam lalu.'),
            trailing: Icon(Icons.chevron_right),
          ),

          Divider(),
          
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.green,
              child: Icon(Icons.check_circle, color: Colors.white),
            ),
            title: Text('Surabaya'),
            subtitle: Text('AQI: 35 - Baik. Dilaporkan 3 jam lalu.'),
            trailing: Icon(Icons.chevron_right),
          ),
        ],
      ),
    );
  }
}