import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restapi_flutter/data/datasources/pokeapi_remote_datasource.dart';
import 'package:restapi_flutter/data/models/results.dart';
import 'package:restapi_flutter/data/repositories/poke_repository_impl.dart';
import 'package:restapi_flutter/dio_client.dart';
import 'package:restapi_flutter/domain/usecases/poke_usecase.dart';
import 'package:restapi_flutter/presentation/bloc/bloc.dart';

import '../../constants.dart';
import '../../constants.dart';

class PokeListPage extends StatefulWidget {
  PokeListPage({Key key}) : super(key: key);

  @override
  _PokeListPageState createState() => _PokeListPageState();
}

class _PokeListPageState extends State<PokeListPage> {
  PokeBloc _bloc;
  final List<Results> pokeResults = [];
  final ScrollController _scrollController = ScrollController();

  Widget _buildPokemonList(BuildContext context) {
    return BlocConsumer<PokeBloc, PokeState>(
      listener: (context, state) {
        if (state is PokeHasData && pokeResults.isEmpty) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'No more pokemons',
              ),
            ),
          );
        }

        if (state is PokeError) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state.error,
              ),
            ),
          );
          _bloc.isFetching = false;
        }
      },
      builder: (context, state) {
        if (state is PokeError && pokeResults.isEmpty) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(
                  Icons.refresh,
                ),
                onPressed: () {
                  _bloc..add(FetchPokemonList());
                },
              ),
            ],
          );
        }

        if (state is PokeInitial ||
            (state is PokeLoading && pokeResults.isEmpty)) {
          return Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (state is PokeHasData) {
          pokeResults.addAll(state.pokemons.results);
          _bloc.isFetching = false;
          Scaffold.of(context).hideCurrentSnackBar();
        }

        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          controller: _scrollController
            ..addListener(
              () {
                if (_scrollController.offset ==
                        _scrollController.position.maxScrollExtent &&
                    !_bloc.isFetching) {
                  _bloc.add(FetchPokemonList());
                }
              },
            ),
          itemCount: pokeResults.length,
          itemBuilder: (context, index) {
            var pokemon = pokeResults[index];
            return Card(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.network(
                      '$imageBaseUrl/${index + 1}.png',
                      fit: BoxFit.contain,
                      height: MediaQuery.of(context).size.width - 256,
                      width: MediaQuery.of(context).size.width - 256,
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          pokemon.name,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();

    DioClient dioClient = DioClient(apiBaseUrl: baseUrl);
    PokeApi pokeApi = PokeApi(dioClient: dioClient);
    PokeRepositoryImpl pokeRepositoryImpl =
        PokeRepositoryImpl(pokeApiDataSource: pokeApi);
    PokeUseCaseImpl pokeUseCaseImpl =
        PokeUseCaseImpl(pokeRepository: pokeRepositoryImpl);
    _bloc = PokeBloc(pokeUseCase: pokeUseCaseImpl);

    _bloc..add(FetchPokemonList());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _bloc,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Pokemon List'),
          centerTitle: true,
        ),
        body: Container(
          child: _buildPokemonList(context),
        ),
      ),
    );
  }
}
