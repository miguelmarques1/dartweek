import 'package:dartweek/app/core/ui/styles/colors_app.dart';
import 'package:dartweek/app/core/ui/styles/text_styles.dart';
import 'package:dartweek/app/models/group_stickers.dart';
import 'package:dartweek/app/models/user_sticker_model.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class StickerGroup extends StatelessWidget {

  final String statusFilter;
  final GroupStickers group;

  const StickerGroup({ super.key, required this.group, required this.statusFilter });

   @override
   Widget build(BuildContext context) {
       return Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 64,
              child: OverflowBox(
                maxWidth: double.infinity,
                maxHeight: 700,
                child: ClipRect(
                  child: Align(
                    alignment: const Alignment(0, -0.1),
                    widthFactor: 1,
                    heightFactor: 0.1,
                    child: Image.network(group.flag,
                      cacheHeight: (MediaQuery.of(context).size.width * 3).toInt(),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(group.countryName,
                style: context.textStyles.titleBlack.copyWith(
                  fontSize: 26
                ),
              ),
            ),
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 20,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10
              ),
              itemBuilder: (context, index) {
                final stickerNumber = '${group.stickersStart + index}';
                final stickerList = group.stickers.where((sticker) => sticker.stickerNumber == stickerNumber);
                final sticker = stickerList.isNotEmpty ? stickerList.first : null;
                final stickerWidget = Sticker(stickerNumber: stickerNumber, countryCode: group.countryCode, sticker: sticker, countryName: group.countryName,);
                if(statusFilter == 'all') {
                  return stickerWidget;
                } else if(statusFilter == 'missing') {
                  if(sticker == null) {
                    return stickerWidget;
                  }
                } else if(statusFilter == 'repeated') {
                  if(sticker != null && sticker.duplicate > 0) {
                    return stickerWidget;
                  }
                }
                return const SizedBox.shrink();
              },
            )
          ],
        ),
       );
  }
}

class Sticker extends StatelessWidget {
  final String countryCode;
  final String stickerNumber;
  final String countryName;
  final UserStickerModel? sticker;
  const Sticker({
    required this.stickerNumber,
    required this.countryCode,
    required this.sticker,
    required this.countryName,
    Key? key
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        color: ( sticker?.duplicate ?? 0) > 0 ? context.colors.primary : context.colors.grey,
        child: Column(
          children: [
            Visibility(
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              visible: (sticker?.duplicate ?? 0 ) > 0,
              child: Container(
                alignment: Alignment.topRight,
                padding: const EdgeInsets.all(2),
                child: Text("${(sticker?.duplicate ?? 0) > 0}",
                  style: context.textStyles.textSecondaryFontMedium.copyWith(
                    color: context.colors.yellow
                  ),
                ),
              ),
            ),
            Text(countryCode,
              style: context.textStyles.textSecondaryFontExtraBold.copyWith(
                color: sticker != null ? Colors.white : Colors.black
              ),
            ),
            Text("$stickerNumber",
              style: context.textStyles.textSecondaryFontExtraBold.copyWith(
                color: sticker != null ? Colors.white : Colors.black
              ),
            )
          ],
        ),
      ),
    );
  }
}