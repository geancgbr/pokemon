import 'package:flutter/material.dart';
import 'package:pokemon_flutter/data/repositories/pokemon_repository_impl.dart';
import 'package:pokemon_flutter/domain/use_cases/get_all_pokemon_use_case.dart';
import 'package:pokemon_flutter/presenter/pokemon_detail/pokemon_detail_page.dart';
import 'package:pokemon_flutter/presenter/pokemon_list/pokemon_list_controller.dart';

class PokemonListPage extends StatefulWidget {
  const PokemonListPage({super.key});

  @override
  State<PokemonListPage> createState() => _PokemonListPageState();
}

class _PokemonListPageState extends State<PokemonListPage> {
  final PokemonListController controller = PokemonListController(
    GetAllPokemonUseCase(PokemonRepositoryImpl()),
  );

  @override
  void initState() {
    super.initState();
    loadPokemon();
  }

  Future<void> loadPokemon() async {
    await controller.fetchPokemons(limit: 20);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pokémons')),
      body: controller.isLoading
          ? const Center(child: CircularProgressIndicator())
          : controller.error != null
          ? Center(child: Text(controller.error!))
          : ListView.builder(
        itemCount: controller.pokemons.length,
        itemBuilder: (context, index) {
          final name = controller.pokemons[index];
          return ListTile(
            title: Text(name),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PokemonDetailPage(pokemonName: name),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
