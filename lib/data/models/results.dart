import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'results.g.dart';

@JsonSerializable()
class Results extends Equatable  {
	@JsonKey(name: 'name')
	final String name;
	@JsonKey(name: 'url')
	final String url;

	Results({this.name, this.url});

	factory Results.fromJson(Map<String, dynamic> json) => _$ResultsFromJson(json);

	Map<String, dynamic> toJson() => _$ResultsToJson(this);

	@override
	List<Object> get props => [
		this.name,
		this.url
	];
}
