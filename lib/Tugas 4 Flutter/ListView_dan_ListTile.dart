import 'package:flutter/material.dart';

class OptimalisasiDaftarDenganListViewDanListTile extends StatelessWidget {
  const OptimalisasiDaftarDenganListViewDanListTile({super.key});

  static const List<Map<String, String>> _kota = [
    {
      'nama': 'Jakarta',
      'subtitle': 'DKI Jakarta',
      'gambar': 'assets/images/DKI_JAKARTA.jpg',
    },
    {
      'nama': 'Bandung',
      'subtitle': 'Jawa Barat',
      'gambar': 'assets/images/BANDUNG.jpg',
    },
    {
      'nama': 'Yogyakarta',
      'subtitle': 'DI Yogyakarta',
      'gambar': 'assets/images/YOGYAKARTA.jpg',
    },
    {
      'nama': 'Surabaya',
      'subtitle': 'Jawa Timur',
      'gambar': 'assets/images/SURABAYA.jpg',
    },
    {
      'nama': 'Medan',
      'subtitle': 'Sumatera Utara',
      'gambar': 'assets/images/MEDAN.jpg',
    },
    {
      'nama': 'Bogor',
      'subtitle': 'Jawa Barat',
      'gambar': 'assets/images/BOGOR.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Kota'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: _kota.length,
        itemBuilder: (context, index) {
          final item = _kota[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(item['gambar']!),
            ),
            title: Text(item['nama']!),
            subtitle: Text(item['subtitle']!),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Memilih ${item['nama']}')),
              );
            },
          );
        },
      ),
    );
  }
}
