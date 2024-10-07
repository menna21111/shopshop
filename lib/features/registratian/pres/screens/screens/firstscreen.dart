import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../home/pres/view/widget/splachscrean.dart';

import '../../cubit/usercubit.dart';

class Firstscreen extends StatelessWidget {
  const Firstscreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
   
    return const Scaffold(
      resizeToAvoidBottomInset: true,
      body: Splachscrean(),
    );
  }
}
