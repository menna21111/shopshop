import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopshop/costant/colors.dart';
import 'package:shopshop/features/home/pres/view/screans/cartscrean.dart';
import 'package:shopshop/features/home/pres/view/screans/favscrean.dart';
import 'package:shopshop/features/home/pres/view/screans/orderscrean.dart';

import '../../features/home/pres/view/homeviewbody.dart';
import '../../features/notification/data/notificationrepo.dart';
import '../../features/notification/presination/view/notificationscrean.dart';
import '../../features/registratian/pres/cubit/usercubit.dart';
import '../../features/registratian/pres/screens/screens/profile_screan.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  _BottomNavigationExampleState createState() =>
      _BottomNavigationExampleState();
}

class _BottomNavigationExampleState extends State<BottomNavigation> {
  int _selectedTab = 1;
  List<Widget> _pages = [];
  List<IconData> _listOfIcons = [];

  @override
  void initState() {
    super.initState();
    BlocProvider.of<UserCubit>(context).getuser();
    _initializePagesAndIcons();

  }

  int notificationId = 1;

 

  void _initializePagesAndIcons() {
    _pages = [
      const ProfileScrean(),
      const Homeviewbody(),
      const Orderscrean(),
      const Favscrean(),
    ];
    _listOfIcons = [
      Icons.person_4_outlined,
      Icons.home_outlined,
      Icons.archive_rounded,
      Icons.favorite_border_outlined,
    ];
  }

  void _changeTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // drawer: CustomDrawer(),
      body: _pages[_selectedTab],
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(top: 5),
        height: size.width * .162,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.15),
              blurRadius: 30,
              offset: const Offset(0, 10),
            ),
          ],
          borderRadius: BorderRadius.circular(2),
        ),
        child: ListView.builder(
          itemCount: _listOfIcons.length,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: size.width * .024),
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              _changeTab(index);
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AnimatedContainer(
                    duration: Duration(milliseconds: 1500),
                    curve: Curves.fastLinearToSlowEaseIn,
                    margin: EdgeInsets.only(
                      bottom: index == _selectedTab ? 0 : size.width * .029,
                      right: size.width * .0422,
                      left: size.width * .0422,
                    ),
                    width: size.width * .128,
                    height: index == _selectedTab ? size.width * .014 : 0,
                    decoration: const BoxDecoration(
                      color: khomecolor,
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(10),
                      ),
                    ),
                  ),
                  Icon(
                    _listOfIcons[index],
                    size: size.width * .076,
                    color: index == _selectedTab ? khomecolor : Colors.black38,
                  ),
                  SizedBox(height: size.width * .028),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
