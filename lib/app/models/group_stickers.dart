import 'user_sticker_model.dart';

class GroupStickers {
  final int id;
  final String countryCode;
  final String countryName;
  final int stickersStart;
  final int stickersEnd;
  final List<dynamic> stickers;
  final String flag;

  GroupStickers({required this.id, required this.countryCode, required this.countryName, required this.stickersStart, required this.stickersEnd, required this.stickers, required this.flag});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'counter_code': countryCode,
      'country_name': countryName,
      'stickers_start': stickersStart,
      'stickesr_end': stickersEnd,
      'stickers': stickers.map((x) => x.toMap()).toList(),
      'flag': flag
    };
  }

  factory GroupStickers.fromMap(Map<String, dynamic> map) {
    return GroupStickers(
      id: map['id'], 
      countryCode: map['country_code'], 
      countryName: map['country_name'], 
      stickersStart: map['stickers_start'], 
      stickersEnd: map['stickers_end'], 
      stickers: map['stickers'], 
      flag: map['flag']
      );
  }
}