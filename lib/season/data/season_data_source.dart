import 'package:flutter/widgets.dart';
import 'package:gql/language.dart';
import 'package:graphql/client.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../model/season_model.dart';
import '../query/season_query.dart' as query;

@injectable
class SeasonDataSource {
  final GraphQLClient client;

  SeasonDataSource(this.client);

  Future<SeasonModel> call({
    @required int page,
    @required int perPage,
    @required String season,
    @required int seasonYear,
    @required bool isAdult,
  }) async {
    try {
      final _options = WatchQueryOptions(
        documentNode: parseString(query.seasonQuery),
        variables: <String, dynamic>{
          'nPage': page,
          'nPerPage': perPage,
          'nSeason': season,
          'nSeasonYear': seasonYear,
          'nIsAdult': isAdult,
        },
        fetchResults: true,
      );
      final result = await client.query(_options);
      return SeasonModel.fromJson(result.data);
    } catch (e) {
      debugPrint(e);
      throw UnimplementedError();
    }
  }
}
