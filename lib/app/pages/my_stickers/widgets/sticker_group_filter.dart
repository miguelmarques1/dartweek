import 'package:dartweek/app/core/ui/styles/text_styles.dart';
import 'package:dartweek/app/pages/my_stickers/my_stickers_page.dart';
import 'package:dartweek/app/pages/my_stickers/presenter/my_stickers_presenter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_awesome_select/flutter_awesome_select.dart';
import 'package:flutter_getit/flutter_getit.dart';

class StickerGroupFilter extends StatefulWidget {
  final Map<String, String> countries;
  const StickerGroupFilter({super.key, required this.countries});

  @override
  State<StickerGroupFilter> createState() => _StickerGroupFilterState();
}

class _StickerGroupFilterState extends State<StickerGroupFilter> {

  List<String>? selected = [];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: SmartSelect<String>.multiple(
        title: 'Filtro',
        selectedValue: selected ?? [],
        onChange: (selectedValue) {
          setState(() {
            selected = selectedValue.value;
          });
          context.get<MyStickersPresenter>().countryFilter(selected);
        },
        choiceItems: S2Choice.listFrom(
            source: widget.countries.entries.map((e) => {'value': e.key, 'title': e.value}).toList(),
            value: (_, item) => item['value'] ?? '',
            title:  (_, item) => item['value'] ?? ''
            ),
          choiceType: S2ChoiceType.switches,
          modalType: S2ModalType.bottomSheet,
          choiceGrouped: true,
          modalFilter: false,
          placeholder: '',
          tileBuilder: (context, state) {
            return InkWell(
              onTap: state.showModal,
              child: _StickerGroupTile(label: state.selected.title?.join(', ') ?? 'Filtro', clearCallBack: (){selected = null; context.get<MyStickersPresenter>().countryFilter(selected);}),
            );
          },
      ),
    );
  }
}

class _StickerGroupTile extends StatelessWidget {
  final VoidCallback clearCallBack;
  final String label;
  const _StickerGroupTile({
    required this.label,
    required this.clearCallBack,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color(0xFFF0F0F0),
        borderRadius: BorderRadius.circular(20)
      ),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Row(children: [
          Icon(Icons.filter_list),
          const SizedBox(
             width: 5,
          ),
          Text(label,
            style: context.textStyles.textSecondaryFontRegular.copyWith(
              fontSize: 12
            ),
          ),
          const Spacer(),
          InkWell(
            onTap: clearCallBack,
            child: const Icon(Icons.clear),
          )
        ]),
      ),
    );
  }
}