import 'package:equatable/equatable.dart';

class Recommendation extends Equatable {
  final String? backdropPath;

  final int movieId;

  const Recommendation({
    this.backdropPath,
    required this.movieId,
  });

  @override
  List<Object?> get props => [
    backdropPath ,
    movieId , 
  ];
}
