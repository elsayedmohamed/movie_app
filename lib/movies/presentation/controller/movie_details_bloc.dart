import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/utils/enums.dart';
import '../../domain/usecases/get_movie_details_usecase.dart';
import '../../domain/usecases/get_recommindation_usecase.dart';
import 'movie_details_event.dart';

import 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetRecommendationUseCase getRecommendationUseCase;
  MovieDetailsBloc(this.getMovieDetailsUseCase, this.getRecommendationUseCase)
      : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
      on<GetMovieRecommendationEvent>(_getRecommendation);
  }
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  FutureOr<void> _getMovieDetails(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
  

    final result =
        await getMovieDetailsUseCase(MovieDetailParameter(movieId: event.id));

    result.fold(
      (l) => emit(state.copyWith(
        message: l.message,
        movieDetailsState: RequestState.error,
      )),
      (r) => emit(
        state.copyWith(movieDetail: r, movieDetailsState: RequestState.loaded),
      ),
    );
  }

  FutureOr<void> _getRecommendation(GetMovieRecommendationEvent event,
      Emitter<MovieDetailsState> emit) async {
    final result =
        await getRecommendationUseCase(RecommendationParameter(id: event.id));

    result.fold(
      (l) => emit(state.copyWith(
        movieRecommndationsMessage: l.message,
        movieRecommendationsState: RequestState.error,
      )),
      (r) => emit(
        state.copyWith(
            movieRecommendations: r,
            movieRecommendationsState: RequestState.loaded),
      ),
    );
  }
}
