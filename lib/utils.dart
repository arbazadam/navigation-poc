import 'package:flutter/material.dart';

import 'bloc/home_cubit.dart';

class Utils {
  static final navigatorKeys = {
    OPage.search: GlobalKey<NavigatorState>(),
    OPage.settings: GlobalKey<NavigatorState>(),
    OPage.favorites: GlobalKey<NavigatorState>(),
  };
}
