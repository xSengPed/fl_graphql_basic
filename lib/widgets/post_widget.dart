import 'package:fl_graphql_basic/models/post.dart';
import 'package:flutter/material.dart';

/* Ui Component for Display each Post */

class PostWidget extends StatelessWidget {
  final Post post;
  const PostWidget(
    this.post, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "${post.title}",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Text("${post.body}"),
          ],
        ),
      ),
    );
  }
}
