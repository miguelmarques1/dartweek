import 'package:dartweek/app/models/register_sticker_model.dart';
import 'package:dartweek/app/models/sticker_model.dart';
import 'package:dartweek/app/repository/stickers/sticker_repository.dart';

import './find_sticker_service.dart';

class FindStickerServiceImpl implements FindStickerService {
  
  final StickerRepository stickerRepository;

  FindStickerServiceImpl({required this.stickerRepository});


  @override
  Future<StickerModel> execute(String countryCode, String stickerNumber) async {
    var sticker = await stickerRepository.findStickerByCode(countryCode, stickerNumber);
    if(sticker == null) {
      //criar o sticker
      final registerSticker = RegisterStickerModel(
        stickerName: '',
        stickerCode: countryCode,
        stickerNumber: stickerNumber
        );
      sticker = await stickerRepository.createSticker(registerSticker);
    }
    return sticker;
  }
}