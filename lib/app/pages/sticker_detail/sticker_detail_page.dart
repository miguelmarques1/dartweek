import 'package:dartweek/app/core/ui/styles/button_styles.dart';
import 'package:dartweek/app/core/ui/styles/text_styles.dart';
import 'package:dartweek/app/core/ui/widgets/rounded_button.dart';
import 'package:dartweek/app/pages/sticker_detail/presenter/sticker_detail_presenter.dart';
import 'package:dartweek/app/pages/sticker_detail/view/sticker_detail_view_impl.dart';
import "package:flutter/material.dart";

import '../../core/ui/widgets/button.dart';

class StickerDetailPage extends StatefulWidget {
  final StickerDetailPresenter presenter;
  const StickerDetailPage({super.key, required this.presenter});

  @override
  State<StickerDetailPage> createState() => _StickerDetailPageState();
}

class _StickerDetailPageState extends StickerDetailViewImpl {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalhe figurinha"),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(hasSticker ? 'assets/images/sticker.png' : 'assets/images/sticker_pb.png'),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text("$countryCode $stickerNumber",
                          style: context.textStyles.textPrimaryFontBold.copyWith(
                          fontSize: 22
                          ),
                  )
                ),
                const Spacer(),
                RoundedButton(
                  icon: Icons.remove,
                  onPressed: widget.presenter.decrementAmount,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text("$amount", style: context.textStyles.textSecondaryFontMedium,),
                ),
                RoundedButton(
                  icon: Icons.add,
                  onPressed:  widget.presenter.incrementAmount
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.only(left: 15, bottom: 10),
              alignment: Alignment.centerLeft,
              child: Text("$countryName", style: context.textStyles.textPrimaryFontRegular,),
            ),
            Button.primary(
              width: MediaQuery.of(context).size.width * .9,
              label: hasSticker ? "Atualizar figurinha" : "Adicionar figurinha",
              onPressed: widget.presenter.saveSticker
            ),
            Button(
              label: "Excluir figurinha",
              onPressed: widget.presenter.deleteSticker,
              width: MediaQuery.of(context).size.width * .9,
              outline: true,
              style: context.buttonStyles.primaryOutlineButton,
              labelStyle: context.textStyles.textSecondaryFontExtraBoldPrimaryColor,
            )
          ],
        ),
        )
      ),
    );
  }
}