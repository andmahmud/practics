import 'dart:typed_data';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

class StorageService {
  static final StorageService _instance = StorageService._internal();
  factory StorageService() => _instance;
  StorageService._internal();

  static const String _boxName = 'secureBox';
  late Box _box;

  // Fixed 32-byte key (MUST be securely stored/obfuscated in production)
  final Uint8List _encryptionKey = Uint8List.fromList([
    12,
    34,
    56,
    78,
    90,
    21,
    43,
    65,
    87,
    23,
    45,
    67,
    89,
    10,
    32,
    54,
    76,
    98,
    11,
    22,
    33,
    44,
    55,
    66,
    77,
    88,
    99,
    13,
    26,
    39,
    52,
    65,
  ]);

  Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    await Hive.initFlutter(dir.path);
    _box = await Hive.openBox(
      _boxName,
      encryptionCipher: HiveAesCipher(_encryptionKey),
    );
  }

  Future<void> saveData(String key, dynamic value) async {
    await _box.put(key, value);
  }

  dynamic getData(String key) {
    return _box.get(key);
  }

  Future<void> removeData(String key) async {
    await _box.delete(key);
  }

  Future<void> clearAll() async {
    await _box.clear();
  }
}
