import 'package:flutter/material.dart';
import 'package:nav_poc/utils.dart';

import '../bloc/home_cubit.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Utils.navigatorKeys[OPage.favorites],
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
            builder: (context) => SafeArea(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Favorites Page'),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: ((context) => Center(
                                        child: Text('Sub Route Favorites'),
                                      ))));
                            },
                            child: Text('Push Subroute'))
                      ]),
                ));
      },
    );
  }
}
