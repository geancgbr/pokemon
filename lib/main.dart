import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pokemon_flutter/data/repositories/pokemon_repository_impl.dart';
import 'package:pokemon_flutter/domain/use_cases/get_all_pokemon_use_case.dart';
import 'package:pokemon_flutter/presenter/pokemon_list/pokemon_list_controller.dart';
import 'package:pokemon_flutter/presenter/pokemon_list/pokemon_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokémon Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: ChangeNotifierProvider(
        create: (_) => PokemonListController(
          GetAllPokemonUseCase(PokemonRepositoryImpl()),
        ),
        child: const PokemonListPage(),
      ),
    );
  }
}
