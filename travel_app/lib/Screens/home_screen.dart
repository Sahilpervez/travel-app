import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/Models/app_styles.dart';

import '../Utils/hot_deals_carousel.dart';
import '../Utils/main_bar_elements.dart';
import '../Utils/popular_hotels_bar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final _controller = ScrollController();
  final _controller1 = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          return ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Where you\nwanna go?",
                    style: TextStyle(
                      fontSize: 35,
                      fontFamily: AppStyles.titleFontStyle,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      if (kDebugMode) {
                        print("Search Button Pressed");
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade300,
                            offset: const Offset(-2, 7),
                            spreadRadius: 5,
                            blurRadius: 20,
                          ),
                        ],
                      ),
                      height: 55,
                      width: 55,
                      child: const Center(
                        child: Image(
                          image: AssetImage("Assets/SearchIcon.png"),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                ),
                height: 170,
                // color: Colors.lightBlueAccent,
                child: MainBarBuilder(controller: _controller),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Popular Hotels",
                    style: TextStyle(
                      fontSize: 27,
                      fontFamily: AppStyles.titleFontStyle,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (kDebugMode) {
                        print("See all tapped");
                      }
                    },
                    child: const Text(
                      "See all",
                      style: TextStyle(
                        color: Color(0xffC99900),
                        fontSize: 17,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 290,
                child: PopularHotelsBarBuilder(controller1: _controller1),
              ),
              const Text(
                "Hot Deals",
                style: TextStyle(
                  fontSize: 27,
                  fontFamily: AppStyles.titleFontStyle,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: (constraints.maxWidth > 400)
                    ? EdgeInsets.symmetric(
                        horizontal: constraints.maxWidth * 0.05)
                    : EdgeInsets.zero,
                child: CarouselBuilder(
                  constraints: constraints,
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}

