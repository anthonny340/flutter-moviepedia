import 'package:cinemapedia/config/domain/entities/actor.dart';

abstract class ActorsRespository {
  Future<List<Actor>> getActorsByMovie(String movieId);
}
