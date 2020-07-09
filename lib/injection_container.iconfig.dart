// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart';
import 'package:graphql/client.dart';

import 'module/injectable_module.dart';
import 'season/data/season_data_source.dart';
import 'season/view/bloc/season_bloc.dart';

void $initGetIt(GetIt g, {String environment}) {
  final injectableModule = _$InjectableModule();
  g.registerLazySingleton<GraphQLClient>(() => injectableModule.client);
  g.registerFactory<SeasonDataSource>(
      () => SeasonDataSource(g<GraphQLClient>()));
  g.registerFactory<SeasonBloc>(() => SeasonBloc(g<SeasonDataSource>()));
}

class _$InjectableModule extends InjectableModule {}
