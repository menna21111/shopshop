import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../costant/colors.dart';
import '../../manager/productcubit.dart/productcubit.dart';
import '../../manager/productcubit.dart/productstate.dart';
import 'productdetails.dart';

class Productscrean extends StatelessWidget {
  const Productscrean({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: khomecolor,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text(
          'Products Screen',
          style: TextStyle(
            color: khomecolor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: BlocBuilder<Productcubit, Productstate>(builder: (context, State) {
        if (State is ProudctSuccess) {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 10.0,
            ),
            itemCount: State.proudctmodel.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Productdetails(
                              productmodel: State.proudctmodel[index])));
                },
                child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0, 2),
                          blurRadius: 1,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    margin: const EdgeInsets.symmetric(horizontal: 10.0),
                    height: 240,
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .15,
                          width: double.infinity,
                          child: CachedNetworkImage(
                            imageUrl: State.proudctmodel[index].image ?? '',
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                            placeholder: (context, url) => const Center(
                              child: CircularProgressIndicator(),
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 8.0, left: 8, top: 13),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    '${State.proudctmodel[index].discount}%',
                                    style: const TextStyle(color: khomecolor),
                                  ),
                                  const Text('%sales'),
                                ],
                              ),
                              Text(
                                ' ${State.proudctmodel[index].name?.split(' ').sublist(0, 1).join(' ')}',
                                textAlign: TextAlign.end,
                              )
                            ],
                          ),
                        ),
                      ],
                    )),
              );
            },
          );
        } else if (State is ProudctFailure) {
          return SliverToBoxAdapter(child: Text(State.errorMessage));
        } else {
          return const SliverToBoxAdapter(
              child: Center(child: CircularProgressIndicator()));
        }
      }),
    );
  }
}
