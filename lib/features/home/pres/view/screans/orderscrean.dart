import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopshop/features/home/data/models/home_model/product.dart';
import 'package:shopshop/features/home/pres/manager/getorder/getordercubit.dart';
import 'package:shopshop/features/home/pres/manager/getorder/getorderstate.dart';
import 'package:shopshop/features/home/pres/view/screans/orderscreandetails.dart';

import '../../../../../costant/colors.dart';

class Orderscrean extends StatelessWidget {
  const Orderscrean({super.key, this.productmodel});
  final Product? productmodel;
  @override
  Widget build(BuildContext context) {
    context.read<Getordercubit>().getorder();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading : false,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text(
          'Orders screen',
          style: TextStyle(
            color: khomecolor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body:
          BlocBuilder<Getordercubit, Getorderstate>(builder: (context, state) {
        if (state is Getorderloaded) {
          return ListView.builder(
            itemCount: state.products.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Orderscreandetails(
                              id: state.products[index].id ?? 0)));
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * .2,
                    height: MediaQuery.of(context).size.width * .2,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[200]!),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'order id : ${state.products[index].id}',
                              textAlign: TextAlign.center,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        } else if (state is Getordererror) {
          return Center(
            child: Text(state.error),
          );
        } else {
          return Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage(
                  'assets/What-to-consider-when-contemplating-delivery-service-680x510.png'),
            )),
            child: const Center(
                child: CircularProgressIndicator(
              color: khomecolor,
            )),
          );
        }
      }),
    );
  }
}
