import 'package:dio/dio.dart';
import 'package:restapi_flutter/data/models/pokemons.dart';
import 'package:restapi_flutter/dio_client.dart';
import 'package:meta/meta.dart';

import '../../constants.dart';

abstract class PokeApiDataSource {
  Future<Pokemons> fetchPokemonList(String offset);
}

class PokeApi extends PokeApiDataSource {
  final DioClient dioClient;

  PokeApi({@required this.dioClient});

  @override
  Future<Pokemons> fetchPokemonList(String offset) async {
    try {
      var response =
          await dioClient.dio.get('$baseUrl/pokemon?limit=10&offset=$offset');
      return Pokemons.fromJson(response.data);
    } on DioError catch (e) {
      return Pokemons.fromJson(e.response.data);
    }
  }
}
