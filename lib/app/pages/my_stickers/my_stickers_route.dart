
import 'package:dartweek/app/pages/my_stickers/my_stickers_page.dart';
import 'package:dartweek/app/pages/my_stickers/presenter/my_stickers_presenter.dart';
import 'package:dartweek/app/pages/my_stickers/presenter/my_stickers_presenter_impl.dart';
import 'package:dartweek/app/pages/my_stickers/view/my_stickers_view.dart';
import 'package:dartweek/app/repository/stickers/sticker_repository_impl.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_getit/flutter_getit.dart';

import '../../repository/stickers/sticker_repository.dart';

class MyStickersRoute extends FlutterGetItPageRoute {
  const MyStickersRoute({super.key});

  @override
  List<Bind<Object>> get bindings => [
    Bind.lazySingleton<StickerRepository>((i) => StickerRepositoryImpl(dio: i())),
    Bind.lazySingleton<MyStickersPresenter>((i) => MyStickersPresenterImpl(stickerRepository: i()))
  ];


  @override
  // TODO: implement page
  WidgetBuilder get page => (context) => MyStickersPage(presenter: context.get(),);
  
}