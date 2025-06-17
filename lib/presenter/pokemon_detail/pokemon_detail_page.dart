import 'package:flutter/material.dart';
import 'package:pokemon_flutter/data/repositories/pokemon_repository_impl.dart';
import 'package:pokemon_flutter/domain/use_cases/get_pokemon_use_case.dart';
import 'package:pokemon_flutter/presenter/pokemon_detail/pokemon_detail_controller.dart';

class PokemonDetailPage extends StatefulWidget {
  final String pokemonName;

  const PokemonDetailPage({super.key, required this.pokemonName});

  @override
  State<PokemonDetailPage> createState() => _PokemonDetailPageState();
}

class _PokemonDetailPageState extends State<PokemonDetailPage> {
  late final PokemonDetailController controller;

  @override
  void initState() {
    super.initState();
    controller = PokemonDetailController(
      GetPokemonUseCase(PokemonRepositoryImpl()),
    );
    loadPokemon();
  }

  Future<void> loadPokemon() async {
    await controller.fetchPokemon(widget.pokemonName);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.pokemonName)),
      body: controller.isLoading
          ? const Center(child: CircularProgressIndicator())
          : controller.error != null
          ? Center(child: Text(controller.error!))
          : controller.pokemon == null
          ? const Center(child: Text('Pokémon não encontrado'))
          : Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(controller.pokemon!.imageUrl, height: 150),
            const SizedBox(height: 20),
            Text(
              controller.pokemon!.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              'Habilidades:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            ...controller.pokemon!.abilities.map((ability) =>
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade100,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    ability,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
            ).toList(),
          ],
        ),
      ),
    );
  }
}