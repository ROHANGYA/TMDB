import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class HiveLocalStorage {
  late Box<String> hiveBox;
  final FlutterSecureStorage _secureStorage;

  static const boxKey = 'Box_key';
  static const hiveDbNameKey = "Hive_Db_Key";

  HiveLocalStorage(this._secureStorage) {
    _init();
  }

  Future<HiveLocalStorage> _init() async {
    await Hive.initFlutter();
    var secureKey = await _secureStorage.read(key: boxKey) ?? '';
    if (secureKey.isEmpty) {
      final newKey = Hive.generateSecureKey();
      _secureStorage.deleteAll();
      await Hive.deleteBoxFromDisk(hiveDbNameKey);
      _secureStorage.write(key: boxKey, value: base64UrlEncode(newKey));
    } else {
      final keyInt = base64Url.decode(secureKey);
      await _openHiveBoxDb(hiveDbNameKey, keyInt);
      if (hiveBox.isOpen) {
        await hiveBox.compact();
        await hiveBox.close();
      }
      await _openHiveBoxDb(hiveDbNameKey, keyInt);
    }
    return this;
  }

  Future<void> _openHiveBoxDb(String dbName, Uint8List keyInt) async {
    hiveBox = await Hive.openBox<String>(dbName,
        encryptionCipher: HiveAesCipher(keyInt));
  }
}
