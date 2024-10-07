import 'package:another_stepper/another_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopshop/costant/colors.dart';

import '../../manager/orderdetails.dart/orderdetailcubit.dart';
import '../../manager/orderdetails.dart/orderdetailsstate.dart';

class Orderscreandetails extends StatelessWidget {
  const Orderscreandetails({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context) {
    context.read<Getorderdetailscubit>().getorder(id: id);
    List<StepperData> stepperData = [
      StepperData(
        title: StepperText(
          "Order Placed",
          textStyle: TextStyle(fontWeight: FontWeight.bold),
        ),
        iconWidget: Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            color: khomecolor,
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
        ),
      ),
      StepperData(
        title: StepperText("Preparing"),
        iconWidget: Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            color: khomecolor,
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
        ),
      ),
      StepperData(
        title: StepperText("On the way"),
        iconWidget: Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            color: khomecolor,
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
        ),
      ),
      StepperData(
        title: StepperText(
          "Delivered",
          textStyle: const TextStyle(color: Colors.grey),
        ),
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Order details'),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: BlocBuilder<Getorderdetailscubit, Orderdetailsstate>(
          builder: (context, state) {
        if (state is Getorderdetailsloaded) {
          return SingleChildScrollView(
            child: Column(
              children: [
                 SizedBox(
                  height: MediaQuery.of(context).size.height * .1,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: AnotherStepper(
                    inActiveBarColor: Colors.grey,
                    stepperList: stepperData,
                    stepperDirection: Axis.horizontal,
                    activeIndex: 2,
                    inverted: true,
                    barThickness: 5,
                    activeBarColor: khomecolor,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  margin: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.grey[200]!,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        decoration: BoxDecoration(color: khomecolor),
                        margin: EdgeInsets.only(bottom: 14),
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          "Order id : ${state.products.id}",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'address :',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${state.products.address?.city}',
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      '${state.products.address?.details}',
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      '${state.products.address?.region}',
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'phone :',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                Text('${state.products.address?.notes}'),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'payment status :',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                Text('${state.products.paymentMethod}'),
                              ],
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            const Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Summary order:',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                )),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: state.products.products?.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                      '${state.products.products?[index].name}'),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        } else if (state is Getordedetailsrerror) {
          return Center(child: Text(state.error));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      }),
    );
  }
}
