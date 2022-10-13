import 'package:dartweek/app/core/ui/styles/button_styles.dart';
import 'package:dartweek/app/core/ui/styles/colors_app.dart';
import 'package:dartweek/app/core/ui/styles/text_styles.dart';
import 'package:dartweek/app/pages/home/presenter/home_presenter.dart';
import 'package:dartweek/app/pages/home/view/home_view_impl.dart';
import 'package:dartweek/app/pages/home/widgets/status_tile.dart';
import 'package:dartweek/app/pages/home/widgets/sticker_percent_widget.dart';
import "package:flutter/material.dart";

import '../../core/ui/widgets/button.dart';

class HomePage extends StatefulWidget {

  final HomePresenter presenter;

  const HomePage({super.key, required this.presenter});

  @override
  State <HomePage> createState() => HomePageState();
}

class HomePageState extends HomeViewImpl {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.primary,
      appBar: AppBar(
        backgroundColor: context.colors.primary,
        actions: [
          const Spacer(),
          IconButton(onPressed: () {
            widget.presenter.logout();
          }, icon: const Icon(Icons.logout, color: Colors.white,))
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover
          )
        ),
        child: LayoutBuilder(
          builder: (_, constrains) {
            return ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constrains.maxHeight
              ),
              child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(bottom: 35),
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset(
                      'assets/images/bola.png',
                      fit: BoxFit.cover,
                      ),
                    ),
                    StickerPercentWidget(percent: user?.totalCompletePercent ?? 0,),
                    const SizedBox(
                       height: 20,
                    ),
                    Text(
                       "${user?.totalStickers ?? 0} figurinhas",
                    style: context.textStyles.titleWhite,
                    ),
                    const SizedBox(
                       height: 20,
                    ),
                    StatusTile(
                      image: Image.asset('assets/images/all_icon.png'),
                      value: "${user?.totalAlbum ?? 0}",
                      title: "Todas",
                    ),
                    const SizedBox(
                       height: 20,
                    ),
                    StatusTile(
                      image: Image.asset('assets/images/missing_icon.png'),
                      value: '${user?.totalComplete ?? 0}',
                      title: 'Faltando',
                    ),
                    const SizedBox(
                       height: 20,
                    ),
                    StatusTile(
                      image: Image.asset('assets/images/repeated_icon.png'),
                      value: '${user?.totalDuplicates ?? 0}',
                      title: 'Repetidas',
                    ),
                    const SizedBox(
                       height: 20,
                    ),
                    Button(
                      width: MediaQuery.of(context).size.width * .9,
                      style: context.buttonStyles.yellowOutlineButton,
                      outline: true,
                      onPressed: () {
                        Navigator.of(context).pushNamed("/my-stickers");
                      },
                      labelStyle: context.textStyles.textSecondaryFontExtraBold.copyWith(
                        color: context.colors.yellow
                    ),
                    label: 'Minhas Figurinhas'
                    ),
                  ],
                ),
              )
              ),
            );
          },
        ),
      ),
    );
  }
}