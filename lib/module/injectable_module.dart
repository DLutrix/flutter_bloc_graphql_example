import 'package:graphql/client.dart';
import 'package:injectable/injectable.dart';

@module
abstract class InjectableModule {
  @lazySingleton
  GraphQLClient get client => graphQLClient();
}

GraphQLClient graphQLClient() {
  final _httpLink = HttpLink(
    uri: 'https://graphql.anilist.co',
  );

  return GraphQLClient(
    cache: InMemoryCache(),
    link: _httpLink,
  );
}
