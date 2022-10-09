import 'package:equatable/equatable.dart';

import 'genres.dart';

class MovieDetail extends Equatable {
  final String? backDropPath;
  final int id;
  final String overview;
  final String releaseDate;
  final int runtime;
  final String title;
  final double voteAverage;
  final List<Genres> genres;
  const MovieDetail({
    required this.genres,
     this.backDropPath,
    required this.id,
    required this.overview,
    required this.releaseDate,
    required this.runtime,
    required this.title,
    required this.voteAverage,
  });

  @override
  List<Object?> get props {
    return [
      backDropPath,
      id,
      overview,
      releaseDate,
      runtime,
      title,
      voteAverage,
      genres,
    ];
  }
}
