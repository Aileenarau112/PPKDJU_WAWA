import 'package:flutter/material.dart';
import 'package:ww_ppkd_app_dev/Tugas%201%20Dart%20Fundamental/Digital_Biodata_Sederhana.dart';
import 'package:ww_ppkd_app_dev/Tugas%202%20Flutter/Implementasi_Layout%20_Profil_Kompleks.dart';
import 'package:ww_ppkd_app_dev/Tugas%201%20Flutter/Case_HalamanProfilSederhana.dart';
import 'package:ww_ppkd_app_dev/Tugas%201%20Flutter/Tugas_Layouting.dart';
import 'package:ww_ppkd_app_dev/Tugas%203%20Flutter/FormInput_dan_PenataanGrid.dart';
import 'package:ww_ppkd_app_dev/Tugas%204%20Flutter/ListView_dan_ListTile.dart';
import 'package:ww_ppkd_app_dev/Tugas%205%20Flutter/InteraksiPengguna_dan_EventHandling.dart';
import 'package:ww_ppkd_app_dev/pelatihan_widget/latihan_ScorollingLayout.dart';
import 'package:ww_ppkd_app_dev/pelatihan_widget/latihan_circle_avatar.dart';
import 'package:ww_ppkd_app_dev/pelatihan_widget/latihan_column.dart';
import 'package:ww_ppkd_app_dev/pelatihan_widget/latihan_icon().dart';
import 'package:ww_ppkd_app_dev/pelatihan_widget/latihan_richtext().dart';
import 'package:ww_ppkd_app_dev/pelatihan_widget/latihan_row.dart';
import 'package:ww_ppkd_app_dev/pelatihan_widget/latihan_scaffold.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: InteraksiPenggunaDanEventHandling(),
    );
  }
}

