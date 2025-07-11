import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pokemon_flutter/data/models/pokemon_model.dart';
import 'package:pokemon_flutter/domain/entities/pokemon_entity.dart';
import 'package:pokemon_flutter/domain/repositories/pokemon_repository.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  static const String baseUrl = 'https://pokeapi.co/api/v2/pokemon';

  @override
  Future<List<String>> getAllPokemon({int limit = 20, int offset = 0}) async {
    final response = await http.get(Uri.parse('$baseUrl?limit=$limit&offset=$offset'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List results = data['results'];
      return results.map<String>((item) => item['name'] as String).toList();
    } else {
      throw Exception('Erro ao buscar lista de Pokémons');
    }
  }

  @override
  Future<PokemonEntity> getPokemon(String name) async {
    final response = await http.get(Uri.parse('$baseUrl/$name'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return PokemonModel.fromJson(data);
    } else {
      throw Exception('Erro ao buscar detalhes do Pokémon');
    }
  }
}
