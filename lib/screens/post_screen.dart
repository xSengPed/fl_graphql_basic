import 'package:fl_graphql_basic/models/post.dart';
import 'package:fl_graphql_basic/repository/post_repository.dart';
import 'package:fl_graphql_basic/widgets/post_widget.dart';
import 'package:flutter/material.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  /* Create PostRepository instance */
  final PostRepository postRepository = PostRepositoryImpl();
  List<Post> posts = [];

  /* Fetch Post from Repository then setState */
  Future<void> fetchPost() async {
    final List<Post> result = await postRepository.fetch();
    setState(() {
      posts = result;
    });
  }

  @override
  void initState() {
    fetchPost();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        elevation: 0,
        title: const Text('Posts'),
      ),
      body: Column(
        children: [
          Flexible(
              child: ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              return PostWidget(posts[index]);
            },
          ))
        ],
      ),
    );
  }
}
