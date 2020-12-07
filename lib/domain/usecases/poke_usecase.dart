import 'package:restapi_flutter/data/models/pokemons.dart';
import 'package:restapi_flutter/domain/repositories/poke_repository.dart';
import 'package:meta/meta.dart';

abstract class PokeUseCase {
  Future<Pokemons> fetchPokemonList(String offset);
}

class PokeUseCaseImpl extends PokeUseCase {
  final PokeRepository pokeRepository;

  PokeUseCaseImpl({@required this.pokeRepository});

  @override
  Future<Pokemons> fetchPokemonList(String offset) async =>
      pokeRepository.fetchPokemonList(offset);
}
