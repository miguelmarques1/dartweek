import 'dart:developer';

import 'package:dartweek/app/core/exceptions/repository_exception.dart';
import 'package:dartweek/app/models/group_stickers.dart';
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
}