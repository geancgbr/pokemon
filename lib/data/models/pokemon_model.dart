import 'package:pokemon_flutter/domain/entities/pokemon_entity.dart';

class PokemonModel extends PokemonEntity {
  const PokemonModel({required super.name, required super.imageUrl});

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(
      name: json['name'],
      imageUrl: json['sprites']['front_default'] ?? '',
    );
  }
}
