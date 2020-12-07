import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:restapi_flutter/data/models/pokemons.dart';

abstract class PokeState extends Equatable {
  @override
  List<Object> get props => [];
}

class PokeInitial extends PokeState {}

class PokeLoading extends PokeState {}

class PokeNoInternetConnection extends PokeState {
  final String message;

  PokeNoInternetConnection({@required this.message});

  @override
  List<Object> get props => [message];
}

class PokeHasData extends PokeState {
  final Pokemons pokemons;

  PokeHasData({@required this.pokemons});

  @override
  List<Object> get props => [pokemons];
}

class PokeError extends PokeState {
  final String error;

  PokeError({@required this.error});

  @override
  List<Object> get props => [error];
}
