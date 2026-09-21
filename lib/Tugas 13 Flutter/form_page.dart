import 'package:flutter/material.dart';
import 'database_helper.dart';

class FormPage extends StatefulWidget {
  // Variabel opsional untuk menampung data lama saat mode Edit
  final Map<String, dynamic>? itemData;

  const FormPage({Key? key, this.itemData}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _judulController;
  late TextEditingController _deskripsiController;

  @override
  void initState() {
    super.initState();
    // Cek apakah ada data yang dikirim (Mode Edit) atau kosong (Mode Tambah)
    _judulController = TextEditingController(
      text: widget.itemData != null ? widget.itemData!['judul'] : '',
    );
    _deskripsiController = TextEditingController(
      text: widget.itemData != null ? widget.itemData!['deskripsi'] : '',
    );
  }

  @override
  void dispose() {
    _judulController.dispose();
    _deskripsiController.dispose();
    super.dispose();
  }

  // Fungsi simpan dinamis (Insert vs Update)
  void _simpanKeDatabase() async {
    if (_formKey.currentState!.validate()) {
      if (widget.itemData == null) {
        // Logika TAMBAH DATA BARU
        await DatabaseHelper.instance.insertData({
          'judul': _judulController.text,
          'deskripsi': _deskripsiController.text,
        });
      } else {
        // Logika UPDATE DATA (Menggunakan ID yang sudah ada)
        await DatabaseHelper.instance.updateData({
          'id': widget.itemData!['id'],
          'judul': _judulController.text,
          'deskripsi': _deskripsiController.text,
        });
      }

      // Kembali ke halaman utama dan berikan sinyal 'true' bahwa data berubah
      Navigator.pop(context, true);

      // Feedback visual yang elegan
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            widget.itemData == null
                ? "Yeay, data baru berhasil ditambahkan!"
                : "Perubahan data berhasil disimpan!",
          ),
          backgroundColor: Colors.indigo,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isEdit = widget.itemData != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEdit ? 'Edit Catatan' : 'Tambah Catatan Baru'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _judulController,
                decoration: InputDecoration(
                  labelText: 'Judul Tugas',
                  prefixIcon: const Icon(Icons.title),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Judul tidak boleh kosong' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _deskripsiController,
                maxLines: 4,
                decoration: InputDecoration(
                  labelText: 'Deskripsi / Detail',
                  prefixIcon: const Icon(Icons.description),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Deskripsi tidak boleh kosong' : null,
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: _simpanKeDatabase,
                  icon: Icon(isEdit ? Icons.update : Icons.save),
                  label: Text(
                    isEdit ? 'Perbarui Data' : 'Simpan Data',
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}