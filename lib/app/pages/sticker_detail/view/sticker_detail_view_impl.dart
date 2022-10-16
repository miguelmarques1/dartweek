import 'package:dartweek/app/core/ui/helpers/loader.dart';
import 'package:dartweek/app/core/ui/helpers/messages.dart';
import 'package:dartweek/app/pages/sticker_detail/sticker_detail_page.dart';
import 'package:flutter/material.dart';
import './sticker_detail_view.dart';

abstract class StickerDetailViewImpl extends State<StickerDetailPage> with Loader<StickerDetailPage>, Messages<StickerDetailPage> implements StickerDetailView {

  bool hasSticker = true;
  String countryCode = '';
  String stickerNumber = '';
  String countryName = '';
  int amount = 0;



  @override
  void initState() {
    // TODO: implement initState
    widget.presenter.view = this;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      showLoader();
      var arguments = ModalRoute.of(context)?.settings.arguments;
      if(arguments != null && arguments is Map<String, dynamic>) {
        widget.presenter.load(countryCode: arguments['countryCode'], stickerNumber: arguments['stickerNumber'], countryName: arguments['countryName'], stickerUser: arguments['stickerUser']);
      } else {
        hideLoader();
        Navigator.of(context).pop();
        showError("Não foi possível carregar a figurinha");
      }
    });
    super.initState();
  }
  void screenLoaded(bool hasSticker, String countryCode, String stickerNumber, String countryName, int amount){
    hideLoader();
    setState(() {
      this.hasSticker = hasSticker;
      this.countryCode = countryCode;
      this.stickerNumber = stickerNumber;
      this.countryName = countryName;
      this.amount = amount;
    });
  }

  void updateAmount(int amount) {
    setState(() {
      this.amount = amount;
    });
  }

  void saveSuccess() {
    hideLoader();
    Navigator.of(context).pop();
  }

  void error(String message) {
    hideLoader();
    showError(message);
  }
}