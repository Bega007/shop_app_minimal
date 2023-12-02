import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:minimal_markt/models/adds.dart';
import 'package:provider/provider.dart';

class MyAdds extends StatefulWidget {
  const MyAdds({super.key});

  @override
  State<MyAdds> createState() => _MyAddsState();
}

class _MyAddsState extends State<MyAdds> {
  @override
  Widget build(BuildContext context) {
    final adds = context.watch<Adds>().adds;

    return Center(
      child: Column(children: [
        CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 1,
            autoPlay: true,
            height: 200,
            autoPlayCurve: Curves.fastOutSlowIn,
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayInterval: const Duration(seconds: 2),
            enlargeCenterPage: true,
            aspectRatio: 2.0,
            onPageChanged: (index, reason) {
              setState(() {
              });
            },
          ),
          items: adds
              .map((adds) => Center(
                    child: Container(
                      width: 350,
                      height: 350,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Theme.of(context).colorScheme.background),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          adds.imagePath,
                          fit: BoxFit.cover,
                          width: 1000,
                        ),
                      ),
                    ),
                  ))
              .toList(),
        ),

        /*AnimatedSmoothIndicator(
          activeIndex: myCurrentIndex,
          count: adds.length,
          effect: WormEffect(
            dotHeight: 8,
            dotWidth: 8,
            dotColor: Colors.white,
            activeDotColor: Colors.blue,
            paintStyle: PaintingStyle.fill,
          ),
        ),*/
      ]),
    );
  }
}
