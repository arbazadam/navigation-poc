import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nav_poc/bloc/home_cubit.dart';

import 'pages/favorites_page.dart';
import 'pages/search_page.dart';
import 'pages/settings_page.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: ((context) => HomeCubit()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ParentApp(),
      ),
    );
  }
}

class ParentApp extends StatelessWidget {
  ParentApp({Key? key}) : super(key: key);
  late OPage _page;
  final navigatorKeys = {
    OPage.search: GlobalKey<NavigatorState>(),
    OPage.settings: GlobalKey<NavigatorState>(),
    OPage.favorites: GlobalKey<NavigatorState>(),
  };

  var appPages = <OPage, WidgetBuilder>{
    OPage.search: (_) => SearchPage(),
    OPage.settings: (_) => SettingsPage(),
    OPage.favorites: (_) => FavoritesPage()
  };

  Widget _buildBody(context) {
    return BlocBuilder<HomeCubit, OPage>(
      // buildWhen: ((previous, current) {
      //   return true;
      // }),
      builder: (context, stateHome) {
        _page = stateHome;
        return appPages[_page]!(context);
      },
    );
  }

  _buildNavBar() {
    return BlocBuilder<HomeCubit, OPage>(
      buildWhen: (previous, current) {
        return previous != current;
      },
      builder: (context, state) {
        void _selectPage(OPage page) {
          context.read<HomeCubit>().goTo(page);
        }

        return BottomNavigationBar(
            selectedItemColor: Colors.red,
            onTap: (int val) {
              if (OPage.values[val] == _page) {
                navigatorKeys[OPage.values[val]]!
                    .currentState!
                    .popUntil((route) => route.isFirst);
                _selectPage(OPage.values[val]);
              } else {
                _selectPage(OPage.values[val]);
              }
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: 'Search'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: 'Settings'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite), label: 'Favorite')
            ]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Poc App')),
      body: _buildBody(context),
      bottomNavigationBar: _buildNavBar(),
    );
  }
}
