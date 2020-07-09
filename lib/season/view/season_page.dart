import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/season_bloc.dart';

class SeasonPage extends StatefulWidget {
  const SeasonPage({Key key}) : super(key: key);

  @override
  _SeasonPageState createState() => _SeasonPageState();
}

class _SeasonPageState extends State<SeasonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter GraphQL'),
      ),
      body: Container(
        child: BlocBuilder<SeasonBloc, SeasonState>(
          builder: (_, state) {
            if (state is SeasonLoading) {
              return Center(
                child: const CircularProgressIndicator(),
              );
            } else if (state is SeasonLoaded) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: state.seasonModel.page.media.length,
                itemBuilder: (_, index) {
                  var media = state.seasonModel.page.media[index];
                  return ListTile(
                    leading: CircleAvatar(
                        backgroundImage: NetworkImage(media.coverImage.large)),
                    title: Text(
                      media.title.userPreferred,
                      style: TextStyle(height: 1.5),
                    ),
                    subtitle: Text(
                      media.title.native,
                      style: TextStyle(height: 1.5),
                    ),
                  );
                },
              );
            } else if (state is SeasonError) {
              return Center(
                child: Text(state.errorMessage),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
