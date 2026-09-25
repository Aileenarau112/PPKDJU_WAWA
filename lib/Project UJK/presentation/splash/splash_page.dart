import 'package:flutter/material.dart';

import '../../data/local/local_storage.dart';

import '../auth/login_page.dart';

import '../dashboard/dashboard_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    checkLogin();
  }

  Future<void> checkLogin() async {
    final token = await LocalStorage.getToken();

    await Future.delayed(const Duration(seconds: 1));

    if (!mounted) return;

    if (token != null) {
      Navigator.pushReplacement(
        context,

        MaterialPageRoute(builder: (context) => DashboardPage(user: {})),
      );
    } else {
      Navigator.pushReplacement(
        context,

        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "ABSENSI PPKD",

          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
