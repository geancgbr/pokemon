/// objeto que esperamos voltar da api
class PokemonEntity {
  final String name;
  final String imageUrl;
  final List<String> abilities;

  const PokemonEntity({
    required this.name,
    required this.imageUrl,
    required this.abilities,
  });
}