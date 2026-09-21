// import 'package:ars_apps_dev/Tugas%202%20tteFlur/Implementasi_Layout%20_Profil_Kompleks.dart';
// import 'package:ars_apps_dev/Tugas%205%20Flutter/InteraksiPengguna_dan_EventHandling.dart';
import 'package:ars_apps_dev/Tugas%2012%20Flutter/Implementasi%20Database%20Lokal%20dengan%20SQFLite/pages/halaman_daftar_warga.dart';
import 'package:ars_apps_dev/Tugas%2012%20Flutter/Implementasi%20Database%20Lokal%20dengan%20SQFLite/pages/halaman_formulir.dart';
import 'package:ars_apps_dev/Tugas%2013%20Flutter/form_page.dart';
import 'package:flutter/material.dart';
import 'package:ars_apps_dev/Tugas%204%20Flutter/ListView_dan_ListTile.dart';

// Import Splash Screen yang benar untuk Tugas 11

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const Myapps());
}

class Myapps extends StatelessWidget {
  const Myapps({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas Sesi Pengguna',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: FormPage(),
    );
  }
}