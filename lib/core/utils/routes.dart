import 'package:flutter/material.dart';
import 'package:graphql_tutorial/views/home/view/home_page_view.dart';

class GenerateRouter {
  static routeGenerate(RouteSettings settings) {
    var args = settings.arguments;
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (context) => const HomePage());
    }
  }
}
