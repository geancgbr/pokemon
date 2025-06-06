import 'package:pokemon_flutter/domain/entities/pokemon_entity.dart';

abstract class PokemonRepository {
  Future<List<String>> getAllPokemon({int limit, int offset});
  Future<PokemonEntity> getPokemon(String name);
}
