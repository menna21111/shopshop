import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopshop/costant/colors.dart';

import '../../manager/BANNERCUBIT/bannercubit.dart';
import '../../manager/BANNERCUBIT/bannerstate.dart';

class Banners extends StatefulWidget {
  const Banners({super.key});

  @override
  State<Banners> createState() => _BannersState();
}

class _BannersState extends State<Banners> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Bannercubit, BannerState>(
      builder: (context, state) {
        if (state is BannerSuccess) {
          final items = [
            ImageContainerModel(
                imagePath: state.bannermodel[0].image ?? 'assets/images.jpeg'),
            ImageContainerModel(
                imagePath: state.bannermodel[1].image ?? 'assets/images.jpeg'),
            ImageContainerModel(
                imagePath: state.bannermodel[2].image ?? 'assets/images.jpeg'),
            // ImageContainerModel(
            //     imagePath: state.bannermodel[].image ?? 'assets/images.jpeg'),
          ];
          return Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .25,
                width: MediaQuery.of(context).size.width,
                child: CarouselSlider(
                  items: items,
                  options: CarouselOptions(
                    height: MediaQuery.of(context).size.height,
                    autoPlay: true,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    viewportFraction: 1,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.3,
                    pageSnapping: true,
                    autoPlayInterval: Duration(seconds: 2),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 500),
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 5),
              DotsIndicator(
                dotsCount: items.length,
                position: currentIndex,
                decorator: DotsDecorator(
                  color: Colors.grey,
                  activeColor: khomecolor,
                  size: Size(8.0, 5.0),
                  activeSize: Size(14.0, 6.0),
                  activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  spacing: const EdgeInsets.symmetric(horizontal: 4.0),
                ),
              ),
            ],
          );
        } else if (state is BannerFailure) {

          return SizedBox(
            height: MediaQuery.of(context).size.height * .25,
            width: MediaQuery.of(context).size.width,
            child: Center(child: Text(state.errorMessage)),
          );
        } else {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .25,
            width: MediaQuery.of(context).size.width,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}

class ImageContainerModel extends StatelessWidget {
  final String imagePath;

  const ImageContainerModel({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8),
      child: Container(
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
        ),
        child: CachedNetworkImage(
          fit: BoxFit.fill,
          imageUrl: imagePath,
          errorWidget: (context, url, error) => const Icon(Icons.error),
          placeholder: (context, url) => const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
