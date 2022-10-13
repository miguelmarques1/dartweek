import 'package:dartweek/app/core/ui/styles/button_styles.dart';
import 'package:dartweek/app/core/ui/styles/colors_app.dart';
import 'package:dartweek/app/core/ui/styles/text_styles.dart';
import 'package:dartweek/app/core/ui/widgets/button.dart';
import 'package:dartweek/app/pages/my_stickers/my_stickers_page.dart';
import 'package:dartweek/app/pages/my_stickers/presenter/my_stickers_presenter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class StickerStatusFilter extends StatefulWidget {

  final String filterSelected;

  const StickerStatusFilter({super.key, required this.filterSelected});

  @override
  State<StickerStatusFilter> createState() => _StickerStatusFilterState();
}

class _StickerStatusFilterState extends State<StickerStatusFilter> {
  @override
  Widget build(BuildContext context) {
    final presenter = context.get<MyStickersPresenter>();
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      width: MediaQuery.of(context).size.width,
      child: Wrap(
        spacing: 5,
        alignment: WrapAlignment.center,
        children: [
          Button(
            width: MediaQuery.of(context).size.width * .3,
            onPressed: () {
              presenter.statusFilter('all');
            },
            style: widget.filterSelected == 'all' ? context.buttonStyles.yellowButton : context.buttonStyles.primaryButton,
            label: 'Todas', 
            labelStyle:  widget.filterSelected == 'all' ? context.textStyles.textSecondaryFontMedium.copyWith(color: context.colors.primary) : context.textStyles.textSecondaryFontMedium,
            ),
            Button(
            width: MediaQuery.of(context).size.width * .3,
            onPressed: () {
              presenter.statusFilter('missing');
            },
            style: widget.filterSelected == 'missing' ? context.buttonStyles.yellowButton : context.buttonStyles.primaryButton,
            label: 'Faltando', 
            labelStyle: widget.filterSelected == 'missing' ? context.textStyles.textSecondaryFontMedium.copyWith(color: context.colors.primary) : context.textStyles.textSecondaryFontMedium
            ),
            Button(
            width: MediaQuery.of(context).size.width * .3,
            onPressed: () {
              presenter.statusFilter('repeated');
            },
            style: widget.filterSelected == 'repeated' ? context.buttonStyles.yellowButton : context.buttonStyles.primaryButton,
            label: 'Repetidas', 
            labelStyle: widget.filterSelected == 'repeated' ? context.textStyles.textSecondaryFontMedium.copyWith(color: context.colors.primary) : context.textStyles.textSecondaryFontMedium
            )
        ],
      ),
    );
  }
}