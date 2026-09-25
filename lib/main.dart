import 'package:ars_apps_dev/Project UJK/presentation/splash/splash_page.dart';
import 'package:ars_apps_dev/API/views/post_list_views.dart';
import 'package:ars_apps_dev/Project%20UJK/presentation/auth/login_page.dart';
import 'package:ars_apps_dev/Project%20UJK/presentation/splash/splash_page.dart';

import 'package:ars_apps_dev/Tugas%2011%20Flutter/helper/preference_handler.dart';
import 'package:ars_apps_dev/Tugas%2011%20Flutter/views/splash_screen.dart';

import 'package:ars_apps_dev/Tugas%2012%20Flutter/Implementasi%20Database%20Lokal%20dengan%20SQFLite/pages/halaman_daftar_warga.dart';
import 'package:ars_apps_dev/Tugas%2012%20Flutter/Implementasi%20Database%20Lokal%20dengan%20SQFLite/pages/halaman_formulir.dart';

import 'package:ars_apps_dev/Tugas%2013%20Flutter/database_helper.dart';
import 'package:ars_apps_dev/Tugas%2013%20Flutter/form_page.dart';

import 'package:ars_apps_dev/Tugas%2014%20Flutter/shop_lite/pages/homeshop_page.dart';
import 'package:ars_apps_dev/Tugas%2014%20Flutter/shop_lite/widgets/productshop_card.dart';

import 'package:ars_apps_dev/pages/loginScreen.dart';

import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const Myapps());
}

class Myapps extends StatelessWidget {
  const Myapps({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Absensi PPKD',

      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),

        useMaterial3: true,
      ),

      routes: {"/login": (context) => const LoginPage()},

      home: const SplashPage(),
    );
  }
}
