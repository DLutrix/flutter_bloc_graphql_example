part of 'season_bloc.dart';

abstract class SeasonEvent extends Equatable {
  const SeasonEvent();

  @override
  List<Object> get props => [];
}

class GetDataEvent extends SeasonEvent {
  final int page;
  final int perPage;
  final String season;
  final int seasonYear;
  final bool isAdult;

  GetDataEvent({
    this.page,
    this.perPage,
    this.season,
    this.seasonYear,
    this.isAdult,
  });

  @override
  List<Object> get props => [
        page,
        perPage,
        season,
        seasonYear,
        isAdult,
      ];
}
