import 'package:dartweek/app/core/exceptions/repository_exception.dart';
import 'package:dartweek/app/models/sticker_model.dart';
import 'package:dartweek/app/models/user_sticker_model.dart';
import 'package:dartweek/app/pages/sticker_detail/view/sticker_detail_view.dart';
import 'package:dartweek/app/repository/stickers/sticker_repository.dart';
import 'package:dartweek/app/services/sticker/find_sticker_service.dart';

import './sticker_detail_presenter.dart';

class StickerDetailPresenterImpl implements StickerDetailPresenter {
  
  late final StickerDetailView _view;
  final FindStickerService findStickerService;
  UserStickerModel? stickerUser;
  final StickerRepository stickerRepository;
  StickerModel? sticker;
  int amount = 0;

  StickerDetailPresenterImpl({required this.findStickerService, required this.stickerRepository});

  @override
  set view(StickerDetailView view) => _view = view;

  @override
  Future<void> load({required String countryCode, required String stickerNumber, required String countryName, UserStickerModel? stickerUser}) async {
    this.stickerUser = stickerUser;
    if(stickerUser == null) {
      sticker = await findStickerService.execute(countryCode, stickerNumber);
    }

    bool hasSticker = stickerUser != null;

    if(hasSticker) {
      amount = stickerUser.duplicate + 1;
    }


    _view.screenLoaded(hasSticker, countryCode, stickerNumber, countryName, amount);

  }
  
  @override
  void decrementAmount() {
    if(amount > 1) {
      _view.updateAmount(--amount);
    }
  }
  
  @override
  void incrementAmount() {
    _view.updateAmount(++amount);
  }
  
  @override
  Future<void> saveSticker() async {
      try {
        _view.showLoader();
        if(stickerUser == null) {
          await stickerRepository.registerUserSticker(sticker!.id, amount);
        } else {
          await stickerRepository.updateUserSticker(stickerUser!.idSticker, amount);
        }
        _view.saveSuccess();
      } catch (e) {
        _view.error("Erro ao atualizar as figurinhas");
      }
  }

  @override
  Future<void> deleteSticker() async {
    try {
      _view.showLoader();
      if(stickerUser != null) {
        await stickerRepository.updateUserSticker(stickerUser!.id, 0);
      }
      _view.saveSuccess();
    } catch (e) {
     _view.error("Erro ao excluir a figurinha"); 
    }
  }
}