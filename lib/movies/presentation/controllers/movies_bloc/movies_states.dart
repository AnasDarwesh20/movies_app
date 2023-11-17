import 'package:equatable/equatable.dart';
import 'package:movie/core/utils/enums.dart';
import 'package:movie/movies/domain/entity/movie.dart';

class MoviesStates extends Equatable
{
  //nowPlayingMovies
  final List<Movie> nowPlayingMovies;
  final RequestState nowPlayingStates;
  final String nowPlayingMessage;

  //popularMovies
  final List<Movie> popularMovies;
  final RequestState popularStates;
  final String popularMessage;

  //topRatedMovies
  final List<Movie> topRatedMovies;
  final RequestState topRatedStates;
  final String topRatedMessage;


  const MoviesStates({
    //nowPlayingMovies
    this.nowPlayingMovies = const [],
    this.nowPlayingStates = RequestState.loading,
    this.nowPlayingMessage = "",

    //popularMovies
    this.popularMovies = const [],
    this.popularStates = RequestState.loading,
    this.popularMessage = "",

    //topRatedMovies
    this.topRatedMovies = const [],
    this.topRatedStates = RequestState.loading,
    this.topRatedMessage = "",

  });

  // make a copy with to the movies state class to set the new data from api to the same object

  MoviesStates copyWith({
    //nowPlayingMovies
     List<Movie>? nowPlayingMovies,
     RequestState? nowPlayingStates,
     String? nowPlayingMessage,

    //popularMovies
     List<Movie>? popularMovies,
     RequestState? popularStates,
     String? popularMessage,

    //topRatedMovies
    List<Movie>? topRatedMovies,
    RequestState? topRatedStates,
    String? topRatedMessage,
})
  {
    return MoviesStates(
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies ,
      nowPlayingStates: nowPlayingStates ?? this.nowPlayingStates ,
      nowPlayingMessage: nowPlayingMessage ?? this.nowPlayingMessage ,

      popularMovies: popularMovies ?? this.popularMovies ,
      popularStates: popularStates ?? this.popularStates ,
      popularMessage: popularMessage ?? this.popularMessage ,

      topRatedMovies: topRatedMovies ?? this.topRatedMovies ,
      topRatedStates: topRatedStates?? this.topRatedStates,
      topRatedMessage: topRatedMessage?? this.topRatedMessage ,
    );
  }


  @override
  List<Object?> get props => [
    //nowPlayingMovies
    nowPlayingMovies ,
    nowPlayingStates ,
    nowPlayingMessage ,

    //popularMovies
    popularMovies ,
    popularStates ,
    popularMessage ,

    //topRatedMovies
    topRatedMovies ,
    topRatedStates ,
    topRatedMessage ,
  ];


}
