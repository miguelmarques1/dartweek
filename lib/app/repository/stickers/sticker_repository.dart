import 'package:dartweek/app/models/group_stickers.dart';

abstract class StickerRepository {
  Future<List<GroupStickers>> getMyAlbum();
}