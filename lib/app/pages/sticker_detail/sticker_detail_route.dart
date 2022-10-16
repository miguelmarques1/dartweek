
import 'package:dartweek/app/pages/my_stickers/presenter/my_stickers_presenter_impl.dart';
import 'package:dartweek/app/pages/sticker_detail/presenter/sticker_detail_presenter.dart';
import 'package:dartweek/app/pages/sticker_detail/presenter/sticker_detail_presenter_impl.dart';
import 'package:dartweek/app/pages/sticker_detail/sticker_detail_page.dart';
import 'package:dartweek/app/repository/stickers/sticker_repository.dart';
import 'package:dartweek/app/repository/stickers/sticker_repository_impl.dart';
import 'package:dartweek/app/services/sticker/find_sticker_service.dart';
import 'package:dartweek/app/services/sticker/find_sticker_service_impl.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_getit/flutter_getit.dart';

class StickerDetailRoute extends FlutterGetItPageRoute{
  @override
  List<Bind<Object>> get bindings => [
    Bind.lazySingleton<StickerRepository>((i) => StickerRepositoryImpl(dio: i())),
    Bind.lazySingleton<FindStickerService>((i) => FindStickerServiceImpl(stickerRepository: i())),
    Bind.lazySingleton<StickerDetailPresenter>((i) => StickerDetailPresenterImpl(findStickerService: i(), stickerRepository: i()))
  ];

  @override
  // TODO: implement page
  WidgetBuilder get page => (context) => StickerDetailPage(presenter: context.get(),);
  
}