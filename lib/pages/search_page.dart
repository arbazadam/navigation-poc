import 'package:flutter/material.dart';

import '../bloc/home_cubit.dart';
import '../utils.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Utils.navigatorKeys[OPage.search],
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
            builder: (context) => SafeArea(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Search Page'),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: ((context) => Center(
                                        child: Text('Sub Route Search Page'),
                                      ))));
                            },
                            child: Text('Push Subroute'))
                      ]),
                ));
      },
    );
  }
}
