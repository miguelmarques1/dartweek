import 'dart:developer';

import 'package:dartweek/app/core/exceptions/repository_exception.dart';
import 'package:dartweek/app/core/exceptions/unauthorized_exception.dart';
import 'package:dartweek/app/models/register_user_model.dart';
import 'package:dio/dio.dart';

import '../../core/rest/custom_dio.dart';
import './auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {

  final CustomDio dio;

  AuthRepositoryImpl({required this.dio});

  @override
  Future<void> register(RegisterUserModel registerModel) async {
    try {
      await dio.unAuth().post('/api/register', data: registerModel.toMap());
    } on DioError catch (e, s) {
      log("Erro ao registrar o usuário", error: e, stackTrace: s);
      throw RepositoryException("Erro ao registrar o usuário");
    }
  }
  
  @override
  Future<String> login({required String email, required String password}) async {
    final result = await dio.unAuth().post('/api/auth', data: {
      'email': email,
      'password': password
    });

    try {
      final accessToken = result.data['access_token'];
      if(accessToken == null) {
        throw UnauthorizedException();
      }
      
      return accessToken;
    } on DioError catch (e, s) {
      log('Erro ao realizar login', error: e, stackTrace: s);
      if(e.response?.statusCode == 401) {
        throw UnauthorizedException();
      }

      throw RepositoryException("Erro ao realizar o login");
    }
  }
  
  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

}