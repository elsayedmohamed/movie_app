import '../../domain/entites/movie_detail.dart';
import 'genres_model.dart';

class MovieDetailModel extends MovieDetail {
  const MovieDetailModel({
    required super.genres,
     super.backDropPath,
    required super.id,
    required super.overview,
    required super.releaseDate,
    required super.runtime,
    required super.title,
    required super.voteAverage,
  });
  factory MovieDetailModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailModel(
        genres:List<GenresModel>.from( json['genres'].map((e)=>GenresModel.fromJson(e))) ,
        backDropPath: json['backdrop_path']??'/kGzFbGhp99zva6oZODW5atUtnqi.jpg',
        id: json['id'],
        overview: json['overview'],
        releaseDate: json['release_date'],
        runtime: json['runtime'],
        title: json['title'],
        voteAverage: json['vote_average'].toDouble(),
      );
}
