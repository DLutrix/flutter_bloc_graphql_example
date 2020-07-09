import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../data/season_data_source.dart';
import '../../model/season_model.dart';

part 'season_event.dart';
part 'season_state.dart';

@injectable
class SeasonBloc extends Bloc<SeasonEvent, SeasonState> {
  final SeasonDataSource seasonDataSource;

  SeasonBloc(this.seasonDataSource) : super(SeasonInitial());

  @override
  Stream<SeasonState> mapEventToState(
    SeasonEvent event,
  ) async* {
    final currentState = state;
    if (event is GetDataEvent) {
      if (currentState is SeasonInitial) {
        yield SeasonLoading();
        try {
          final result = await seasonDataSource(
            seasonYear: event.seasonYear,
            season: event.season,
            perPage: event.perPage,
            page: event.page,
            isAdult: event.isAdult,
          );
          yield SeasonLoaded(seasonModel: result);
        } catch (e) {
          debugPrint(e.toString());
          yield SeasonError(e.toString());
        }
      }
    }
  }
}
