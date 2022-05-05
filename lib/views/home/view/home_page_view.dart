import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:graphql_tutorial/core/services/graphql_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Graphql tutorial"),
      ),
      body: Query(
        options: QueryOptions(
          document: gql(GraphqlService.productsGRAPHQL),
        ),
        builder: (QueryResult result,
            {VoidCallback? refetch, FetchMore? fetchMore}) {
          if (result.hasException) {
            return Center(
              child: Text(result.exception.toString()),
            );
          } else if (result.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            var data = result.data!["products"]["edges"];
            print(result.data);
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Products",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      var product = data[index]["node"];
                      return Column(
                        children: [
                      SizedBox(
                        height: 160,
                        width: 180,
                        child: Image.network(product["thumbnail"]["url"]),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Text(product["name"].toString()),
                      )
                        ],
                      );
                    },
                  ),
                )
              ],
            );
          }
        },
      ),
    );
  }
}
