import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopshop/costant/colors.dart';
import 'package:shopshop/features/home/data/models/home_model/product.dart';
import 'package:shopshop/features/home/pres/manager/addtocart/addcartstate.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../../../core/widget/fullimage.dart';
import '../../manager/addtocart/addtocartcubit.dart';
import '../../manager/addtofavubit/addtofavcubit.dart';
import '../../manager/addtofavubit/addtofavstate.dart';

class Productdetails extends StatelessWidget {
  const Productdetails({super.key, required this.productmodel});
  final Product productmodel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Stack(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * .4,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: khomecolor,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15),
                          ),
                        ),
                        child: CachedNetworkImage(
                          imageUrl: productmodel.image ?? '',
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                          placeholder: (context, url) => const Center(
                            child: CircularProgressIndicator(),
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                      Positioned(
                        left: 14,
                        top: 7,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(Icons.arrow_back_ios_new),
                        ),
                      ),
                      const Positioned(
                        right: 8,
                        top: 5,
                        child: Icon(
                          Icons.shopping_bag,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ),
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    children: [
                      Column(
                        children: [
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(
                                top: 12.0,
                                left: 20,
                                right: 20,
                              ),
                              child: Text('Brand'),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${productmodel.name?.split(' ').sublist(0, 1).join(' ')}',
                                  style: const TextStyle(
                                    color: khomecolor,
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  'Price: \$${productmodel.price}',
                                  style: const TextStyle(
                                    color: khomecolor,
                                    fontSize: 18,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(productmodel.name ?? ''),
                        ),
                      ),
                      const SizedBox(height: 15),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Photos'),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .15,
                        child: ListView.builder(
                          padding: const EdgeInsets.all(8),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: productmodel.images?.length ?? 0,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 18.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (BuildContext context) {
                                    return ImageScreen(
                                      url: productmodel.images![index],
                                    );
                                  }));
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  height: MediaQuery.of(context).size.height *.1,
                                  width: 50,
                                  child: Image.network(
                                    productmodel.images![index],
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Description: ${productmodel.description ?? ''}',
                        textAlign: TextAlign.right,
                      ),
                      const SizedBox(height: 70),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const SizedBox(width: 15),
                    BlocBuilder<Addtofavcubit, Addtofavstate>(
                      builder: (context, state) {
                        bool isFavored = productmodel.inFavorites ?? false;
                        Color iconColor = isFavored ? Colors.red : Colors.grey;

                        if (state is AddtofavstateSuccess&& state.addtofav.data?.id==productmodel.id) {
                          isFavored =
                              state.addtofav.message == 'تمت الإضافة بنجاح';
                          iconColor = isFavored ? Colors.red : Colors.grey;
                        } else if (state is AddtofavstateFailure) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(state.errorMessage),
                            ),
                          );
                        }

                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.grey),
                          ),
                          padding: const EdgeInsets.all(3),
                          child: IconButton(
                            onPressed: () {
                              context
                                  .read<Addtofavcubit>()
                                  .addtofav(id: productmodel.id ?? 54);
                              productmodel.inFavorites = !isFavored;
                            },
                            icon: Icon(
                              isFavored
                                  ? Icons.favorite
                                  : Icons.favorite_border_outlined,
                              color: iconColor,
                              size: 32,
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(width: 25),
                    BlocBuilder<Addtocartcubit, Addcartstate>(
                        builder: (context, state) {
                      if (state is AddcartstateSuccess) {
                        Fluttertoast.showToast(
                          msg: "${state.addtocart.message}", // Success message
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: Colors.green,
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
                      } else if (state is AddcartstateFailure) {
                        Fluttertoast.showToast(
                          msg: "${state.errorMessage} ", // Error message
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
                      }
                      return Expanded(
                        child: SizedBox(
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              context
                                  .read<Addtocartcubit>()
                                  .addtocart(id: productmodel.id ?? 54);
                            },
                            style: ButtonStyle(
                              backgroundColor:
                                  WidgetStateProperty.all(Colors.black),
                              shape: WidgetStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            child: const Text(
                              'Add to Cart',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      );
                    }),
                    const SizedBox(width: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
