import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:shopshop/costant/colors.dart';
import 'package:shopshop/costant/size.dart';

import '../../../../../core/utls/cach_helper.dart';
import '../../manager/notific/notificcubit.dart';
import '../../manager/notific/notificstate.dart';
import '../../manager/searchcubit.dart/searchcubit.dart';
import '../screans/cartscrean.dart';
import '../screans/notificationscrean.dart';
import '../screans/search.dart';

class Appbar extends StatelessWidget {
  const Appbar({super.key});

  @override
  Widget build(BuildContext context) {
    Screan_size.init(context);
    context.read<Notificcubit>().notific();
    return Container(
        padding: EdgeInsets.all(5),
        decoration: const BoxDecoration(
            color: khomecolor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            )),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'hellow ${CacheHelper().getData(key: 'name')}!',
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    BlocBuilder<Notificcubit, Notificstate>(
                        builder: (context, state) {
                      if (state is NotificstateSuccess) {
                        return Container(
                            color: Colors.white.withOpacity(.4),
                            height: 40,
                            width: 40,
                            child: IconButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) {
                                      return Notificationscrean(
                                        datumnot: state.datumnot,
                                      );
                                    },
                                  ));
                                },
                                icon: Badge.count(
                                  count: state.datumnot.length,
                                  child: SvgPicture.asset(
                                    'assets/image.svg',
                                  ),
                                )));
                      } else if (state is NotificstateFailure) {
                        return Container(
                            color: Colors.white.withOpacity(.4),
                            height: 40,
                            width: 40,
                            child: IconButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return const Cartscrean();
                                  },
                                ));
                              },
                              icon: SvgPicture.asset(
                                'assets/image.svg',
                              ),
                            ));
                      } else {
                        return Container(
                            color: Colors.white.withOpacity(.4),
                            height: 40,
                            width: 40,
                            child: IconButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) {
                                      return const Cartscrean();
                                    },
                                  ));
                                },
                                icon: Badge.count(
                                  count: 0,
                                  child: SvgPicture.asset(
                                    'assets/image.svg',
                                  ),
                                )));
                      }
                    })
                  ]),
            ),
            SizedBox(
              height: Screan_size.hieght * 0.075,
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Container(
                  height: Screan_size.hieght * 0.085,
                  width: Screan_size.width * 0.75,
                  child: TextFormField(
                    readOnly: true,
                    onTap: () {
                      showSearch(
                        context: context,
                        delegate: Search(context.read<Searchcubit>()),
                      );
                    },
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.search,
                        size: 24,
                        color: khomecolor,
                      ),
                      filled: true,
                      contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
                      hintText: 'search',
                      fillColor: Colors.white,
                      labelStyle:
                          const TextStyle(fontSize: 18, color: Colors.black),
                      hintStyle: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: kgreycolor,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 182, 161, 161),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: Screan_size.width * 0.03,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const Cartscrean();
                    }));
                  },
                  child: Container(
                      padding: EdgeInsets.all(4),
                      height: Screan_size.hieght * 0.075,                      width: Screan_size.hieght * 0.06,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(.9),
                          borderRadius: BorderRadius.circular(6)),
                      child: Icon(
                        Icons.shopping_cart_outlined,
                        color: khomecolor,
                      )),
                ),
              ],
            ),
            SizedBox(height: Screan_size.hieght * 0.05),
          ],
        ));
  }
}
