import 'package:flutter/material.dart';
import '../models/data_registran.dart';
import '../services/penyimpanan_lokal.dart';
import 'halaman_daftar_warga.dart';

class HalamanFormulir extends StatefulWidget {
  const HalamanFormulir({super.key});

  @override
  State<HalamanFormulir> createState() => _HalamanFormulirState();
}

class _HalamanFormulirState extends State<HalamanFormulir> {
  final _formKey = GlobalKey<FormState>();
  
  // Controller unik untuk setiap input
  final _ctrlNama = TextEditingController();
  final _ctrlEmail = TextEditingController();
  final _ctrlHp = TextEditingController();
  final _ctrlPassword = TextEditingController();
  final _ctrlKota = TextEditingController();

  void _prosesSimpan() async {
    if (_formKey.currentState!.validate()) {
      final dataBaru = DataRegistran(
        namaLengkap: _ctrlNama.text,
        email: _ctrlEmail.text,
        nomorPonsel: _ctrlHp.text,
        kataSandi: _ctrlPassword.text,
        kotaAsal: _ctrlKota.text,
      );

      await PenyimpananLokal().simpanRegistrasi(dataBaru);

      // Reset form
      _formKey.currentState!.reset();
      _ctrlNama.clear();
      _ctrlEmail.clear();
      _ctrlHp.clear();
      _ctrlPassword.clear();
      _ctrlKota.clear();

      // Pindah ke halaman list atau tampilkan notifikasi
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Data berhasil disimpan ke database lokal!')),
      );

      // Refresh halaman dengan navigasi ke halaman list
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HalamanDaftarWarga()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Form Pendaftaran Lokal')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _ctrlNama,
                decoration: const InputDecoration(labelText: 'Nama Lengkap'),
                validator: (val) => val!.isEmpty ? 'Nama wajib diisi' : null,
              ),
              TextFormField(
                controller: _ctrlEmail,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (val) => !val!.contains('@') ? 'Format email salah' : null,
              ),
              TextFormField(
                controller: _ctrlHp,
                decoration: const InputDecoration(labelText: 'Nomor HP'),
                keyboardType: TextInputType.phone,
                validator: (val) => val!.length < 10 ? 'Nomor HP minimal 10 digit' : null,
              ),
              TextFormField(
                controller: _ctrlPassword,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (val) => val!.length < 6 ? 'Password minimal 6 karakter' : null,
              ),
              TextFormField(
                controller: _ctrlKota,
                decoration: const InputDecoration(labelText: 'Asal Kota'),
                validator: (val) => val!.isEmpty ? 'Asal kota wajib diisi' : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _prosesSimpan,
                child: const Text('Daftar & Simpan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}