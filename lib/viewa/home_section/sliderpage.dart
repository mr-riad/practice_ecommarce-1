import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class SliderPage extends StatefulWidget {
  const SliderPage({super.key});

  @override
  State<SliderPage> createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  List<String> sliders = [
    'https://css3menu.com/web-design/data/upload/2017/04/indicators-example.jpg',
    'https://css3menu.com/web-design/data/upload/2017/04/indicators-example.jpg',
    'https://i.ytimg.com/vi/D1r6OM8TdII/maxresdefault.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CarouselSlider.builder(
          itemCount: sliders.length,
          itemBuilder: (context, index, realIndex) {
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(sliders[index]))
              ),
            );
          },
          options: CarouselOptions(
            height: 400,
            aspectRatio: 16/9,
            viewportFraction: 0.8,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enlargeFactor: 0.3,
            //onPageChanged: callbackFunction,
            scrollDirection: Axis.horizontal,
          )),
    );
  }
}
