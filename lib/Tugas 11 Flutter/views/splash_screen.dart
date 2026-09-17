import 'package:flutter/material.dart';
import 'package:ars_apps_dev/Tugas%2011%20Flutter/helpers/preference_handler.dart';
import 'package:ars_apps_dev/Tugas%2011%20Flutter/views/login_screen.dart';
import 'package:ars_apps_dev/Tugas%2011%20Flutter/views/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkSessionAndNavigate();
  }

  Future<void> _checkSessionAndNavigate() async {
    // Jeda waktu 2 detik untuk efek splash screen
    await Future.delayed(const Duration(seconds: 2));

    // Cek status sesi dari SharedPreferences
    bool isLogged = await PreferenceHandler.checkUserSession();

    if (!mounted) return;

    // Routing dinamis
    if (isLogged) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.lock_person_rounded, size: 80, color: Colors.teal),
            SizedBox(height: 20),
            Text("Memuat Sesi Pengguna...", style: TextStyle(fontSize: 16)),
            SizedBox(height: 16),
            CircularProgressIndicator(color: Colors.teal),
          ],
        ),
      ),
    );
  }
}