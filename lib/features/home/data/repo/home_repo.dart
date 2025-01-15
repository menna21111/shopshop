import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shopshop/core/eror/failure.dart';

import '../../../../core/utls/apiservice.dart';
import '../../../../core/utls/cach_helper.dart';
import '../models/addorderresponse/addorderresponse.dart';
import '../../../cart/data/model/addtocart/addtocart.dart';
import '../models/addtofav/addtofav.dart';
import '../models/adreesresponse/adreesresponse.dart';
import '../models/bannermodel.dart/banner_model/banner_model.dart';
import '../models/bannermodel.dart/banner_model/datum.dart';
import '../models/categories_model/categories_model.dart';
import '../models/categories_model/datum.dart';
import '../models/estimatordersponse/data.dart';
import '../models/estimatordersponse/estimatordersponse.dart';
import '../../../cart/data/model/getcart/cart_item.dart';
import '../../../cart/data/model/getcart/getcart.dart';
import '../models/getfav/datum.dart';
import '../models/getfav/getfav.dart';
import '../models/getordermodel/datum.dart';
import '../models/getordermodel/getcartmodel.dart';
import '../models/home_model/product.dart';
import '../models/notficationmo/datum.dart';
import '../models/notficationmo/notficationmo.dart';
import '../models/orderdetails/data.dart';
import '../models/orderdetails/orderdetails.dart';
import '../models/productmodel/productmodel.dart';
import '../models/searchresultmodel/datum.dart';
import '../models/searchresultmodel/searchresultmodel.dart';
import '../models/updatecard/data.dart';
import '../models/updatecard/updatecard.dart';

