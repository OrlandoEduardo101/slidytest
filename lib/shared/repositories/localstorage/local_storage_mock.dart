import 'package:slidytest/shared/repositories/localstorage/local_storage_interface.dart';

class LocalStorageMock implements ILocalStorage {

  List<String> storage = [];

  @override
  Future delete(String key) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<List<String>> get(String key) async {
    // TODO: implement get
    return storage;
  }

  @override
  Future put(String key, List<String> value) {
    // TODO: implement put
    storage = value;
  }

}