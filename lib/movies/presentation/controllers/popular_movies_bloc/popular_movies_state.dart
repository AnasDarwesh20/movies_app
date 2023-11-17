part of 'popular_movies_bloc.dart';

class PopularMoviesState extends Equatable {
  final List<Movie> morePopularMovies;
  final RequestState morePopularStates;
  final String morePopularMessage;

  const PopularMoviesState({
    this.morePopularMovies = const [],
    this.morePopularStates = RequestState.loading,
     this.morePopularMessage = '',
  });

  PopularMoviesState copyWith({
      List<Movie> ?  morePopularMovies,
      RequestState ? morePopularStates,
      String ? morePopularMessage,
}) => PopularMoviesState(
        morePopularMovies: morePopularMovies ?? this.morePopularMovies,
        morePopularStates: morePopularStates ?? this.morePopularStates,
        morePopularMessage: morePopularMessage ?? this.morePopularMessage,
      );

  @override
  List<Object?> get props => [
        morePopularMovies,
        morePopularStates,
        morePopularMessage,
      ];
}
