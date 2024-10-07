import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopshop/features/home/data/models/home_model/product.dart';

import '../../../../../costant/colors.dart';
import '../../manager/getfav/getfavcubit.dart';
import '../../manager/getfav/getfavstate.dart';

class Favscrean extends StatelessWidget {
  const Favscrean({super.key, this.productmodel});
  final Product? productmodel;
  @override
  Widget build(BuildContext context) {
    context.read<Getfavcubit>().getfav();
    return Scaffold(
      appBar: AppBar(
         automaticallyImplyLeading : false,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text(
          'favourite screen',
          style: TextStyle(
            color: khomecolor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: BlocBuilder<Getfavcubit, Getfavstate>(builder: (context, state) {
        if (state is GetfavstateSuccess) {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 10.0,
            ),
            itemCount: state.getfav.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {},
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
                          height: 120,
                          width: double.infinity,
                          child: CachedNetworkImage(
                            imageUrl: state.getfav[index].product!.image ?? '',
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
                                    '${state.getfav[index].product!.discount}%',
                                    style: const TextStyle(color: khomecolor),
                                  ),
                                  const Text('%sales'),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
              );
            },
          );
        } else if (state is GetfavstateFailure) {
          return Center(
            child: Text(state.errorMessage),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      }),
    );
  }
}
