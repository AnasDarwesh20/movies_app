part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  //movie details
  final MovieDetails movieDetails;

  final RequestState movieDetailsState;

  final String movieDetailsMessage;

  //movie recommendation
  final List<Recommendation> recommendation;

  final RequestState recommendationState;

  final String recommendationMessage;

  const MovieDetailsState({
    //movie details
    this.movieDetails = const MovieDetails(
      backdropPath: '',
      genres: [],
      id: 0,
      overview: '',
      releaseDate: '',
      runtime: 1,
      title: '',
      voteAverage: 3,
    ),
    this.movieDetailsState = RequestState.loading,
    this.movieDetailsMessage = '',

    //movie recommendation
    this.recommendation = const [
      Recommendation(
        movieId: 3556,
        backdropPath: '/2vFuG6bWGyQUzYS9d69E5l85nIz.jpg',
      ),
    ],
    this.recommendationMessage = '',
    this.recommendationState = RequestState.loading,
  });

  MovieDetailsState copyWith({
    //movie details
    MovieDetails? movieDetails,
    RequestState? movieDetailsState,
    String? movieDetailsMessage,

    //movie recommendation
    List<Recommendation>? recommendation,
    String? recommendationMessage,
    RequestState? recommendationState,
  }) {
    return MovieDetailsState(
      //movie details
      movieDetails: movieDetails ?? this.movieDetails,
      movieDetailsState: movieDetailsState ?? this.movieDetailsState,
      movieDetailsMessage: movieDetailsMessage ?? this.movieDetailsMessage,

      //movie recommendation
      recommendation: recommendation ?? this.recommendation,
      recommendationState: recommendationState ?? this.recommendationState,
      recommendationMessage:
          recommendationMessage ?? this.recommendationMessage,
    );
  }

  @override
  List<Object?> get props => [
        movieDetails,
        movieDetailsState,
        movieDetailsMessage,
        recommendation,
        recommendationState,
        recommendationMessage,
      ];
}
