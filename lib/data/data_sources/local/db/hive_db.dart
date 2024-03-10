import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

@singleton
class HiveLocalStorage {
  late Box<String> hiveBox;
  final FlutterSecureStorage _secureStorage;

  static const boxKey = 'Box_key';
  static const hiveDbNameKey = "Hive_Db_Key";

  HiveLocalStorage(this._secureStorage);

  Future<HiveLocalStorage> init() async {
    await Hive.initFlutter();
    var secureKey = await _secureStorage.read(key: boxKey) ?? '';
    if (secureKey.isEmpty) {
      final newKey = Hive.generateSecureKey();
      _secureStorage.deleteAll();
      await Hive.deleteBoxFromDisk(hiveDbNameKey);
      _secureStorage.write(key: boxKey, value: base64UrlEncode(newKey));
      await _openHiveBoxDb(hiveDbNameKey,
          base64Url.decode((await _secureStorage.read(key: boxKey))!));
    } else {
      final key = base64Url.decode(secureKey);
      await _openHiveBoxDb(hiveDbNameKey, key);
    }
    return this;
  }

  Future<void> _openHiveBoxDb(String dbName, Uint8List key) async {
    hiveBox = await Hive.openBox<String>(dbName,
        encryptionCipher: HiveAesCipher(key));
  }
}
