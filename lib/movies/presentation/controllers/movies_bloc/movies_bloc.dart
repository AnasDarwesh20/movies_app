import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/usecases/base_usecases.dart';
import 'package:movie/core/utils/enums.dart';
import 'package:movie/movies/domain/usecases/get_now_playing_movies.dart';
import 'package:movie/movies/domain/usecases/get_popular_movies.dart';
import 'package:movie/movies/domain/usecases/get_top_rated_movies.dart';
import 'package:movie/movies/presentation/controllers/movies_bloc/movies_events.dart';
import 'package:movie/movies/presentation/controllers/movies_bloc/movies_states.dart';

class MoviesBloc extends Bloc<MoviesEvents, MoviesStates> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;

  final GetPopularMoviesUseCase getPopularMoviesUseCase;

  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  MoviesBloc(
    this.getNowPlayingMoviesUseCase,
    this.getPopularMoviesUseCase,
    this.getTopRatedMoviesUseCase,
  ) : super(const MoviesStates()) {
    on<GetNowPlayingMoviesEvent>(getNowPlayingMovies);

    on<GetPopularMoviesEvent>(getPopularMovies);

    on<GetTopRatedMoviesEvent>(getTopRatedMovies);
  }

  FutureOr<void> getNowPlayingMovies(GetNowPlayingMoviesEvent event, Emitter<MoviesStates> emit) async
  {
    final result = await getNowPlayingMoviesUseCase(const NoParameters());
    result.fold(
      (l) => emit(state.copyWith(
        nowPlayingStates: RequestState.error,
        nowPlayingMessage: l.message,
      )),
      (r) => emit(state.copyWith(
        nowPlayingStates: RequestState.loaded,
        nowPlayingMovies: r,
      )),
    );
  }

  FutureOr<void> getPopularMovies(GetPopularMoviesEvent event, Emitter<MoviesStates> emit) async
  {
    final result = await getPopularMoviesUseCase(const NoParameters()) ;

    result.fold(
      (l) => emit(state.copyWith(
        popularStates: RequestState.error,
        popularMessage: l.message,
      )),
      (r) => emit(state.copyWith(
        popularMovies: r,
        popularStates: RequestState.loaded,
      )),
    );
  }

  FutureOr<void> getTopRatedMovies(GetTopRatedMoviesEvent event, Emitter<MoviesStates> emit) async
  {
    final result = await getTopRatedMoviesUseCase(const NoParameters());

    result.fold(
      (l) => emit(
        state.copyWith(
          popularStates: RequestState.error ,
          popularMessage: l.message ,
        )
      ),
      (r) => emit(
        state.copyWith(
          topRatedMovies: r ,
          topRatedStates: RequestState.loaded ,
        )
      ),
    );
  }
}
