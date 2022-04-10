import 'package:flutter_bloc/flutter_bloc.dart';

enum OPage { search, settings, favorites }

class HomeCubit extends Cubit<OPage> {
  HomeCubit() : super(OPage.search);
  void goTo(OPage page) => emit(page);
}
