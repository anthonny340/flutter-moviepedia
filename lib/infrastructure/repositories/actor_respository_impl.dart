import 'package:cinemapedia/config/domain/datasources/actors_datasource.dart';
import 'package:cinemapedia/config/domain/entities/actor.dart';
import 'package:cinemapedia/config/domain/repositories/actors_respository.dart';

class ActorRespositoryImpl extends ActorsRespository {
  final ActorsDatasource datasource;

  ActorRespositoryImpl({required this.datasource});

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) {
    return datasource.getActorsByMovie(movieId);
  }
}
