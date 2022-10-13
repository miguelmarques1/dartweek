class UserStickerModel {
  final int id;
  final int idUser;
  final int idSticker;
  final int duplicate;
  final String stickerCode;
  final String stickerNumber;

  UserStickerModel({required this.id, required this.idUser, required this.idSticker, required this.duplicate, required this.stickerCode, required this.stickerNumber});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'id_user': idUser,
      'id_sticker': idSticker,
      'duplicate_sticker': duplicate,
      'sticker_code': stickerCode,
      'sticker_number': stickerNumber
    };
  }

  factory UserStickerModel.fromMap(Map<String, dynamic> map) {
    return UserStickerModel(
      id: map['id'], 
      idUser: map['id_user'], 
      idSticker: map['id_sticker'], 
      duplicate: map['duplicate_stickers'], 
      stickerCode: map['sticker_code'], 
      stickerNumber: map['sticker_number']
      );
  }
}