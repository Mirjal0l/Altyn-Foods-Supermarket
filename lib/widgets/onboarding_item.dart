import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key, required this.images});

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CarouselSlider(
        items: images.map((image) {
          return Container(child: Image.asset(image, fit: BoxFit.cover));
        }).toList(),

        options: CarouselOptions(
          height: 0.54 * MediaQuery.of(context).size.height,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 500),
          autoPlayCurve: Curves.easeInOut,
          enlargeCenterPage: true,
          viewportFraction: 1.0,
          reverse: false, // o'ngga qarab slide qiladi
          enableInfiniteScroll: false,
          initialPage: 1
        ),
      ),
    );
  }
}
