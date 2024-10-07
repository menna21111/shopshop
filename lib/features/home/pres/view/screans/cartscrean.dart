import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopshop/features/home/data/models/home_model/product.dart';
import '../../../../../costant/colors.dart';
import '../../manager/getcart/getcartcubit.dart';
import '../../manager/getcart/getcartstate.dart';
import '../../manager/updatecart/updatecubite.dart';
import '../../manager/updatecart/updatecartstate.dart';
import 'checkoyoutscrean.dart';

class Cartscrean extends StatelessWidget {
  const Cartscrean({super.key, this.productmodel});
  final Product? productmodel;

  @override
  Widget build(BuildContext context) {
    // Fetch the cart data only once at the start
    context.read<Getcartcubit>().getcart();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text(
          'Cart Screen',
          style: TextStyle(
            color: khomecolor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: BlocBuilder<Getcartcubit, Getcartstate>(
        builder: (context, cartState) {
          if (cartState is GetcartstateSuccess) {
            return Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 40),
                  child: GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 5.0,
                      childAspectRatio: 0.75,
                    ),
                    itemCount: cartState.getcart.length,
                    itemBuilder: (BuildContext context, int index) {
                      final cartItem = cartState.getcart[index];
                      final product = cartItem.product;

                      return GestureDetector(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
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
                          margin: const EdgeInsets.symmetric(horizontal: 10.0),
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              SizedBox(
                                height: MediaQuery.of(context).size.height * .15,
                                width: double.infinity,
                                child: CachedNetworkImage(
                                  imageUrl: product?.image ?? '',
                                  fit: BoxFit.fill,
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                  placeholder: (context, url) => const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 8.0, left: 8, top: 13),
                                child: Row(
                                  children: [
                                    Text(
                                      '${cartItem?.product?.discount ?? 0}%',
                                      style: const TextStyle(color: khomecolor),
                                    ),
                                    const Text(' sales'),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(left: 5.0),
                                    child: Text(
                                      ' price: ',
                                      style: TextStyle(
                                        color: khomecolor,
                                      ),
                                    ),
                                  ),
                                  Text(' ${product?.price}'),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 15, left: 15, top: 19),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    // Decrease button
                                    Stack(
                                      alignment: AlignmentDirectional.center,
                                      children: [
                                        const CircleAvatar(
                                          radius: 12,
                                          backgroundColor: Colors.black,
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            cartItem.quantity =
                                                cartItem.quantity! >= 1
                                                    ? cartItem.quantity! - 1
                                                    : 1;
                                            context
                                                .read<Updatecubite>()
                                                .decreaseCount(
                                                  id: cartItem.id!,
                                                  currentCount:
                                                      cartItem.quantity!,
                                                );
                                          },
                                          icon: const Icon(
                                            Icons.remove,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),

                                    BlocBuilder<Updatecubite,
                                        Updatecartstateextend>(
                                      builder: (context, updateState) {
                                        if (updateState
                                                is UpdatecartstateSuccess &&
                                            updateState.data.cart!.id ==
                                                cartItem.id) {
                                          return Text(
                                            '${updateState.data.cart!.quantity}',
                                            style: const TextStyle(
                                              color: khomecolor,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          );
                                        }

                                        return Text(
                                          '${cartItem.quantity ?? 1}',
                                          style: const TextStyle(
                                            color: khomecolor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        );
                                      },
                                    ),

                                    Stack(
                                      alignment: AlignmentDirectional.center,
                                      children: [
                                        const CircleAvatar(
                                          radius: 12,
                                          backgroundColor: Colors.black,
                                        ),
                                        IconButton(
                                          icon: const Icon(Icons.add),
                                          onPressed: () {
                                            cartItem.quantity =
                                                cartItem.quantity! + 1;

                                            context
                                                .read<Updatecubite>()
                                                .increaseCount(
                                                  id: cartItem.id!,
                                                  currentCount:
                                                      cartItem.quantity!,
                                                );
                                            // context.read<Getcartcubit>().getcart();
                                          },
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                // Checkout button at the bottom
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const SizedBox(width: 25),
                        Expanded(
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * .08,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const Checkoyoutscrean(),
                                  ),
                                );
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
                                'Check out',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else if (cartState is GetcartstateFailure &&
              cartState.errorMessage == 'غير مصرح لك') {
            return const Center(
              child: Text('login frist'),
            );
          } else if (cartState is GetcartstateFailure ) {
            return Center(
              child: Text(cartState.errorMessage),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
