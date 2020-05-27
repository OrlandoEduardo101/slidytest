import 'package:mobx/mobx.dart';
import 'package:slidytest/app/modules/home/repositories/poke_repositories.dart';
import 'models/pokemon_model.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {

  final PokeRepository repository;

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
  }
}