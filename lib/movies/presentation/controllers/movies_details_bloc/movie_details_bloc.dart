import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/utils/enums.dart';
import 'package:movie/movies/domain/entity/movie_details.dart';
import 'package:movie/movies/domain/entity/recommendation.dart';
import 'package:movie/movies/domain/usecases/get_movie_details.dart';
import 'package:movie/movies/domain/usecases/get_recommendation_use_case.dart';

part 'movie_details_event.dart';

part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {

  final GetMovieDetailsUseCase getMovieDetailsUseCase;

  final GetRecommendationUseCase getRecommendationUseCase;

  MovieDetailsBloc(this.getMovieDetailsUseCase, this.getRecommendationUseCase,): super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(getMovieDetails);
    on<GetRecommendationEvent>(getRecommendation);
  }

  FutureOr<void> getMovieDetails(GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async
  {
    final result = await getMovieDetailsUseCase(
        MovieDetailsParameters(movieId: event.movieId));


    result.fold(
            (l) => emit(
              state.copyWith(
                movieDetailsState: RequestState.error ,
                movieDetailsMessage: l.message ,
              )
            ),
            (r) => emit(
              state.copyWith(
                movieDetails: r ,
                movieDetailsState: RequestState.loaded ,
              )
            ) ,
    );
  }

  FutureOr<void> getRecommendation(GetRecommendationEvent event, Emitter<MovieDetailsState> emit) async
  {
    final result = await getRecommendationUseCase(RecommendationParameters(event.movieId)) ;

    result.fold(
          (l) => emit(
            state.copyWith(
              recommendationState: RequestState.error ,
              recommendationMessage: l.message ,
            )
          ),
          (r) => emit(
            state.copyWith(
              recommendation: r ,
              recommendationState: RequestState.loaded ,
            )
          ),) ;
  }
}
