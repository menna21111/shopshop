import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopshop/costant/colors.dart';
import 'package:shopshop/features/onboarding/onboardingscrean.dart';
import 'package:shopshop/features/registratian/pres/screens/screens/loginscrean.dart';
import '../../../../../core/utls/bottomnavBAR.dart';
import '../../../../../core/utls/cach_helper.dart';

class Splachscrean extends StatefulWidget {
  const Splachscrean({super.key});

  @override
  State<Splachscrean> createState() => _SplachscreanState();
}

class _SplachscreanState extends State<Splachscrean> {
  @override
  void initState() {
    super.initState();
    _navigateAfterDelay();
  }

  Future<void> _navigateAfterDelay() async {
    await Future.delayed(const Duration(seconds: 2));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool hasSeenOnboarding = prefs.getBool('hasSeenOnboarding') ?? false;

    if (hasSeenOnboarding) {

       bool islogin=await CacheHelper().containsKey(key: 'token');
   islogin?Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const BottomNavigation() )):Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const BottomNavigation()),
    );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnBordingScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, khomecolor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: const Center(
          child: Text(
            'shopshop',
            style: TextStyle(
              color: Colors.white,
              fontSize: 44,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
