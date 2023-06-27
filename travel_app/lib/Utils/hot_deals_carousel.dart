
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Models/hotels.dart';
import '../Providers/hotels_provider.dart';

class CarouselBuilder extends StatelessWidget {
  CarouselBuilder({
    super.key,
    required this.constraints,
  });
  BoxConstraints constraints;
  @override
  Widget build(BuildContext context) {
    final hotdeals = Provider.of<HotelsProvider>(context).hotels;
    return CarouselSlider(
      items: [
        ...hotdeals
            .map(
              (e) => HotDealsElement(
            constraints: constraints,
            currHotel: e,
          ),
        )
            .toList(),
      ],
      options: CarouselOptions(
        height:
        (constraints.maxWidth > 1000) ? constraints.maxWidth * 0.299 : 235.0,
        enlargeCenterPage: true,
        autoPlay: false,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        viewportFraction: (constraints.maxWidth > 1000) ? 0.47 : 0.83,
      ),
    );
  }
}

class HotDealsElement extends StatelessWidget {
  HotDealsElement({
    super.key,
    required this.constraints,
    required this.currHotel,
  });
  BoxConstraints constraints;
  Hotel currHotel;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            currHotel.images[1],
          ),
          fit: BoxFit.fitHeight,
        ),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.transparent.withAlpha(80),
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          Positioned(
            top: 10,
            left: 10,
            child: Chip(
              label: Center(
                child: Text("${currHotel.discount.toInt()}% OFF"),
              ),
              backgroundColor: const Color(0xffef8048),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          ),
          Positioned(
            bottom: 50,
            left: 10,
            child: SizedBox(
              // color: Colors.lightBlue,
              width: (constraints.maxWidth > 1000)
                  ? constraints.maxWidth * 0.325
                  : 270,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: (constraints.maxWidth > 1000)
                        ? constraints.maxWidth * 0.2
                        : 200,
                    child: Text(
                      currHotel.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star_rounded,
                        color: Colors.amber,
                      ),
                      Text(
                        "${currHotel.rating}",
                        style: const TextStyle(color: Colors.white, fontSize: 17),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 10,
            child: SizedBox(
              width: (constraints.maxWidth > 1000)
                  ? constraints.maxWidth * 0.325
                  : 270,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: Colors.grey.shade400,
                      ),
                      Text(
                        currHotel.location,
                        style: TextStyle(
                          color: Colors.grey.shade400,
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: "\$${currHotel.price.toInt()}",
                            style: const TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w600)),
                        const TextSpan(text: "/night", style: TextStyle()),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}