import 'package:flutter/material.dart';

import '../bloc/home_cubit.dart';
import '../utils.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Utils.navigatorKeys[OPage.settings],
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
            builder: (context) => SafeArea(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Settings Page'),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: ((context) => Center(
                                        child: Text('Sub Route Settings Page'),
                                      ))));
                            },
                            child: Text('Push Subroute'))
                      ]),
                ));
      },
    );
  }
}
