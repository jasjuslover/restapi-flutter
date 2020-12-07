import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import "results.dart";

part 'pokemons.g.dart';

@JsonSerializable()
class Pokemons extends Equatable  {
	@JsonKey(name: 'count')
	final int count;
	@JsonKey(name: 'next')
	final String next;
	@JsonKey(name: 'previous')
	final String previous;
	@JsonKey(name: 'results')
	final List<Results> results;

	Pokemons({this.count, this.next, this.previous, this.results});

	factory Pokemons.fromJson(Map<String, dynamic> json) => _$PokemonsFromJson(json);

	Map<String, dynamic> toJson() => _$PokemonsToJson(this);

	@override
	List<Object> get props => [
		this.count,
		this.next,
		this.previous,
		this.results
	];
}
