class Validation {
  String validateName(String value) {
    if (value.isEmpty) { //JIKA VALUE KOSONG
      return 'Nama Tidak Boleh Kosong!'; //MAKA PESAN DITAMPILKAN
    }
    return null;
  }
}