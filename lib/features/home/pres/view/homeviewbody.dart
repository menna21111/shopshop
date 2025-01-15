import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopshop/costant/colors.dart';
import 'package:shopshop/features/home/pres/manager/productcubit.dart/productcubit.dart';
import 'package:shopshop/features/registratian/pres/cubit/usercubit.dart';

import '../../../../costant/size.dart';
import '../../../notification/data/notificationrepo.dart';
import '../../../notification/presination/view/notificationscrean.dart';
import '../manager/BANNERCUBIT/bannercubit.dart';
import '../manager/CATEGORYCUBIT/catagoryCubit.dart';

import 'screans/productscrean.dart';
import 'widget/appbarforhome.dart';
import 'widget/banners.dart';
import 'widget/listcatagory.dart';
import 'widget/productgridhomesales.dart';

class Homeviewbody extends StatelessWidget {
  const Homeviewbody({super.key});

  @override
  Widget build(BuildContext context) {
    Screan_size.init(context);

    context.read<Bannercubit>().getBanner();
    context.read<UserCubit>().getuser();
    context.read<Catagorycubit>().geTcatagroy();
    context.read<Productcubit>().getproduct();

    return Container(
      color: khomecolor,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: CustomScrollView(slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const Appbar(),
                  SizedBox(
                    height: Screan_size.hieght * 0.025,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: Screan_size.width * 0.04,
                        vertical: Screan_size.width * 0.04),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '# special offer',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: Screan_size.width * 0.045,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          'see all',
                          style: TextStyle(
                              color: khomecolor,
                              fontSize: Screan_size.width * 0.035,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                  Banners(),
                  SizedBox(
                    height: Screan_size.hieght * 0.02,
                  )
                ],
              ),
            ),
            const SliverToBoxAdapter(
              child: ListCategry(),
            ),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: Screan_size.hieght * 0.02,
                  ),
                  Padding(
                    padding: EdgeInsets.all(Screan_size.width * 0.06),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'sales% off',
                          style: TextStyle(
                              color: khomecolor,
                              fontSize: Screan_size.width * 0.045,
                              fontWeight: FontWeight.bold),
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const Productscrean()));
                            },
                            child: Text('see all',
                                style: TextStyle(
                                  color: khomecolor,
                                  fontSize: Screan_size.width * 0.035,
                                )))
                      ],
                    ),
                  )
                ],
              ),
            ),
            const Productgridhome()
          ]),
        ),
      ),
    );
  }
}
