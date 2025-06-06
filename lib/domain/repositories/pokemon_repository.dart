import 'package:pokemon_flutter/domain/entities/pokemon_entity.dart';

///Contrado do que esperamos enviar e receber da api
abstract class PokemonRepository {
  Future<List<String>> getAllPokemon({int limit});
  Future<PokemonEntity> getPokemon(String name);
}
