import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:moviedemo/model/secure_store/input_secure_item.dart';

abstract class SecureStoreRepository {
  static const keyAccountId = "keyAccountId";
  static const keyAccessToken = "keyAccessToken";
  static const keyUserCode = "keyUserCode";

  const SecureStoreRepository();

  Future<String?> get(String key);

  Future<void> write({required String key, required String value});

  Future<void> writes(List<InputSecureItem> items);

  Future<void> deleteAll();
}

class SecureStoreRepositoryImpl extends SecureStoreRepository {
  late AndroidOptions androidOptions;
  late FlutterSecureStorage storage;
  late Map<String, String> cache;

  SecureStoreRepositoryImpl() {
    androidOptions = const AndroidOptions(
      encryptedSharedPreferences: true,
    );
    storage = FlutterSecureStorage(aOptions: androidOptions);
    cache = {};
  }

  @override
  Future<void> deleteAll() async {
    cache = {};
    await storage.deleteAll();
  }

  @override
  Future<String?> get(String key) async {
    if (cache.containsKey(key)) {
      return cache[key];
    }
    return await storage.read(key: key);
  }

  @override
  Future<void> write({required String key, required String value}) async {
    cache[key] = value;
    await storage.write(key: key, value: value);
  }

  @override
  Future<void> writes(List<InputSecureItem> items) async {
    for (var inputSecureItem in items) {
      await write(key: inputSecureItem.key, value: inputSecureItem.value);
    }
  }
}
