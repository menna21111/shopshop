import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shopshop/core/utls/cach_helper.dart';
import 'package:shopshop/features/home/data/repo/home_repo.dart';
import 'package:shopshop/features/home/pres/manager/addorder/addordercubit.dart';
import 'package:shopshop/features/home/pres/manager/getorder/getordercubit.dart';
import 'package:shopshop/features/home/pres/manager/searchcubit.dart/searchcubit.dart';
import 'package:shopshop/firebase_options.dart';

import 'core/utls/apiservice.dart';
import 'features/home/pres/manager/BANNERCUBIT/bannercubit.dart';
import 'features/home/pres/manager/CATEGORYCUBIT/catagoryCubit.dart';
import 'features/home/pres/manager/addtocart/addtocartcubit.dart';
import 'features/home/pres/manager/addtofavubit/addtofavcubit.dart';
import 'features/home/pres/manager/adress/adresscubit.dart';
import 'features/home/pres/manager/estimateorder.dart/estimateordercubit.dart';
import 'features/home/pres/manager/getcart/getcartcubit.dart';
import 'features/home/pres/manager/getfav/getfavcubit.dart';
import 'features/home/pres/manager/getorder/getorderstate.dart';
import 'features/home/pres/manager/notific/notificcubit.dart';
import 'features/home/pres/manager/orderdetails.dart/orderdetailcubit.dart';
import 'features/home/pres/manager/productcubit.dart/productcubit.dart';
import 'features/home/pres/manager/updatecart/updatecubite.dart';
import 'features/notification/data/notificationrepo.dart';
import 'features/registratian/data/repo.dart';
import 'features/registratian/pres/cubit/usercubit.dart';
import 'features/registratian/pres/screens/screens/firstscreen.dart';
import 'package:geolocator/geolocator.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
 
  await CacheHelper().init(); 
  await Future.wait([//run in parallel but should.nt  one debend on other
      NotificationService.init().then((value) {
        log('tokenyyy: $value');
        Notificationrepo().sendnotications(value!);
      }),
  LocalNotificationService.initialize()
  ]);
  Dio dio = Dio();
  if (!kReleaseMode) {
    dio?.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
    ));
  }

  runApp(MyApp(
    dio: dio,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.dio});
  final Dio dio;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Apiservice apiservice = Apiservice(dio);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (BuildContext context) =>
                UserCubit(UserRepository(apiservice))),
        BlocProvider(
            create: (BuildContext context) =>
                Bannercubit(HomeRepo(apiservice))),
        BlocProvider(
            create: (BuildContext context) =>
                Catagorycubit(HomeRepo(apiservice))),
        BlocProvider(
            create: (BuildContext context) =>
                Catagorycubit(HomeRepo(apiservice))),
        BlocProvider(
            create: (BuildContext context) =>
                Productcubit(HomeRepo(apiservice))),
        BlocProvider(
            create: (BuildContext context) =>
                Addtofavcubit(HomeRepo(apiservice))),
        BlocProvider(
            create: (BuildContext context) =>
                Addtocartcubit(HomeRepo(apiservice))),
        BlocProvider(
            create: (BuildContext context) =>
                Getfavcubit(HomeRepo(apiservice))),
        BlocProvider(
            create: (BuildContext context) =>
                Getcartcubit(HomeRepo(apiservice))),
        BlocProvider(
            create: (BuildContext context) =>
                Estimateordercubit(HomeRepo(apiservice))),
        BlocProvider(
            create: (BuildContext context) =>
                Notificcubit(HomeRepo(apiservice))),
        BlocProvider(
            create: (BuildContext context) =>
                Adresscubit(HomeRepo(apiservice))),
        BlocProvider(
            create: (BuildContext context) =>
                Updatecubite(HomeRepo(apiservice))),
        BlocProvider(
            create: (BuildContext context) =>
                Getordercubit(HomeRepo(apiservice))),
                BlocProvider(
            create: (BuildContext context) =>
                Getorderdetailscubit(HomeRepo(apiservice))),
        BlocProvider(
            create: (BuildContext context) =>
                Searchcubit(HomeRepo(apiservice))),
        BlocProvider(
            create: (BuildContext context) =>
                Addordercubit(HomeRepo(apiservice))),
      ],
      child: MaterialApp(
          builder: (context, child) {
            return MediaQuery(
                data: MediaQuery.of(context)
                    .copyWith(textScaler: TextScaler.linear(1.0)),
                child: child!);
          },
          navigatorKey: navigatorKey,
          debugShowCheckedModeBanner: false,
          home: Firstscreen()),
    );
  }
}
