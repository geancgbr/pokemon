import 'package:pokemon_flutter/domain/entities/pokemon_entity.dart';
import 'package:pokemon_flutter/domain/repositories/pokemon_repository.dart';

///Use case serve para deixamos uma classe com reponsabilidade unica para
///não fazer a chamada do repositorio direto na controller poderiamos tamber fazer
///outros tratamentos aqui para deixar o codigo mais limpos em coisas mais complexas
class GetPokemonUseCase {
  final PokemonRepository repository;

  GetPokemonUseCase(this.repository);

  Future<PokemonEntity> call(String name) {
    return repository.getPokemon(name);
  }
}
