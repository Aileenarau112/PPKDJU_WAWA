import 'package:flutter/material.dart';
// import 'package:ars_apps_dev/Tugas%201%20Dart%20Fundamental/Digital_Biodata_Sederhana.dart';
// import 'package:ars_apps_dev/Tugas%202%20Flutter/Implementasi_Layout%20_Profil_Kompleks.dart';
// import 'package:ars_apps_dev/Tugas%201%20Flutter/Case_HalamanProfilSederhana.dart';
// import 'package:ars_apps_dev/Tugas%201%20Flutter/Tugas_Layouting.dart';
// import 'package:ars_apps_dev/Tugas%203%20Flutter/FormInput_dan_PenataanGrid.dart';
// import 'package:ars_apps_dev/Tugas%204%20Flutter/ListView_dan_ListTile.dart';
// import 'package:ars_apps_dev/Tugas%205%20Flutter/InteraksiPengguna_dan_EventHandling.dart';
// import 'package:ars_apps_dev/pelatihan_widget/latihan_ScorollingLayout.dart';
// import 'package:ars_apps_dev/pelatihan_widget/latihan_circle_avatar.dart';
// import 'package:ars_apps_dev/pelatihan_widget/latihan_column.dart';
// import 'package:ars_apps_dev/pelatihan_widget/latihan_icon().dart';
// import 'package:ars_apps_dev/pelatihan_widget/latihan_richtext().dart';
// import 'package:ars_apps_dev/pelatihan_widget/latihan_row.dart';
// import 'package:ars_apps_dev/pelatihan_widget/latihan_scaffold.dart';
import 'package:ars_apps_dev/pages/Login_Screen.dart';

void main() {
  runApp(const Myapps());
}

class Myapps extends StatelessWidget {
  const Myapps({super.key});

  // This widget is the root of your appslication.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: loginScreen());
    }
  }

