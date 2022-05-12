import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage{

  static final FlutterSecureStorage _storage =   FlutterSecureStorage();

  static  writeSecureData(String? key, String? value)  async {
    var writeData =  _storage.write(key: key ?? '', value: value);
    return writeData;
  }

  static  readSecureData(String? key) async {
    var readData =  _storage.read(key: key ?? '');
    return readData;
  }

  static  deleteSecureData(String? key) async{
    var deleteData =  _storage.delete(key: key ?? '');
    return deleteData;
  }
}
final SecureStorage secureStorage = SecureStorage();