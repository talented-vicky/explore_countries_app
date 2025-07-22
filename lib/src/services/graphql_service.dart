import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphqlService {
  static final HttpLink httplink = HttpLink(
    'https://countries.trevorblades.com/',
  );

  static ValueNotifier<GraphQLClient> initClient() {
    return ValueNotifier(GraphQLClient(
      link: httplink,
      cache: GraphQLCache(),
    ));
  }
}
