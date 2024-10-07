import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:dropdown_model_list/dropdown_model_list.dart';

import 'package:shopshop/features/home/pres/manager/adress/adresscubit.dart';
import 'package:shopshop/features/home/pres/view/screans/payementscrean.dart';

import '../../../../registratian/pres/screens/widget/textfield.dart';
import '../../manager/adress/adressstate.dart';

class Locationscrean extends StatefulWidget {
  const Locationscrean({super.key});

  @override
  State<Locationscrean> createState() => _LocationscreanState();
}

class _LocationscreanState extends State<Locationscrean> {
  Position? position;
  bool? isloading;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Add Location'),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            }, icon: const Icon(Icons.arrow_back_ios)),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child:
            BlocConsumer<Adresscubit, Adressstate>(listener: (context, state) {
          if (state is AdressstateSuccess) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  Payementscrean(id:state.adreesresponse.data?.id)),
            );
          } else if (state is AdressstateFailure) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.errorMessage),
              backgroundColor: Colors.red,
            ));
          }
        }, builder: (context, state) {
          return Column(
            children: [
              const SizedBox(
                height: 30,
              ),

              const SizedBox(
                height: 20,
              ),
              const Selectcity(),
              Customtextfield(
                controller: context.read<Adresscubit>().region,
                hinttext: 'entre your region',
                icon: position != null
                    ? Icons.location_on
                    : Icons.location_disabled_rounded,
                labeltext: 'region',
                onIconTap: () async {
                  setState(() {
                    isloading = true;
                  });
                  await Geolocator.requestPermission();
                  await Geolocator.getCurrentPosition().then((value) {
                    setState(() {
                      position = value;
                      isloading = false;
                    });
                    log('position');
                    print(position?.latitude);
                    context.read<Adresscubit>().latitude = position?.latitude;
                    context.read<Adresscubit>().longitude = position?.longitude;
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Customtextfield(
                controller: context.read<Adresscubit>().details,
                hinttext: 'entre details',
                labeltext: 'details',
              ),
              const SizedBox(
                height: 20,
              ),
              Customtextfield(
                controller: context.read<Adresscubit>().phone!,
                hinttext: 'entre phone',
                labeltext: 'phone',
              ),
              const Selectname(),

              const SizedBox(
                height: 20,
              ),
              // if (isloading ?? false) CircularProgressIndicator(),
              // Text('${position?.latitude} ${position?.longitude}')

              BlocBuilder<Adresscubit, Adressstate>(builder: (context, state) {
                return state is AdressstateLoading
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          minimumSize: const Size(280, 50),
                        ),
                        onPressed: () {
                          context.read<Adresscubit>().addadress();
                        },
                        child: const Text(
                          'Add location',
                          style: TextStyle(color: Colors.white),
                        ));
              }),
            ],
          );
        }),
      ),
    );
  }
}

class Selectcity extends StatefulWidget {
  const Selectcity({
    super.key,
  });

  @override
  State<Selectcity> createState() => _SelectcityState();
}

class _SelectcityState extends State<Selectcity> {
  DropListModel dropListModel = DropListModel([
    OptionItem(
      id: "1",
      title: "gharbia",
    ),
    OptionItem(
      id: "2",
      title: "cairo",
    ),
    OptionItem(
      id: "3",
      title: "fayome",
    ),
    OptionItem(
      id: "4",
      title: "tanta",
    ),
    OptionItem(
      id: "5",
      title: "Aswan",
    ),
    OptionItem(
      id: "6",
      title: "LUXOR",
    ),
    OptionItem(
      id: "7",
      title: "Giza",
    ),
    OptionItem(
      id: "8",
      title: "Sohag",
    ),
    OptionItem(
      id: "9",
      title: "Damietta",
    ),
    OptionItem(id: "10", title: "Alexandria"),
  ]);
  OptionItem optionItemSelected = OptionItem(
    title: "SELECT YOUR CITY",
  );

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(children: [
        SelectDropList(
          itemSelected: optionItemSelected,
          dropListModel: dropListModel,
          showIcon: false,
          showArrowIcon: true,
          showBorder: false,
          borderRadius: BorderRadius.circular(30),
          enable: true,
          paddingTop: 0,
          paddingDropItem:
              const EdgeInsets.only(left: 20, top: 10, bottom: 10, right: 20),
          suffixIcon: Icons.arrow_drop_down,
          containerPadding: const EdgeInsets.all(10),
          icon: const Icon(Icons.person, color: Colors.black),
          onOptionSelected: (optionItem) {
            optionItemSelected = optionItem;
            setState(() {
              optionItemSelected = optionItem;

              context.read<Adresscubit>().city = optionItem.title;
            });
          },
        ),
      ]),
    );
  }
}

class Selectname extends StatefulWidget {
  const Selectname({
    super.key,
  });

  @override
  State<Selectname> createState() => _SelectnameState();
}

class _SelectnameState extends State<Selectname> {
  DropListModel dropListModel = DropListModel([
    OptionItem(
      id: "1",
      title: "work",
    ),
    OptionItem(
      id: "2",
      title: "University",
    ),
    OptionItem(
      id: "3",
      title: "School",
    ),
    OptionItem(
      id: "4",
      title: "apartment",
    ),
    OptionItem(
      id: "5",
      title: "hotel",
    ),
  ]);
  OptionItem optionItemSelected = OptionItem(
    title: "SELECT Location NAME",
  );

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(children: <Widget>[
        ///Simple DropDown
        SelectDropList(
          itemSelected: optionItemSelected,
          dropListModel: dropListModel,
          showIcon: false,
          showArrowIcon: true,
          showBorder: false,
          borderRadius: BorderRadius.circular(30),
          enable: true,
          paddingTop: 0,
          paddingDropItem:
              const EdgeInsets.only(left: 20, top: 10, bottom: 10, right: 20),
          suffixIcon: Icons.arrow_drop_down,
          containerPadding: const EdgeInsets.all(10),
          icon: const Icon(Icons.person, color: Colors.black),
          onOptionSelected: (optionItem) {
            optionItemSelected = optionItem;
            setState(() {
              optionItemSelected = optionItem;

              context.read<Adresscubit>().name = optionItem.title;
            });
          },
        ),
      ]),
    );
  }
}
