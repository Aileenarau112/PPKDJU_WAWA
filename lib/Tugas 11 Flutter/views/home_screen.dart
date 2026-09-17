import 'package:flutter/material.dart';
import 'package:ars_apps_dev/Tugas%2011%20Flutter/helpers/preference_handler.dart';
import 'package:ars_apps_dev/Tugas%2011%20Flutter/views/login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Halaman Beranda"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: "Keluar",
            onPressed: () async {
              // 1. Hapus status sesi
              await PreferenceHandler.clearUserSession();

              if (!context.mounted) return;

              // 2. Kembali ke halaman Login
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );

              // 3. Tampilkan SnackBar feedback visual
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Berhasil Logout"),
                  duration: Duration(seconds: 2),
                ),
              );
            },
          ),
        ],
      ),
      body: const Center(
        child: Text(
          "Selamat Datang di Beranda!\nSesi Anda Berhasil Dipertahankan.",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}