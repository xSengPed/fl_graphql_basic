import 'dart:developer';

import 'package:fl_graphql_basic/configs/api_client.dart';
import 'package:fl_graphql_basic/models/post.dart';
import 'package:graphql/client.dart';

abstract class PostRepository {
  Future<List<Post>> fetch();
}

class PostRepositoryImpl implements PostRepository {
  final GraphQLClient api = ApiClient.client;
  @override
  Future<List<Post>> fetch() async {
    /* Defind Query then Fetch Post from GraphQL API */
    QueryOptions options = QueryOptions(
      document: gql('''
        query Posts {
            posts {
                id
                title
                body
            }
        }
      '''),
    );
    try {
      final QueryResult result = await api.query(options);
      /* Parse JSON to List<Post> */
      final List posts = result.data?['posts'] ?? [];
      if (posts.isEmpty) {
        return [];
      } else {
        /* Create List of Result then return */
        return List.generate(
            posts.length, (index) => Post.fromJson(posts[index]));
      }
    } catch (e) {
      log(e.toString());
      throw Exception('something went wrong!');
    }
  }
}
