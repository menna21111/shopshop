import 'dart:async';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../../core/eror/failure.dart';
import '../../../core/utls/apiservice.dart';
import '../../../core/utls/cach_helper.dart';
import '../../home/data/models/notficationmo/datum.dart';
import '../../home/data/models/notficationmo/notficationmo.dart';
import 'models/setfcmtokenresponse.dart';

class Notificationrepo {
  final Apiservice? apiservice;

  Notificationrepo({this.apiservice});
  Future<Either<Failure, List<Datumnot>>> getnotications() async {
    try {
      final response = await apiservice!.get(
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

  Future<Either<Failure, Setfcmtokenresponse>> sendnotications(String token) async {
    try {
      final response = await Dio().post( 'https://student.valuxapps.com/api/fcm-token',
       data : {'token': token},
        
        options: Options(
          headers: {
            'Authorization': '${CacheHelper().getData(key: 'token')}',
            'Content-Type': 'application/json',
          },
        ),
      );
      log('sendnotification response received');
      final notifymodel = Setfcmtokenresponse.fromJson(response.data);
     log('sendnotification modeling response received');
      
      if (notifymodel.status == true) {
        return right(notifymodel);
      } else {
        return left(ServerFailure.fromResponse(200, response));
      }
    } catch (e) {
      if (e is DioException) {
        log('Error: $e');
        return left(ServerFailure.fromDioError(e));
      }
log('Error: $e');
      return left(ServerFailure(e.toString()));
    }
  }
}

class NotificationService {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;

  static Future init() async {
    await messaging.requestPermission();
    String? token = await messaging.getToken().then((value) {
      // Notificationrepo().sendnotications(value!);
      return value;
    });
    log('token: $token');
    // log(token ?? 'null');
    //bakgroun app is cosebut work in background but that method also o killed
    FirebaseMessaging.onBackgroundMessage(handlefunct);
    FirebaseMessaging
        .onMessage //onmessage is stream to listen to message or data use in foreground
        .listen((message) {
      LocalNotificationService.showBasicNotification(
          1,
          message.notification?.title ?? 'null',
          message.notification?.body ?? 'null');
    });
    return token;
  }

  static Future<void> handlefunct(RemoteMessage message) async {
    await Firebase.initializeApp();
    log(message.notification?.title ?? 'null');
  }
}

class LocalNotificationService {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static StreamController<NotificationResponse> streamController =
      StreamController<NotificationResponse>.broadcast();
  static ontap(NotificationResponse notificationresponse) {
    // log('clicked');
    // log(notificationresponse.payload ?? 'null');
    // log(notificationresponse.id.toString());
    // log(notificationresponse.notificationResponseType.toString());
    streamController.add(
        notificationresponse); //to listen to response and when you want to open notification it happpen and go to righ place
  }

  static Future initialize() async {
    InitializationSettings settings = const InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: DarwinInitializationSettings(),
    );
    flutterLocalNotificationsPlugin.initialize(
      settings,
      onDidReceiveBackgroundNotificationResponse:
          ontap, //when click on notification it happen

      onDidReceiveNotificationResponse: ontap, //in foreground
    );
  }

  static void showBasicNotification(
      int notificationId, String title, String body) async {
    NotificationDetails details = NotificationDetails(
        android: AndroidNotificationDetails('id 1', 'basic notification',
            priority: Priority.high, //make notification apper above app
            importance: Importance.max,
            sound: RawResourceAndroidNotificationSound(
                'notificationsound.wav'.split('.').first)));
    await flutterLocalNotificationsPlugin.show(
        notificationId, title, body, details,
        payload: 'payload' // when open notification make it appear
        );
  }
}
