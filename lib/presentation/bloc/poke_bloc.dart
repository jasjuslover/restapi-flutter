import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:restapi_flutter/domain/usecases/poke_usecase.dart';
import 'package:restapi_flutter/presentation/bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../constants.dart';
import '../../constants.dart';

class PokeBloc extends Bloc<PokeEvent, PokeState> {
  final PokeUseCase pokeUseCase;
  int offset = 0;
  bool isFetching = false;

  PokeBloc({@required this.pokeUseCase}) : super(PokeInitial());

  @override
  Stream<PokeState> mapEventToState(PokeEvent event) async* {
    if (event is FetchPokemonList) {
      yield PokeLoading();

      var currOffset = offset * limit;

      try {
        var response =
            await pokeUseCase.fetchPokemonList(currOffset.toString());

        yield PokeHasData(pokemons: response);
        offset++;
      } on IOException catch (e) {
        yield PokeNoInternetConnection(message: e.toString());
      } on TimeoutException catch (e) {
        yield PokeNoInternetConnection(message: e.toString());
      } catch (e) {
        yield PokeError(error: e.toString());
      }
    }
  }
}
