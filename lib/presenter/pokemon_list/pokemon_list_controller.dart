import 'package:flutter/material.dart';
import 'package:pokemon_flutter/domain/use_cases/get_all_pokemon_use_case.dart';

class PokemonListController extends ChangeNotifier {
  final GetAllPokemonUseCase getAllPokemonUseCase;
  final ScrollController scrollController = ScrollController();

  Future<void> init() async {
    fetchPokemons();
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent) {
        fetchPokemons();
      }
    });
  }

  List<String> pokemons = [];
  bool isLoading = true;
  String? error;

  PokemonListController(this.getAllPokemonUseCase){
    init();
  }

  Future<void> fetchPokemons() async {
    try {
      final morePokemons = await getAllPokemonUseCase(offset: pokemons.length);
      pokemons.addAll(morePokemons);
      print('quantidade de pokemon ${pokemons.length}');
    } catch (e) {
      error = 'Erro ao carregar Pokémons';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
