import 'package:pokemon_flutter/domain/repositories/pokemon_repository.dart';

class GetAllPokemonUseCase {
  final PokemonRepository repository;

  GetAllPokemonUseCase(this.repository);

  Future<List<String>> call({int limit = 20, int offset = 0}) {
    return repository.getAllPokemon(limit: limit, offset: offset);
  }
}
