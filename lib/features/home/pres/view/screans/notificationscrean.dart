import 'package:flutter/material.dart';
import 'package:shopshop/costant/colors.dart';

import '../../../data/models/notficationmo/datum.dart';

class Notificationscrean extends StatelessWidget {
  const Notificationscrean({super.key, required this.datumnot});
  final List<Datumnot> datumnot;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Notifications'),
      ),
      body: ListView.builder(
        itemCount: datumnot.length, // number of items
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: khomecolor,
              border: Border.all(
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text('${datumnot[index].message}'),
          );
        },
      ),
    );
  }
}
