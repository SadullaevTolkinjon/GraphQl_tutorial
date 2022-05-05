// To parse this JSON data, do
//
//     final graphqlModel = graphqlModelFromJson(jsonString);

import 'dart:convert';

GraphqlModel graphqlModelFromJson(String str) =>
    GraphqlModel.fromJson(json.decode(str));

String graphqlModelToJson(GraphqlModel data) => json.encode(data.toJson());

class GraphqlModel {
  GraphqlModel({
    this.data,
    this.extensions,
  });

  Data? data;
  Extensions? extensions;

  factory GraphqlModel.fromJson(Map<String, dynamic> json) => GraphqlModel(
        data: Data.fromJson(json["data"]),
        extensions: Extensions.fromJson(json["extensions"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
        "extensions": extensions!.toJson(),
      };
}

class Data {
  Data({
    this.products,
  });

  Products? products;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        products: Products.fromJson(json["products"]),
      );

  Map<String, dynamic> toJson() => {
        "products": products!.toJson(),
      };
}

class Products {
  Products({
    this.edges,
  });

  List<Edge>? edges;

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        edges: List<Edge>.from(json["edges"].map((x) => Edge.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "edges": List<dynamic>.from(edges!.map((x) => x.toJson())),
      };
}

class Edge {
  Edge({
    this.node,
  });

  Node? node;

  factory Edge.fromJson(Map<String, dynamic> json) => Edge(
        node: Node.fromJson(json["node"]),
      );

  Map<String, dynamic> toJson() => {
        "node": node!.toJson(),
      };
}

class Node {
  Node({
    this.id,
    this.name,
    this.description,
    this.thumbnail,
  });

  String? id;
  String? name;
  String? description;
  Thumbnail? thumbnail;

  factory Node.fromJson(Map<String, dynamic> json) => Node(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        thumbnail: Thumbnail.fromJson(json["thumbnail"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "thumbnail": thumbnail!.toJson(),
      };
}

class Thumbnail {
  Thumbnail({
    this.url,
  });

  String? url;

  factory Thumbnail.fromJson(Map<String, dynamic> json) => Thumbnail(
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
      };
}

class Extensions {
  Extensions({
    this.cost,
  });

  Cost? cost;

  factory Extensions.fromJson(Map<String, dynamic> json) => Extensions(
        cost: Cost.fromJson(json["cost"]),
      );

  Map<String, dynamic> toJson() => {
        "cost": cost!.toJson(),
      };
}

class Cost {
  Cost({
    this.requestedQueryCost,
    this.maximumAvailable,
  });

  int? requestedQueryCost;
  int? maximumAvailable;

  factory Cost.fromJson(Map<String, dynamic> json) => Cost(
        requestedQueryCost: json["requestedQueryCost"],
        maximumAvailable: json["maximumAvailable"],
      );

  Map<String, dynamic> toJson() => {
        "requestedQueryCost": requestedQueryCost,
        "maximumAvailable": maximumAvailable,
      };
}
