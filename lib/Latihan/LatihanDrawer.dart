import 'package:flutter/material.dart';
// Import file halaman tujuan Anda di sini jika berbeda file, contoh:
// import 'latihan_circle_avatar.dart';
// import 'latihan_grid_view.dart';

class LatihanDrawer extends StatefulWidget {
  const LatihanDrawer({super.key});

  @override
  State<LatihanDrawer> createState() => _LatihanDrawerState();
}

class _LatihanDrawerState extends State<LatihanDrawer> {
  int _selectedIndex = 0;

  // Catatan: Sesuaikan judul dengan nama halaman yang akan dituju (Baris ke-17)
  final List<String> _titles = [
    'Halaman Circle Avatar',
    'Halaman Grid view',
  ];

  // Catatan: Sesuaikan isi halaman dengan nama class file yang dituju (Baris ke-19 s.d. 23)
  final List<Widget> _pages = [
    const LatihanCircleavatar(),
    const LatihanGridview(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_selectedIndex]),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu Navigasi Drawer',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text('Halaman Circle Avatar'),
              selected: _selectedIndex == 0,
              onTap: () {
                setState(() {
                  _selectedIndex = 0;
                });
                Navigator.pop(context); // Menutup drawer setelah diklik
              },
            ),
            ListTile(
              title: const Text('Halaman Grid view'),
              selected: _selectedIndex == 1,
              onTap: () {
                setState(() {
                  _selectedIndex = 1;
                });
                Navigator.pop(context); // Menutup drawer setelah diklik
              },
            ),
          ],
        ),
      ),
      body: _pages[_selectedIndex],
    );
  }
}

// Dummy class placeholder (pastikan diganti/diimport dari file aslinya)
class LatihanCircleavatar extends StatelessWidget {
  const LatihanCircleavatar({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Ini Halaman Circle Avatar'));
  }
}

class LatihanGridview extends StatelessWidget {
  const LatihanGridview({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Ini Halaman Grid View'));
  }
}