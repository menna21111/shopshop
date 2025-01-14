import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shopshop/features/registratian/pres/screens/screens/verifypage.dart';

import '../../../core/eror/failure.dart';
import '../../../core/func/upload_image.dart';
import '../../../core/utls/apiservice.dart';
import '../../../core/utls/cach_helper.dart';
import 'models/LOGINModel.dart';
import 'models/profilemodel.dart';
import 'models/profilemodel/data.dart';
import 'models/profilemodel/profilemodel.dart';
import 'models/signupmodel/signupmodel.dart';


class UserRepository {
  final Apiservice apiservice;

  UserRepository(this.apiservice);
  Future<Either<Failure, Data>> getuser() async {
    try {
      final response = await apiservice.get(
        endpoint: 'profile',
        options: Options(
          headers: {
            'Authorization': '${CacheHelper().getData(key: 'token')}',
            'Content-Type': 'application/json',
          },
        ),
      );
      final profilemodel = Profilemodel.fromJson(response);
      log('get user');
      if (profilemodel.status == true) {
        return right(Data.fromJson(response['data']));
      } else {
        return left(ServerFailure.fromResponse(200, response));
      }
    } catch (e) {
      if (e is DioException) {
        log('fail user');
        return left(ServerFailure.fromDioError(e));
      } else {
        log('fail user');
        return left(ServerFailure(e.toString()));
      }
    }// iam ok 
  }

  Future<Either<Failure, Signupmodel>> signup({
    required String email,
    required String password,
    required String phone,
    required String name,
    required XFile profilePic,
  }) async {
    try {
      final bytes = File(profilePic.path).readAsBytesSync();

      String img64 = base64Encode(bytes);
      final response = await apiservice.post(
        endpoint: 'register',
        data: {
          'email': email,
          'password': password,
          'phone': phone,
          'name': name,
          'image': img64,
        },
      );
      log('dddddddddddd');
      print(response);
      

    if (response is Map<String, dynamic> && response['status'] == true) {
      final user = Signupmodel.fromJson(response);
      return right(user);
    } else {
      final errorMessage = response['message'] ?? 'An error occurred';
      log('Signup failed: $errorMessage');
      
      return left(ServerFailure.fromResponse(200, errorMessage));
    }
    } catch (e) {
      print(e);
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, LoginModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await apiservice.post(endpoint: 'login', data: {
        'email': email,
        'password': password,
      });
      // String message = response['message'];
      log('dddddddddddd');
      print(response);
      final user = LoginModel.fromJson(response);
      // final decodedToken = JwtDecoder.decode(user.token);
      CacheHelper().saveData(key: 'token', value: user.data!.token);
      CacheHelper().saveData(key: 'name', value: user.data!.name);

      // CacheHelper().saveData(key: 'id', value: decodedToken['id']);

      log('wwwwwwwwwwwwwww');
      if (user.status == true) {
        return right(user);
      } else  {
        return left(ServerFailure.fromResponse(200, response));
      }
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, dynamic>> setfcmtoken({
    required String email,
  }) async {
    try {
      final response = await apiservice.post(endpoint: 'fcm-token', data: {
        'email': email,
      });
      // String message = response['message'];
      log('dddddddddddd');
      print(response);
      final user = LoginModel.fromJson(response);
      log('wwwwwwwwwwwwwww');
      return right(response);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, dynamic>> changePassword({
    required String newpassword,
    required String password,
  }) async {
    try {
      final response =
          await apiservice.post(endpoint: 'change-password', data: {
        'new_password': newpassword,
        '	current_password': password,
      });
      // String message = response['message'];
      log('response come from change password');
      print(response);
      final user = LoginModel.fromJson(response);
      log('response come from change password and convert to model');
      // return right(user);
      return right(response);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, dynamic>> resetPassword({
    required String email,
    required String password,
    required String code,
  }) async {
    try {
      final response = await apiservice.post(endpoint: 'reset-password', data: {
        'email': email,
        'password': password,
        'code': code,
      });
      // String message = response['message'];
      log('dddddddddddd');
      print(response);
      final user = LoginModel.fromJson(response);
      log('wwwwwwwwwwwwwww');
      // return right(user);
      return right(response);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, dynamic>> vrifycode({
    required String email,
    required String code,
  }) async {
    try {
      final response = await apiservice.post(endpoint: 'verify-code', data: {
        'email': email,
        'code': code,
      });
      // String message = response['message'];
      log('dddddddddddd');
      print(response);
      final user = LoginModel.fromJson(response);
      log('wwwwwwwwwwwwwww');
      // return right(user);
      return right(response);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, dynamic>> verifyemail({
    required String email,
  }) async {
    try {
      final response = await apiservice.post(endpoint: 'verify-email', data: {
        'email': email,
      });
      // String message = response['message'];
      log('dddddddddddd');
      print(response);
      final user = LoginModel.fromJson(response);
      log('wwwwwwwwwwwwwww');
      return right(response);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
