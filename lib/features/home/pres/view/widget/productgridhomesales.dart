import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopshop/costant/colors.dart';
import 'package:shopshop/features/home/pres/manager/productcubit.dart/productcubit.dart';
import 'package:shopshop/features/home/pres/manager/productcubit.dart/productstate.dart';

import '../../../../../costant/size.dart';
import '../screans/productdetails.dart';

class Productgridhome extends StatelessWidget {
  const Productgridhome({super.key});

  @override
  Widget build(BuildContext context) {
    Screan_size.init(context);

    return BlocBuilder<Productcubit, Productstate>(builder: (context, State) {
      if (State is ProudctSuccess) {
        final productsWithDiscounts = State.proudctmodel
            .where((product) => product.discount != 0)
            .toList();

        return SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: Screan_size.hieght * 0.02,
            crossAxisSpacing: Screan_size.width * 0.03,
            childAspectRatio: Screan_size.width / Screan_size.hieght * 1.85,
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Productdetails(
                        productmodel: productsWithDiscounts[index]);
                  }));
                },
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0, 2),
                          blurRadius: 1,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    margin: EdgeInsets.symmetric(
                        horizontal: Screan_size.width * 0.02),
                    height: Screan_size.hieght * 0.3,
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        SizedBox(
                          height: Screan_size.hieght * 0.18,
                          width: double.infinity,
                          child: Hero(
                            tag: '${productsWithDiscounts[index].id}',
                            child: CachedNetworkImage(
                              imageUrl: productsWithDiscounts[index].image ?? '',
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                              placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator(),
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              right: Screan_size.width * 0.02,
                              left: Screan_size.width * 0.02,
                              top: Screan_size.hieght * 0.015),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    '${productsWithDiscounts[index].discount}%',
                                    style: TextStyle(
                                        color: khomecolor,
                                        fontSize: Screan_size.width * 0.035),
                                  ),
                                  Text(
                                    'sales',
                                    style: TextStyle(
                                        fontSize: Screan_size.width * 0.03),
                                  ),
                                ],
                              ),
                              Text(
                                '${productsWithDiscounts[index].name?.split(' ').sublist(0, 1).join(' ')}',
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontSize: Screan_size.width * 0.03),
                              )
                            ],
                          ),
                        ),
                      ],
                    )),
              );
            },
            childCount: productsWithDiscounts.length,
          ),
        );
      } else if (State is ProudctFailure) {
        return SliverToBoxAdapter(child: Text(State.errorMessage));
      } else {
        return const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()));
      }
    });
  }
}
