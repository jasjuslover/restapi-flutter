import 'package:equatable/equatable.dart';

abstract class PokeEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchPokemonList extends PokeEvent {}
