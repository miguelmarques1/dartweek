// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:dartweek/app/models/user_sticker_model.dart';

class GroupStickers {
  final int id;
  final String countryCode;
  final String countryName;
  final int stickersStart;
  final int stickersEnd;
  final List<UserStickerModel> stickers;
  final String flag;

  GroupStickers({required this.id, required this.countryCode, required this.countryName, required this.stickersStart, required this.stickersEnd, required this.stickers, required this.flag});


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'country_code': countryCode,
      'country_name': countryName,
      'stickers_start': stickersStart,
      'stickers_end': stickersEnd,
      'stickers': stickers.map((x) => x.toMap()).toList(),
      'flag': flag,
    };
  }

  factory GroupStickers.fromMap(Map<String, dynamic> map) {
    return GroupStickers(
      id: map['id'] as int,
      countryCode: map['country_code'] as String,
      countryName: map['country_name'] as String,
      stickersStart: map['stickers_start'] as int,
      stickersEnd: map['stickers_end'] as int,
      stickers: List<UserStickerModel>.from((map['stickers'] as List<dynamic>).map<UserStickerModel>((x) => UserStickerModel.fromMap(x as Map<String,dynamic>),),),
      flag: map['flag'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory GroupStickers.fromJson(String source) => GroupStickers.fromMap(json.decode(source) as Map<String, dynamic>);
}
