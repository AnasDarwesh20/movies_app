import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/usecases/base_usecases.dart';
import 'package:movie/core/utils/enums.dart';
import 'package:movie/movies/domain/entity/movie.dart';
import 'package:movie/movies/domain/usecases/get_popular_movies.dart';

part 'popular_movies_event.dart';

part 'popular_movies_state.dart';

class PopularMoviesBloc extends Bloc<PopularMoviesEvent, PopularMoviesState> {
  final GetPopularMoviesUseCase getPopularMoviesUseCase;

  PopularMoviesBloc(this.getPopularMoviesUseCase)
      : super(const PopularMoviesState()) {
    on<GetPopularMoviesEvent>(getPopularMovies);
  }

  FutureOr<void> getPopularMovies(
      GetPopularMoviesEvent event, Emitter<PopularMoviesState> emit) async {
    final result = await getPopularMoviesUseCase(const NoParameters());

    result.fold(
      (l) => emit(
        state.copyWith(
          morePopularStates: RequestState.error ,
          morePopularMessage: l.message ,
        ) ,
      ),
      (r) => emit(
        state.copyWith(
          morePopularMovies: r ,
          morePopularStates: RequestState.loaded ,
        ) ,
      ),
    );
  }
}
