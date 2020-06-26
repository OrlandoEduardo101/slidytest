import 'dart:async';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:slidytest/shared/repositories/localstorage/local_storage_interface.dart';

class LocalStorageShare implements ILocalStorage{

  Completer<SharedPreferences> _instance = Completer<SharedPreferences>();

  _init() async {
    var dir = await getApplicationDocumentsDirectory();
    _instance.complete(await SharedPreferences.getInstance());
  }

  LocalStorageHive(){
    _init();
  }

  @override
  Future delete(String key) async{
    // TODO: implement delete
    var share = await _instance.future;
     share.remove(key);
  }

  @override
  Future<List<String>> get(String key) async {
    // TODO: implement get
    var share = await _instance.future;
    return share.getStringList(key);
  }

  @override
  Future put(String key, List<String> value) async {
    // TODO: implement put
    var share = await _instance.future;
     share.setStringList(key, value);
  }

}