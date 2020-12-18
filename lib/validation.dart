class Validation {
  String validateNimNik(String value) {
    if (value.isEmpty) { //JIKA VALUE KOSONG
      return 'NIM / NIK Harus Diisi!'; //MAKA PESAN DITAMPILKAN
    }
    return null;
  }
  String validatePassword(String value) {
    if (value.isEmpty) { //JIKA VALUE KOSONG
      return 'Password Harus Diisi'; //MAKA PESAN DITAMPILKAN
    }
    return null;
  }

  String validateMatkul(String value) {
    if (value.isEmpty) { //JIKA VALUE KOSONG
      return 'Pilih Matkul Harus Dipilih'; //MAKA PESAN DITAMPILKAN
    }
    return null;
  }

  String validateDosen(String value) {
    if (value.isEmpty) { //JIKA VALUE KOSONG
      return 'Pilih Dosen Harus Dipilih'; //MAKA PESAN DITAMPILKAN
    }
    return null;
  }
}