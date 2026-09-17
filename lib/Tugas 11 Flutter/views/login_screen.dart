import 'package:flutter/material.dart';
import 'package:ars_apps_dev/Tugas%2011%20Flutter/helpers/preference_handler.dart';
import 'package:ars_apps_dev/Tugas%2011%20Flutter/views/home_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Halaman Login")),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal,
              foregroundColor: Colors.white,
              minimumSize: const Size.fromHeight(50),
            ),
            onPressed: () async {
              // Simpan status login menjadi true
              await PreferenceHandler.saveUserSession(true);

              if (!context.mounted) return;

              // Pindah ke Home dan hapus riwayat ke Login
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              );
            },
            child: const Text("Masuk", style: TextStyle(fontSize: 16)),
          ),
        ),
      ),
    );
  }
}