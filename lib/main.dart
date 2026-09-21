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

// Import tambahan dari home_page.dart
import 'package:ars_apps_dev/Tugas%2013%20Flutter/database_helper.dart';
import 'package:ars_apps_dev/Tugas%2013%20Flutter/form_page.dart';

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
      home: const HomePage(), // Diarahkan langsung ke HomePage atau ganti ke SplashScreen jika diperlukan
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> _dataList = [];
  bool _isLoading = true;

  // Fungsi untuk mengambil data terbaru dari database
  void _refreshData() async {
    final data = await DatabaseHelper.instance.readAllData();
    setState(() {
      _dataList = data;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _refreshData();
  }

  // Fungsi untuk Menghapus Data dengan Dialog Konfirmasi
  void _konfirmasiHapus(int id) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: const Text('Konfirmasi Hapus'),
          content: const Text('Apakah Anda yakin ingin menghapus data ini secara permanen?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context), // Batal
              child: const Text('Batal', style: TextStyle(color: Colors.grey)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              onPressed: () async {
                // Eksekusi hapus berdasarkan ID
                await DatabaseHelper.instance.deleteData(id);
                Navigator.pop(context); // Tutup dialog
                _refreshData(); // Segarkan tampilan list

                // Feedback visual sukses hapus
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Data berhasil dihapus dari database.'),
                    backgroundColor: Colors.redAccent,
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              },
              child: const Text('Ya, Hapus', style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manajemen Data SQFLite'),
        centerTitle: true,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _dataList.isEmpty
              ? const Center(
                  child: Text(
                    'Belum ada data tersimpan.\nSilakan tekan tombol + di bawah.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                )
              : ListView.builder(
                  itemCount: _dataList.length,
                  itemBuilder: (context, index) {
                    final item = _dataList[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(16),
                        title: Text(
                          item['judul'],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(item['deskripsi']),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Tombol Edit
                            IconButton(
                              icon: const Icon(Icons.edit_rounded, color: Colors.indigo),
                              onPressed: () async {
                                final result = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => FormPage(itemData: item),
                                  ),
                                );
                                if (result == true) {
                                  _refreshData();
                                }
                              },
                            ),
                            // Tombol Hapus
                            IconButton(
                              icon: const Icon(Icons.delete_outline_rounded, color: Colors.redAccent),
                              onPressed: () => _konfirmasiHapus(item['id']),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const FormPage(),
            ),
          );
          if (result == true) {
            _refreshData();
          }
        },
        icon: const Icon(Icons.add),
        label: const Text('Tambah Data'),
      ),
    );
  }
}