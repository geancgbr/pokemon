import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pokemon_flutter/presenter/pokemon_detail/pokemon_detail_page.dart';
import 'package:pokemon_flutter/presenter/pokemon_list/pokemon_list_controller.dart';

class PokemonListPage extends StatefulWidget {
  const PokemonListPage({super.key});

  @override
  State<PokemonListPage> createState() => _PokemonListPageState();
}

class _PokemonListPageState extends State<PokemonListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pokémons')),
      body: Consumer<PokemonListController>(
        builder: (context, controller, child) {
          if (controller.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (controller.error != null) {
            return Center(child: Text(controller.error!));
          }

          return ListView.builder(
            controller: controller.scrollController,
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
          );
        },
      ),
    );
  }
}