part of 'movie_details_bloc.dart';

abstract class MovieDetailsEvent extends Equatable {
  const MovieDetailsEvent();
}

class GetMovieDetailsEvent extends MovieDetailsEvent
 {
  final int movieId ;

  const GetMovieDetailsEvent(this.movieId);

  @override
  List<Object?> get props => [
    movieId ,
  ];
}

class GetRecommendationEvent extends MovieDetailsEvent
{
  final int movieId ;

  const GetRecommendationEvent(this.movieId);

  @override
  List<Object?> get props => [
    movieId ,
  ];
}