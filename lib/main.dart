import 'package:fl_graphql_basic/configs/api_client.dart';
import 'package:fl_graphql_basic/screens/post_screen.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  /* Initialize ApiClient Singleton*/
  ApiClient.initialize();
  runApp(const AppMain());
}

class AppMain extends StatelessWidget {
  const AppMain({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter GraphQL Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PostScreen(),
    );
  }
}
