import 'package:dartweek/app/core/mvp/fwc_presenter.dart';

import '../view_bloc/home_view.dart';

abstract class HomePresenter extends FwcPresenter<HomeView> {
  Future<void> getUserData();
  Future<void> logout();
}