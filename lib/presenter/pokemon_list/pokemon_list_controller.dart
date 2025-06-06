import 'package:flutter/material.dart';
import 'package:pokemon_flutter/domain/use_cases/get_all_pokemon_use_case.dart';

class PokemonListController extends ChangeNotifier {
  final GetAllPokemonUseCase getAllPokemonUseCase;

  List<String> pokemons = [];
  bool isLoading = true;
  String? error;

  int _offset = 0;

  PokemonListController(this.getAllPokemonUseCase);

  Future<void> fetchPokemons({int limit = 20}) async {
    try {
      isLoading = true;
      error = null;
      _offset = 0;
      notifyListeners();

      pokemons = await getAllPokemonUseCase(limit: limit, offset: 0);
      _offset = limit;
    } catch (e) {
      error = 'Erro ao carregar Pokémons';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> loadMore() async {
    if (isLoading) return;

    try {
      final morePokemons = await getAllPokemonUseCase(limit: 20, offset: _offset);
      pokemons.addAll(morePokemons);
      _offset += 20;
      notifyListeners();
    } catch (e) {

    }
  }
}
