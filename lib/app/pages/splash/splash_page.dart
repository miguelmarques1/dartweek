import 'package:dartweek/app/core/ui/styles/button_styles.dart';
import 'package:dartweek/app/core/ui/styles/colors_app.dart';
import 'package:dartweek/app/core/ui/styles/text_styles.dart';
import 'package:dartweek/app/pages/splash/presenter/splash_presenter.dart';
import 'package:dartweek/app/pages/splash/view/splash_view_impl.dart';
import 'package:flutter/material.dart';
import '../../core/ui/widgets/button.dart';


class SplashPage extends StatefulWidget {
  
  final SplashPresenter presenter;
  
  const SplashPage({super.key, required this.presenter});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends SplashViewImpl{
  
  @override
  void initState() {
    super.initState();
    widget.presenter.view = this;
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: context.colors.primary,
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background_splash.png'),
            fit: BoxFit.cover
          )
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.08),
                child: Image.asset('assets/images/fifa_logo.png'),
              )
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.19),
                child: Button(
                width: MediaQuery.of(context).size.width * 0.9,
                style: context.buttonStyles.yellowButton,
                labelStyle: context.textStyles.textSecondaryFontExtraBoldPrimaryColor,
                label: 'Acessar',
                onPressed: () {
                  widget.presenter.checkLogin();
                },
            ),
              )
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Image.asset('assets/images/bandeiras.png')
              )
            )
          ],
        ),
      ),
    );
  }
}