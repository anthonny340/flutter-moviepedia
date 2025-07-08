import 'package:dio/dio.dart';

import 'package:cinemapedia/infrastructure/mappers/actor_mapper.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/credits_response.dart';

import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/config/domain/entities/actor.dart';
import 'package:cinemapedia/config/domain/datasources/actors_datasource.dart';

class ActorMoviedbDatasource extends ActorsDatasource {
  final dio = Dio(
    BaseOptions(
      //BaseOptions permite establecer opciones por defecto que se aplicarán a todas
      //las peticiones que hagas con esa instancia de la clase Dio, que en este caso se llama dio.
      baseUrl:
          'https://api.themoviedb.org/3', // URL base para todas las peticiones
      queryParameters: {
        //Parámetros por defecto para todas las peticiones
        'api_key':
            Environment.ThemovieDbKey, // Incluye la API key automáticamente
        'language': 'es-ES',
      },
    ),
  );

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) async {
    final response = await dio.get('/movie/$movieId/credits');

    final creditsResponse = CreditsResponse.fromJson(response.data);

    final List<Actor> actorsCast = creditsResponse.cast
        .map((cast) => ActorMapper.castToEntity(cast))
        .toList();

    return actorsCast;
  }
}
