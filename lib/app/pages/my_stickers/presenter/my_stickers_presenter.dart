import 'package:dartweek/app/core/mvp/fwc_presenter.dart';
import 'package:dartweek/app/fwc_album_app.dart';
import 'package:dartweek/app/pages/my_stickers/view/my_stickers_view.dart';

abstract class MyStickersPresenter extends FwcPresenter<MyStickersView> {
  Future<void> getMyAlbum();
  Future<void> statusFilter(String status);
  void countryFilter(List<String>? countries);
} 