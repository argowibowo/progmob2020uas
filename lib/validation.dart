class Validation{
  String validateNama(String value){
    if(value.isEmpty){
      return 'Nama tidak boleh kosong';
    }
    return null;
  }
  String validateUser(String value){
    if(value.isEmpty && value.length == 0){
      return 'NIM tidak boleh kosong!';
    } else if(value.length < 8 || value.length > 8){
      return 'NIM harus 8 karakter!';
    }
    return null;
  }
  String validatePass(String value){
    if(value.isEmpty){
      return 'Password harus diisi!';
    }
    return null;
  }

}