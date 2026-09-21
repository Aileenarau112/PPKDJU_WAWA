import 'package:ars_apps_dev/Latihan/LatihanBottomNavigator.dart';
import 'package:ars_apps_dev/Latihan/LatihanDrawer.dart';
import 'package:ars_apps_dev/Tugas%2012%20Flutter/Implementasi%20Database%20Lokal%20dengan%20SQFLite/pages/halaman_formulir.dart';
import 'package:ars_apps_dev/Tugas%202%20Flutter/Implementasi_Layout%20_Profil_Kompleks.dart';
import 'package:ars_apps_dev/Tugas%205%20Flutter/InteraksiPengguna_dan_EventHandling.dart';
import 'package:ars_apps_dev/Tugas%207%20Flutter/FormInputInteraktif_dengan_NavigasiDrawer.dart';
import 'package:ars_apps_dev/Tugas%208%20Flutter/NavigasiBawah_dengan_BottomNavigationBar.dart';
import 'package:ars_apps_dev/Tugas%209%20Flutter/MenampilkanDaftarKategori_dengan_ListViewBuilder.dart';
import 'package:ars_apps_dev/Tugas%2010%20Flutter/FormulirPendaftaranAplikasi.dart';
import 'package:flutter/material.dart';
import 'package:ars_apps_dev/Tugas%201%20Dart%20Fundamental/Digital_Biodata_Sederhana.dart';
import 'package:ars_apps_dev/Tugas%201%20Flutter/Case_HalamanProfilSederhana.dart';
import 'package:ars_apps_dev/Tugas%201%20Flutter/Tugas_Layouting.dart';
import 'package:ars_apps_dev/Tugas%203%20Flutter/FormInput_dan_PenataanGrid.dart';
import 'package:ars_apps_dev/Tugas%204%20Flutter/ListView_dan_ListTile.dart';
import 'package:ars_apps_dev/pelatihan_widget/latihan_ScorollingLayout.dart';
import 'package:ars_apps_dev/pelatihan_widget/latihan_circle_avatar.dart';
import 'package:ars_apps_dev/pelatihan_widget/latihan_column.dart';
import 'package:ars_apps_dev/pelatihan_widget/latihan_icon().dart';
import 'package:ars_apps_dev/pelatihan_widget/latihan_richtext().dart';
import 'package:ars_apps_dev/pelatihan_widget/latihan_row.dart';
import 'package:ars_apps_dev/pelatihan_widget/latihan_scaffold.dart';

// Import Splash Screen yang benar untuk Tugas 11
import 'package:ars_apps_dev/Tugas%2011%20Flutter/views/splash_screen.dart'; 

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
      home: const SplashScreen(),
    );
  }
}