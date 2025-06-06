import 'package:pokemon_flutter/domain/entities/pokemon_entity.dart';
import 'package:pokemon_flutter/domain/use_cases/get_pokemon_use_case.dart';

class PokemonDetailController {
  bool isLoading = true;
  String? error;
  PokemonEntity? pokemon;

  final GetPokemonUseCase getPokemonUseCase;

  PokemonDetailController(this.getPokemonUseCase);

  Future<void> fetchPokemon(String name) async {
    try {
      final result = await getPokemonUseCase(name);
      pokemon = result;
    } catch (e) {
      error = 'Erro ao carregar Pokémon';
    } finally {
      isLoading = false;
    }
  }
}
