import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:homework1/widgets/custom_navigation_bar.dart';

class MainPage extends StatelessWidget {
  const MainPage({required this.navigationShell, super.key});
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: SafeArea(
        child: CustomNavigationBar(
          navigationShell: navigationShell),
      ),
    );
  }
}