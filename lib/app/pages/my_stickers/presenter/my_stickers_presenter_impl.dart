import 'package:dartweek/app/models/group_stickers.dart';
import 'package:dartweek/app/pages/my_stickers/view/my_stickers_view.dart';
import 'package:dartweek/app/repository/stickers/sticker_repository.dart';

import './my_stickers_presenter.dart';

class MyStickersPresenterImpl implements MyStickersPresenter {

  var album = <GroupStickers>[];
  final StickerRepository stickerRepository;
  late final MyStickersView _view;
  var statusSelected = 'all';
  List<String>? countries;


  MyStickersPresenterImpl({required this.stickerRepository});

  @override
  Future<void> getMyAlbum() async {
    album = await stickerRepository.getMyAlbum();
    _view.loadedPage([...album]);
  }

  @override
  set view(MyStickersView view) => _view = view;
  
  @override
  Future<void> statusFilter(String status) async {
    statusSelected = status;
    _view.updateStatusFilter(status);
  }
  
  @override
  void countryFilter(List<String>? countries) {
    this.countries = countries;
    if(countries == null || countries.isEmpty){
      _view.updateAlbum([...album]);
    } else {
      //atualizar a lista filtrando os grupos selecionados
      final albumFiltred = [...album.where((element) => countries.contains(element.countryCode))];
      _view.updateAlbum(albumFiltred);
    }
  }

}