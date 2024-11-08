import 'package:graphql/client.dart';

class ApiClient {
  static const String endpoint =
      "https://graphqlplaceholder.vercel.app/graphql";
  static late final GraphQLClient client;
  ApiClient.initialize() {
    client = GraphQLClient(
      cache: GraphQLCache(),
      link: HttpLink(endpoint),
    );
  }
}
