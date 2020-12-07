import 'package:restapi_flutter/data/datasources/pokeapi_remote_datasource.dart';
import 'package:restapi_flutter/data/models/pokemons.dart';
import 'package:restapi_flutter/domain/repositories/poke_repository.dart';
import 'package:meta/meta.dart';

class PokeRepositoryImpl extends PokeRepository {
  final PokeApiDataSource pokeApiDataSource;

  PokeRepositoryImpl({@required this.pokeApiDataSource});

  @override
  Future<Pokemons> fetchPokemonList(String offset) async {
    var response = await pokeApiDataSource.fetchPokemonList(offset);
    return response;
  }
}
