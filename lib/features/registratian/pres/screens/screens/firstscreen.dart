import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../home/pres/view/widget/splachscrean.dart';

import '../../../../notification/data/notificationrepo.dart';
import '../../../../notification/presination/view/notificationscrean.dart';
import '../../cubit/usercubit.dart';

class Firstscreen extends StatefulWidget {
  const Firstscreen({
    super.key,
  });

  @override
  State<Firstscreen> createState() => _FirstscreenState();
}

class _FirstscreenState extends State<Firstscreen> {
  @override
     void initState() {
    super.initState();

 
    listnToNotification();
  }

  int notificationId = 1;

  void listnToNotification() {
    LocalNotificationService.streamController.stream
        .listen((notificationresponse) {
      //listn is object to use it
      log('stream work');

      log(notificationresponse.payload ?? 'null');
      log(notificationresponse.id.toString());
      log(notificationresponse.notificationResponseType.toString());
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return Notificationscrean(datumnot: [],);
      }));
    });
  }
@override
  Widget build(BuildContext context) {
   
    return const Scaffold(
      resizeToAvoidBottomInset: true,
      body: Splachscrean(),
    );
  }
}
