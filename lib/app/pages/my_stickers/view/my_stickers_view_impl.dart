import 'package:dartweek/app/core/ui/helpers/messages.dart';
import 'package:dartweek/app/pages/my_stickers/my_stickers_page.dart';
import 'package:dartweek/app/pages/my_stickers/widgets/sticker_group.dart';

import '../../../core/ui/helpers/loader.dart';
import '../../../models/group_stickers.dart';
import './my_stickers_view.dart';
import 'package:flutter/material.dart';

abstract class MyStickersViewImpl extends State<MyStickersPage> with Loader<MyStickersPage>, Messages<MyStickersPage> implements MyStickersView {

  var album = <GroupStickers>[];
  var statusFilter = 'all';
  var countries = <String, String>{};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.presenter.view = this;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      showLoader();
      widget.presenter.getMyAlbum();
    });
  }


  void error(String message) {
    showError(message);
  }

  void loadedPage(List<GroupStickers> album) {
    hideLoader();
    setState(() {
      this.album = album;
      countries = {
        for(var c in album) c.countryCode: c.countryName,
      };
    });
  }

  @override
  void updateStatusFilter(String status) {
    setState(() {
      this.statusFilter = status;
    });
  }

  void updateAlbum(List<GroupStickers> album) {
    hideLoader();
    setState(() {
      this.album = album;
    });
  }
}