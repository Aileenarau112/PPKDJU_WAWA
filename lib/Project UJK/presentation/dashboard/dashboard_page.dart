import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:geolocator/geolocator.dart';

import '../../data/services/absen_service.dart';
import '../../data/local/local_storage.dart';

import '../history/history_page.dart';
import '../profile/profile_page.dart';

import '../../data/services/statistic_service.dart';

class DashboardPage extends StatefulWidget {
  final Map<String, dynamic> user;

  const DashboardPage({super.key, required this.user});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    loadStatistic();
  }

  Map<String, dynamic> statistic = {"total": 0, "hadir": 0, "izin": 0};

  // =========================
  // ABSEN MASUK
  // =========================

  Future<void> absenMasuk() async {
    setState(() {
      isLoading = true;
    });

    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

      if (!serviceEnabled) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("GPS belum aktif")));

        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }

      if (permission == LocationPermission.deniedForever) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Izin lokasi ditolak")));

        return;
      }

      Position position = await Geolocator.getCurrentPosition();

      final result = await AbsenService().checkIn(
        latitude: position.latitude,

        longitude: position.longitude,
      );

      if (!mounted) return;

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(result["message"] ?? "Selesai")));
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Error : $e")));
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  // =========================
  // ABSEN PULANG
  // =========================

  Future<void> absenPulang() async {
    setState(() {
      isLoading = true;
    });

    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

      if (!serviceEnabled) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("GPS belum aktif")));

        return;
      }

      Position position = await Geolocator.getCurrentPosition();

      final result = await AbsenService().checkOut(
        latitude: position.latitude,

        longitude: position.longitude,
      );

      if (!mounted) return;

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(result["message"] ?? "Selesai")));
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Error : $e")));
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  // =========================
  // LOGOUT
  // =========================

  Future<void> logout() async {
    await LocalStorage.removeToken();

    if (!mounted) return;

    Navigator.pushNamedAndRemoveUntil(context, "/login", (route) => false);
  }

  Future<void> loadStatistic() async {
    final data = await StatisticService().getStatistic();

    setState(() {
      statistic = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    final tanggal = DateFormat("dd MMMM yyyy").format(DateTime.now());

    return Scaffold(
      appBar: AppBar(title: const Text("Dashboard Absensi")),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text(
              "Halo, ${widget.user["name"] ?? "User"} 👋",

              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            Text(tanggal, style: const TextStyle(fontSize: 16)),

            const SizedBox(height: 40),

            const Text(
              "Absensi Hari Ini",

              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(15),

                    child: Column(
                      children: [
                        const Text("Total"),

                        Text(
                          "${statistic["total"]}",

                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(15),

                    child: Column(
                      children: [
                        const Text("Hadir"),

                        Text(
                          "${statistic["hadir"]}",

                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(15),

                    child: Column(
                      children: [
                        const Text("Izin"),

                        Text(
                          "${statistic["izin"]}",

                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,

              child: ElevatedButton(
                onPressed: isLoading ? null : absenMasuk,

                child: const Text("ABSEN MASUK"),
              ),
            ),

            const SizedBox(height: 15),

            SizedBox(
              width: double.infinity,

              child: ElevatedButton(
                onPressed: isLoading ? null : absenPulang,

                child: const Text("ABSEN PULANG"),
              ),
            ),

            const SizedBox(height: 15),

            SizedBox(
              width: double.infinity,

              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,

                    MaterialPageRoute(
                      builder: (context) => const HistoryPage(),
                    ),
                  );
                },

                child: const Text("RIWAYAT ABSEN"),
              ),
            ),

            const SizedBox(height: 15),

            SizedBox(
              width: double.infinity,

              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,

                    MaterialPageRoute(
                      builder: (context) => const ProfilePage(),
                    ),
                  );
                },

                child: const Text("PROFILE"),
              ),
            ),

            const SizedBox(height: 15),

            SizedBox(
              width: double.infinity,

              child: ElevatedButton(
                onPressed: logout,

                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),

                child: const Text("LOGOUT"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
