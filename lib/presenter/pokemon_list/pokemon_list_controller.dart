import 'package:flutter/material.dart';
import 'package:pokemon_flutter/domain/use_cases/get_all_pokemon_use_case.dart';

class PokemonListController {
  final GetAllPokemonUseCase getAllPokemonUseCase;

  List<String> pokemons = [];
  bool isLoading = true;
  String? error;

  PokemonListController(this.getAllPokemonUseCase);

  Future<void> fetchPokemons({int limit = 20}) async {
    try {
      pokemons = await getAllPokemonUseCase(limit: limit);
    } catch (e) {
      error = 'Erro ao carregar Pokémons';
    } finally {
      isLoading = false;
    }
  }
}
