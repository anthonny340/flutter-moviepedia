import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cinemapedia/config/domain/entities/actor.dart';
import 'package:cinemapedia/presentation/providers/actors/actors_repository_provider.dart';

final actorsByMovieProvider =
    StateNotifierProvider<ActorsByMovieNotifier, Map<String, List<Actor>>>(
  (ref) {
    final actorRepository = ref.watch(actorsRepositoryProvider);
    return ActorsByMovieNotifier(getActors: actorRepository.getActorsByMovie);
  },
);
/*
  {
    '654523': <Actor>[],
    '462432': <Actor>[],
    '445234': <Actor>[],
    '123242': <Actor>[],
  }
*/

typedef GetActorsCallback = Future<List<Actor>> Function(String movieId);

class ActorsByMovieNotifier extends StateNotifier<Map<String, List<Actor>>> {
  final GetActorsCallback getActors;

  ActorsByMovieNotifier({
    required this.getActors,
  }) : super({});

  Future<void> loadActors(String movieId) async {
    if (state[movieId] != null) return;
    final List<Actor> actors = await getActors(movieId);

    state = {...state, movieId: actors};
  }
}
