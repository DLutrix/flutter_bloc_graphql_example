import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'injection_container.dart';
import 'season/view/bloc/season_bloc.dart';
import 'season/view/season_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configure();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter GraphQL',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider(
        create: (_) => getIt<SeasonBloc>()
          ..add(
            GetDataEvent(
              page: 1,
              perPage: 20,
              season: "SUMMER",
              seasonYear: 2020,
              isAdult: false,
            ),
          ),
        child: const SeasonPage(),
      ),
    );
  }
}
