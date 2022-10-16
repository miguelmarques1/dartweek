import 'dart:developer';

import 'package:dartweek/app/core/exceptions/repository_exception.dart';
import 'package:dartweek/app/models/group_stickers.dart';
import 'package:dartweek/app/models/register_sticker_model.dart';
import 'package:dartweek/app/models/sticker_model.dart';
import 'package:dio/dio.dart';

import '../../core/rest/custom_dio.dart';
import './sticker_repository.dart';

class StickerRepositoryImpl implements StickerRepository {

  final CustomDio dio;

  StickerRepositoryImpl({required this.dio});

  @override
  Future<List<GroupStickers>> getMyAlbum() async {
    try {
      final result = await dio.auth().get('/api/countries');
      return result.data.map<GroupStickers>((g) => GroupStickers.fromMap(g)).toList();
    } on DioError catch (e, s) {
      log("Erro ao buscar album do usuario", error: e, stackTrace: s);
      throw RepositoryException("Erro ao buscar album do usuário");
    }
  }

  @override
  Future<StickerModel?> findStickerByCode(String stickerCode, String stickerNumber) async {
    try {
      final result = await dio.auth().get('/api/sticker-search', queryParameters: {
        'sticker_code': stickerCode, 
        'sticker_number': stickerNumber
      });
      
      return StickerModel.fromMap(result.data);
    } on DioError catch (e, s) {
      if(e.response?.statusCode == 404) {
        return null;
      }
      log("Erro ao buscar figurinha ", error: e, stackTrace: s);
      throw RepositoryException("Erro ao buscar figurinha");
    }
  }

  @override
  Future<StickerModel> createSticker(RegisterStickerModel registerStickerModel) async {
    try {
      final body = FormData.fromMap({
        ...registerStickerModel.toMap(),
        'sticker_image': ''
      });
      final result = await dio.auth().post('/api/sticker', data: body);
      return StickerModel.fromMap(result.data);
    } on DioError catch (e, s) {
      log("Erro ao registrar figurinha", error: e, stackTrace: s);
      throw RepositoryException("Erro ao registrar figurinha");
    }
  }
  
  @override
  Future<void> registerUserSticker(int stickerId, int amount) async {
    try {
      await dio.auth().post('/api/user/sticker', data: {
        'id_sticker': stickerId,
        'amount': amount
      });
    } on DioError catch (e, s) {
      log("Erro ao inserir figurinha", error: e, stackTrace: s);
      throw RepositoryException("Erro ao inserir figurinha no album do usuário");
    }
  }
  
  @override
  Future<void> updateUserSticker(int stickerId, int amount) async {
    try {
      await dio.auth().put('/api/user/sticker', data: {
        'id_sticker': stickerId,
        'amount': amount
      });
    } on DioError catch (e, s) {
      log("Erro ao atualizar figurinha", error: e, stackTrace: s);
      throw RepositoryException("Erro ao atualizar figurinha no album do usuário");
    }
  }
}