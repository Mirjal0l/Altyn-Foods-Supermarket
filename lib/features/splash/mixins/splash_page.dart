
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homework1/core/utils/app_colors.dart';
import 'package:homework1/router/name_routes.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';


class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  void _navigateToHome() {
    // lekin auth ga o'tsin splash tugagandan so'ng
    Future.delayed(const Duration(seconds: 3), () {
      if(mounted) {
        context.go(Routes.welcome);
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/icons/company.png', height: 100, fit: BoxFit.cover)
          ],
        ),
      ),
    );
  }
}