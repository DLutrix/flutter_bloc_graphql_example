part of 'season_bloc.dart';

abstract class SeasonState extends Equatable {
  const SeasonState();

  @override
  List<Object> get props => [];
}

class SeasonInitial extends SeasonState {}

class SeasonLoading extends SeasonState {}

class SeasonLoaded extends SeasonState {
  final SeasonModel seasonModel;

  const SeasonLoaded({@required this.seasonModel});

  @override
  List<Object> get props => [seasonModel];
}

class SeasonError extends SeasonState {
  final String errorMessage;

  const SeasonError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
