import 'package:flutter/material.dart';

import '../../data/services/history_service.dart';

import 'map_page.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  List<dynamic> history = [];

  bool loading = true;

  @override
  void initState() {
    super.initState();

    loadHistory();
  }

  Future<void> loadHistory() async {
    final data = await HistoryService().getHistory();

    setState(() {
      history = data;

      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Riwayat Absensi")),

      body: loading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              padding: const EdgeInsets.all(20),

              itemCount: history.length,

              itemBuilder: (context, index) {
                final item = history[index];

                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(15),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Text(
                          "Tanggal: ${item["check_in"]}",

                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),

                        const SizedBox(height: 10),

                        Text("Jam Masuk : ${item["check_in"] ?? "-"}"),

                        Text("Jam Pulang : ${item["check_out"] ?? "-"}"),

                        Text("Lokasi : ${item["check_in_address"] ?? "-"}"),

                        const SizedBox(height: 10),

                        ElevatedButton(
                          onPressed: () {
                            final lokasi = item["check_in_location"].split(",");

                            Navigator.push(
                              context,

                              MaterialPageRoute(
                                builder: (context) => MapPage(
                                  latitude: double.parse(lokasi[0]),

                                  longitude: double.parse(lokasi[1]),
                                ),
                              ),
                            );
                          },

                          child: const Text("Lihat Lokasi"),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
