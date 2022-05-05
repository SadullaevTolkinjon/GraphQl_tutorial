import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:graphql_tutorial/core/services/graphql_service.dart';
import 'package:graphql_tutorial/core/utils/routes.dart';

void main() {
  var app = GraphQLProvider(
    client: GraphqlService.client,
    child: const MyApp(),
  );
  runApp(app);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      onGenerateRoute: (settings) => GenerateRouter.routeGenerate(settings),
    );
  }
}
