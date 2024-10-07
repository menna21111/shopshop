import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/CATEGORYCUBIT/catagoryCubit.dart';
import '../../manager/CATEGORYCUBIT/catagorystate.dart';

class ListCategry extends StatelessWidget {
  const ListCategry({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Catagorycubit, Catagorystate>(builder: (context, state) {
      if (state is CatgorySuccess) {
        return SizedBox(
          height: 80,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: state.catgorymodel.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      child: CachedNetworkImage(
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                          placeholder: (context, url) =>
                              const Center(child: CircularProgressIndicator()),
                          fit: BoxFit.cover,
                          imageUrl: state.catgorymodel[index].image ?? ''),
                    ),
                    Text(
                      state.catgorymodel[index].name ?? 'null',
                      style: const TextStyle(color: Colors.black),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              );
            },
          ),
        );
      } else if (state is CatgoryFailure) {
        return SizedBox(
            height: 80, child: Center(child: Text(state.errorMessage)));
      } else {
        return const SizedBox(
            height: 80, child: Center(child: CircularProgressIndicator()));
      }
    });
  }
}