class HomeRepo {
  final Apiservice apiservice;
  HomeRepo(
    this.apiservice,
  );
  Future<Either<Failure, List<Datum>>> getBanners() async {
    try {
      final response = await apiservice.get(endpoint: 'banners');
      final bannermodel = BannerModel.fromJson(response);
      final List<Datum> banners = [];
      for (var element in response['data']) {
        banners.add(Datum.fromJson(element));
      }
      if (bannermodel.status == true) {
        return right(banners);
      } else {
        return left(ServerFailure.fromResponse(200, response));
      }
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, List<Datuum>>> getcategories() async {
    try {
      final response = await apiservice.get(
        endpoint: 'categories',
        options: Options(
          headers: {
            'Authorization': '${CacheHelper().getData(key: 'token')}',
            'Content-Type': 'application/json',
          },
        ),
      );
      final catedorymodel = CategoriesModel.fromJson(response);
      final List<Datuum> catagory = [];
      for (var element in response['data']['data']) {
        catagory.add(Datuum.fromJson(element));
      }
      if (catedorymodel.status == true) {
        return right(catagory);
      } else {
        return left(ServerFailure.fromResponse(200, response));
      }
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, List<Datumnot>>> getnotications() async {
    try {
      final response = await apiservice.get(
        endpoint: 'notifications',
        options: Options(
          headers: {
            'Authorization': '${CacheHelper().getData(key: 'token')}',
            'Content-Type': 'application/json',
          },
        ),
      );
      final notifymodel = Notficationmo.fromJson(response);
      final List<Datumnot> notific = [];
      for (var element in response['data']['data']) {
        notific.add(Datumnot.fromJson(element));
      }
      if (notifymodel.status == true) {
        return right(notific);
      } else {
        return left(ServerFailure.fromResponse(200, response));
      }
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, Addtofav>> addtofav({
    required int id,
  }) async {
    try {
      final token = CacheHelper().getData(key: 'token');
      log('Token: $token');
      log('Authorization Token: ${CacheHelper().getData(key: 'token')}');
      final response = await apiservice.post(
        endpoint: 'favorites',
        data: {
          'product_id': id,
        },
        options: Options(
          headers: {
            'Authorization': '${CacheHelper().getData(key: 'token')}',
            'Content-Type': 'application/json',
          },
        ),
      );

      log('Response: ${response.toString()}'); // To log the response for debugging

      final addtofav = Addtofav.fromJson(response);
      log('Addtofav response received');

      if (addtofav.status == true) {
        return right(addtofav);
      } else {
        return left(ServerFailure.fromResponse(200, response));
      }
    } catch (e) {
      log('Error: $e');
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, Addtocart>> addttocart({
    required int id,
  }) async {
    try {
      final token = CacheHelper().getData(key: 'token');
      log('Token: $token');
      log('Authorization Token: ${CacheHelper().getData(key: 'token')}');
      final response = await apiservice.post(
        endpoint: 'carts',
        data: {
          'product_id': id,
        },
        options: Options(
          headers: {
            'Authorization': '${CacheHelper().getData(key: 'token')}',
            'Content-Type': 'application/json',
          },
        ),
      );

      log('Response: ${response.toString()}'); // To log the response for debugging

      final addtocart = Addtocart.fromJson(response);
      log('addtocart response received');

      if (addtocart.status == true) {
        return right(addtocart);
      } else {
        return left(ServerFailure.fromResponse(200, response));
      }
    } catch (e) {
      log('Error: $e');
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, List<Product>>> getproducts() async {
    try {
      final response = await apiservice.get(
        endpoint: 'products',
        options: Options(
          headers: {
            'Authorization': '${CacheHelper().getData(key: 'token')}',
            'Content-Type': 'application/json',
          },
        ),
      );
      final productmodell = Productmodel.fromJson(response);
      final List<Product> products = [];
      for (var element in response['data']['data']) {
        products.add(Product.fromJson(element));
      }
      if (productmodell.status == true) {
        return right(products);
      } else {
        return left(ServerFailure.fromResponse(200, response));
      }
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, List<CartItem>>> getcart() async {
    try {
      final response = await apiservice.get(
        endpoint: 'carts',
        options: Options(
          headers: {
            'Authorization': '${CacheHelper().getData(key: 'token')}',
            'Content-Type': 'application/json',
          },
        ),
      );
      final productmodell = Getcart.fromJson(response);
      log('response coe true');

      if (productmodell.status == true) {
        final List<CartItem> getitemcart = [];
        for (var element in response['data']['cart_items']) {
          getitemcart.add(CartItem.fromJson(element));
        }
        if (!getitemcart.isEmpty) {
          return right(getitemcart);
        } else {
          return left(ServerFailure('Cart is empty'));
        }
      } else {
        return left(ServerFailure.fromResponse(200, response));
      }
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, List<Datuwm>>> getfav() async {
    try {
      final response = await apiservice.get(
        endpoint: 'favorites',
        options: Options(
          headers: {
            'Authorization': '${CacheHelper().getData(key: 'token')}',
            'Content-Type': 'application/json',
          },
        ),
      );
      final productmodell = Getfav.fromJson(response);

      if (productmodell.status == true) {
        final List<Datuwm> getfav = [];
        for (var element in response['data']['data']) {
          getfav.add(Datuwm.fromJson(element));
        }
        if (!getfav.isEmpty) {
          return right(getfav);
        } else {
          return left(ServerFailure('fav is empty'));
        }
      } else {
        return left(ServerFailure.fromResponse(200, response));
      }
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, DataOrderDetails>> getorderdetailss(
      {required int id}) async {
    try {
      final response = await apiservice.get(
        endpoint: 'orders/$id',
        options: Options(
          headers: {
            'Authorization': '${CacheHelper().getData(key: 'token')}',
            'Content-Type': 'application/json',
          },
        ),
      );
      final productmodell = OrderDetails.fromJson(response);

      if (productmodell.status == true) {
        final products = DataOrderDetails.fromJson(response['data']);
        return right(products);
      } else {
        return left(ServerFailure.fromResponse(200, response));
      }
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, List<Datumorder>>> getorder() async {
    try {
      final response = await apiservice.get(
        endpoint: 'orders',
        options: Options(
          headers: {
            'Authorization': '${CacheHelper().getData(key: 'token')}',
            'Content-Type': 'application/json',
          },
        ),
      );
      final productmodell = Getordermodel.fromJson(response);

      if (productmodell.status == true) {
        final List<Datumorder> products = [];
        for (var element in response['data']['data']) {
          products.add(Datumorder.fromJson(element));
        }
        return right(products);
      } else {
        return left(ServerFailure.fromResponse(200, response));
      }
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, Adreesresponse>> addAddress({
    required String name,
    required String city,
    required String region,
    required String details,
    required double latitude,
    required double longitude,
    String? notes,
  }) async {
    try {
      final token = CacheHelper().getData(key: 'token');
      log('Token: $token');
      log('Authorization Token: ${CacheHelper().getData(key: 'token')}');

      final response = await apiservice.post(
        endpoint: 'addresses',
        data: {
          'name': name,
          'city': city,
          'region': region,
          'details': details,
          'latitude': latitude,
          'longitude': longitude,
          'notes': notes ?? '',
        },
        options: Options(
          headers: {
            'Authorization': '${CacheHelper().getData(key: 'token')}',
            'Content-Type': 'application/json',
          },
        ),
      );

      log('Response: ${response.toString()}');

      final adreesresponse = Adreesresponse.fromJson(response);
      log('addAddress response received');

      if (adreesresponse.status == true) {
        return right(adreesresponse);
      } else {
        return left(ServerFailure.fromResponse(200, response));
      }
    } catch (e) {
      log('Error: $e');
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, Addorderresponse>> addorder({
    required int addressid,
    required int paymentmethod,
    required bool usepoints,
  }) async {
    try {
      final token = CacheHelper().getData(key: 'token');
      log('Token: $token');
      log('Authorization Token: ${CacheHelper().getData(key: 'token')}');

      final response = await apiservice.post(
        endpoint: 'orders',
        data: {
          'address_id': addressid,
          'payment_method': paymentmethod,
          'use_points': usepoints
        },
        options: Options(
          headers: {
            'Authorization': '${CacheHelper().getData(key: 'token')}',
            'Content-Type': 'application/json',
          },
        ),
      );

      log('Response: ${response.toString()}');

      final adreesresponse = Addorderresponse.fromJson(response);
      log('addAddress response received');

      if (adreesresponse.status == true) {
        return right(adreesresponse);
      } else {
        return left(ServerFailure.fromResponse(200, response));
      }
    } catch (e) {
      log('Error: $e');
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, List<Datumsearch>>> search({
    required String text,
  }) async {
    try {
      final token = CacheHelper().getData(key: 'token');
      log('Token: $token');
      log('Authorization Token: ${CacheHelper().getData(key: 'token')}');

      final response = await apiservice.post(
        endpoint: 'products/search',
        data: {
          'text': text,
        },
        options: Options(
          headers: {
            'Authorization': '${CacheHelper().getData(key: 'token')}',
            'Content-Type': 'application/json',
          },
        ),
      );

      log('Response: ${response.toString()}');

      final adreesresponse = Searchresultmodel.fromJson(response);
      log('addAddress response received');

      if (adreesresponse.status == true) {
        final List<Datumsearch> products = [];
        for (var element in response['data']['data']) {
          products.add(Datumsearch.fromJson(element));
        }
        return right(products);
      } else {
        return left(ServerFailure.fromResponse(200, response));
      }
    } catch (e) {
      log('Error: $e');
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, Dataupdate>> updatecart(
      {required int count, required int id}) async {
    try {
      final token = CacheHelper().getData(key: 'token');
      log('Token: $token');
      log('Authorization Token: ${CacheHelper().getData(key: 'token')}');

      final response = await apiservice.put(
        endpoint: 'carts/$id',
        data: {
          'quantity': count,
        },
        options: Options(
          headers: {
            'Authorization': '${CacheHelper().getData(key: 'token')}',
            'Content-Type': 'application/json',
          },
        ),
      );

      log('Response: ${response.toString()}');

      final updatecardresponse = Updatecard.fromJson(response);
      log('updatedcart response received');
      final updatecard = Dataupdate.fromJson(response['data']);
      log('updatedcart  received');

      if (updatecardresponse.status == true) {
        return right(updatecard);
      } else {
        return left(ServerFailure.fromResponse(200, response));
      }
    } catch (e) {
      log('Error: $e');
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, Dataestm>> estimateorder({
    required bool usepoints,
    required int promocodeid,
  }) async {
    try {
      final token = CacheHelper().getData(key: 'token');
      log('Token: $token');
      log('Authorization Token: ${CacheHelper().getData(key: 'token')}');

      final response = await apiservice.post(
        endpoint: 'estimate-order',
        data: {
          'use_points': usepoints,
          'promo_code_id': promocodeid,
        },
        options: Options(
          headers: {
            'Authorization': '${CacheHelper().getData(key: 'token')}',
            'Content-Type': 'application/json',
          },
        ),
      );
      log('response of estimatr');
      log('Response: ${response.toString()}');

      final estimateordersresponse = Estimatordersponse.fromJson(response);
      final estimateordersdataresponse = Dataestm.fromJson(response['data']);

      log('estimateorder response received');

      if (estimateordersresponse.status == true) {
        return right(estimateordersdataresponse);
      } else {
        return left(ServerFailure.fromResponse(200, response));
      }
    } catch (e) {
      log('Error: $e');
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, Adreesresponse>> deleteitemfromfav(
      {required int idd}) async {
    try {
      final token = CacheHelper().getData(key: 'token');
      log('Token: $token');
      log('Authorization Token: ${CacheHelper().getData(key: 'token')}');

      final response = await apiservice.delete(
        endpoint: 'addresses/$idd',
        options: Options(
          headers: {
            'Authorization': '${CacheHelper().getData(key: 'token')}',
            'Content-Type': 'application/json',
          },
        ),
      );

      log('Response: ${response.toString()}');

      final adreesresponse = Adreesresponse.fromJson(response);
      log('addAddress response received');

      if (adreesresponse.status == true) {
        return right(adreesresponse);
      } else {
        return left(ServerFailure.fromResponse(200, response));
      }
    } catch (e) {
      log('Error: $e');
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
