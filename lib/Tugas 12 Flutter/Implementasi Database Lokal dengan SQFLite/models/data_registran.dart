class DataRegistran {
  final int? id;
  final String namaLengkap;
  final String email; 
  final String nomorPonsel;
  final String kataSandi;
  final String kotaAsal;
  DataRegistran({
    this.id,
    required this.namaLengkap,
    required this.email,
    required this.nomorPonsel,
    required this.kataSandi,
    required this.kotaAsal,
  });

  // Konversi dari Database (Map) ke Objek Dart
  factory DataRegistran.dariPeta(Map<String, dynamic> peta) {
    return DataRegistran(
      id: peta['id_unik'],
      namaLengkap: peta['kolom_nama'],
      email: peta['kolom_email'],
      nomorPonsel: peta['kolom_hp'],
      kataSandi: peta['kolom_password'],
      kotaAsal: peta['kolom_kota'],
    );
  }

  // Konversi dari Objek Dart ke Database (Map)
  Map<String, dynamic> kePeta() {
    return {
      'id_unik': id,
      'kolom_nama': namaLengkap,
      'kolom_email': email,
      'kolom_hp': nomorPonsel,
      'kolom_password': kataSandi,
      'kolom_kota': kotaAsal,
    };
  }
}