import 'package:pokemon_flutter/domain/entities/pokemon_entity.dart';

class PokemonModel extends PokemonEntity {
  const PokemonModel({
    required super.name,
    required super.imageUrl,
    required super.abilities,
  });

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    final List abilitiesJson = json['abilities'] ?? [];
    final List<String> abilities = abilitiesJson
        .map<String>((ability) => ability['ability']['name'] as String)
        .toList();

    return PokemonModel(
      name: json['name'],
      imageUrl: json['sprites']['front_default'] ?? '',
      abilities: abilities,
    );
  }
}