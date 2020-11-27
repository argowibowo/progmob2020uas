class Validation{
  String validateNama(String value){
    if(value.isEmpty){
      return 'Nama tidak boleh kosong';
    }
    return null;
  }
  String validateUser(String value){
    if(value.isEmpty){
      return 'Username tidak boleh kosong!';
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