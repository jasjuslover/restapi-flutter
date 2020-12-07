import 'package:restapi_flutter/data/models/pokemons.dart';

abstract class PokeRepository {
  Future<Pokemons> fetchPokemonList(String offset);
}
