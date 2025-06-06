import 'package:pokemon_flutter/domain/repositories/pokemon_repository.dart';

///Use case serve para deixamos uma classe com reponsabilidade unica para
///não fazer a chamada do repositorio direto na controller poderiamos tamber fazer
///outros tratamentos aqui para deixar o codigo mais limpos em coisas mais complexas
class GetAllPokemonUseCase {
  final PokemonRepository repository;

  GetAllPokemonUseCase(this.repository);

  Future<List<String>> call({int limit = 20}) {
    return repository.getAllPokemon(limit: limit);
  }
}
