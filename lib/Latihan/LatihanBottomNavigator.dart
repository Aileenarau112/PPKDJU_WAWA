import 'package:flutter/material.dart';

class LatihanBottomNavigator extends StatefulWidget {
  const LatihanBottomNavigator({super.key});

  @override
  State<LatihanBottomNavigator> createState() => _LatihanBottomNavigatorState();
}

class _LatihanBottomNavigatorState extends State<LatihanBottomNavigator> {
  int _currentIndex = 0;

  // Daftar halaman yang akan ditampilkan sesuai dengan tab yang dipilih
  final List<Widget> _pages = [
    const Center(child: Text('Halaman Beranda 1', style: TextStyle(fontSize: 24))),
    const Center(child: Text('Halaman Cari', style: TextStyle(fontSize: 24))),
    const Center(child: Text('Halaman Profil', style: TextStyle(fontSize: 24))),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Mengatur warna latar belakang AppBar menjadi kuning
      appBar: AppBar(
        title: const Text('Latihan Bottom Navigator'),
        backgroundColor: Colors.yellow,
      ),
      // Menampilkan halaman sesuai dengan indeks yang dipilih
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        // Daftar item pada BottomNavigationBar
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Cari',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        // Mengatur indeks item yang sedang aktif
        currentIndex: _currentIndex,
        // Mengatur warna item yang aktif menjadi ungu
        selectedItemColor: Colors.purple,
        // Mengatur warna item yang tidak aktif menjadi abu-abu
        unselectedItemColor: Colors.grey,
        // Fungsi yang dipanggil ketika item diklik
        onTap: _onItemTapped,
        // Menampilkan label teks untuk semua item, baik yang dipilih maupun tidak
        showSelectedLabels: true,
        showUnselectedLabels: true,
        // Mengatur jenis BottomNavigationBar menjadi 'fixed' agar item tidak bergeser
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}