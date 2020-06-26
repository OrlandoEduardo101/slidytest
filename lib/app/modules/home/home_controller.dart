
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:slidytest/app/modules/home/repositories/poke_repositories.dart';
import 'package:slidytest/shared/repositories/localstorage/local_storage_interface.dart';
import 'models/pokemon_model.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {

  final ILocalStorage _storage = Modular.get();

  @observable
  String text = '';

  @action
  setText(String value) => text = value;

  @observable
  ObservableList<String> list = <String>[].asObservable();

  _HomeControllerBase(){
    init();
  }

  @action
  init() async{
    List<String> listLocal = await _storage.get('list');
    if(listLocal == null){
      list = <String>[].asObservable();
    }else{
      list = listLocal.asObservable();
    }
  }

  @action
  void save(){
    list.add(text);
    print(list[0].toString());
    _storage.put('list', list);
  }

  void remove(int index){
    list.removeAt(index);
    _storage.put('list', list);
  }

/*  final PokeRepository repository;

  @observable
  ObservableFuture<List<PokemonModel>> pokemons;

  _HomeControllerBase(this.repository){
    fetchPokemons();
    increment = Action(_increment);
  }

  @action
  fetchPokemons(){
    pokemons = repository.getAllPokes().asObservable();
    print("fetch");
  }

  Observable _count = Observable(0);

  int get count => _count.value;

  Action increment;
  void _increment(){
    _count.value++;
  }*/
}