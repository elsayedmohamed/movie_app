// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:movies_app/movies/domain/entites/recommendation.dart';

import '../../../core/utils/enums.dart';
import '../../domain/entites/movie_detail.dart';

class MovieDetailsState extends Equatable {
  final MovieDetail? movieDetail;
  final RequestState movieDetailsState;
  final String message;
  //
  final List<Recommendation> movieRecommendations;
  final RequestState movieRecommendationsState;
  final String movieRecommndationsMessage;

  const MovieDetailsState({
    this.movieDetail,
    this.movieDetailsState = RequestState.loading,
    this.message = '',
    this.movieRecommendations = const [],
    this.movieRecommendationsState = RequestState.loading,
    this.movieRecommndationsMessage = '',
  });

  @override
  List<Object?> get props => [
        movieDetail,
        movieDetailsState,
        message,
        movieRecommendations,
        movieRecommendationsState,
        movieRecommndationsMessage,
      ];

  MovieDetailsState copyWith({
    MovieDetail? movieDetail,
    RequestState? movieDetailsState,
    String? message,
    List<Recommendation>? movieRecommendations,
    RequestState? movieRecommendationsState,
    String? movieRecommndationsMessage,
  }) {
    return MovieDetailsState(
      movieDetail: movieDetail ?? this.movieDetail,
      movieDetailsState: movieDetailsState ?? this.movieDetailsState,
      message: message ?? this.message,
      movieRecommendations: movieRecommendations ?? this.movieRecommendations,
      movieRecommendationsState:
          movieRecommendationsState ?? this.movieRecommendationsState,
      movieRecommndationsMessage:
          movieRecommndationsMessage ?? this.movieRecommndationsMessage,
    );
  }
}
