import 'package:flutter/material.dart';
import '../models/data_registran.dart';
import '../services/penyimpanan_lokal.dart';
import 'halaman_formulir.dart';

class HalamanDaftarWarga extends StatelessWidget {
  const HalamanDaftarWarga({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Warga Terdaftar'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HalamanFormulir()),
          ),
        ),
      ),
      body: FutureBuilder<List<DataRegistran>>(
        future: PenyimpananLokal().ambilSemuaData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Terjadi kesalahan: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Belum ada data pendaftaran tersimpan.'));
          }

          final daftarWarga = snapshot.data!;

          return ListView.builder(
            itemCount: daftarWarga.length,
            itemBuilder: (context, index) {
              final warga = daftarWarga[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: ListTile(
                  title: Text(warga.namaLengkap, style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text('${warga.email} • ${warga.nomorPonsel}\nKota: ${warga.kotaAsal}'),
                  isThreeLine: true,
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HalamanFormulir()),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}