import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';
import 'package:travel_app/Models/app_styles.dart';
import 'package:travel_app/Models/hotels.dart';
import 'package:travel_app/Providers/hotels_provider.dart';
import 'package:travel_app/animations/fade_animation.dart';

import '../Utils/offer_items.dart';
import '../animations/shake_animation.dart';

class HotelDetailsScreen extends StatelessWidget {
  HotelDetailsScreen({Key? key}) : super(key: key);

  static const route = "/HotelDetailsScreen";
  final _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    final hotel = ModalRoute.of(context)?.settings.arguments as Hotel;
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: LayoutBuilder(builder: (context, constraints) {
          return Stack(
            fit: StackFit.expand,
            children: [
              Positioned(
                left: 0,
                right: 0,
                height: MediaQuery.of(context).size.height * 0.3,
                child: FadeAnimation(
                  child: Image.asset(
                    hotel.images[0],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                top: MediaQuery.of(context).size.height * 0.3 * 0.9 - 20,
                child: ShakeTransition(
                  duration: const Duration(seconds: 1),
                  axis: Axis.vertical,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                    child: ListView(
                      // scrollDirection: Axis.vertical,

                      padding: const EdgeInsets.only(
                          top: 10, bottom: 100, right: 20, left: 20),
                      // child: Padding(
                      //   padding: const EdgeInsets.symmetric(
                      //     horizontal: 20,
                      //     vertical: 10,
                      //   ),
                      // child: Column(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            hotel.title,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 35,
                              fontFamily: AppStyles.titleFontStyle,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.location_on_outlined,
                              color: Colors.grey,
                              size: 25,
                            ),
                            Text(
                              hotel.location,
                              style: TextStyle(
                                  color: Colors.grey.shade800, fontSize: 17),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          // color: Colors.red,
                          // width: 100,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star_rounded,
                                    color: Color(0xffff8d0e),
                                    size: 28,
                                  ),
                                  Text(
                                    hotel.rating.toString(),
                                    style: const TextStyle(
                                      fontSize: 17.5,
                                    ),
                                  ),
                                  Text(
                                    "(${hotel.numberOfReviews / 1000}K review)",
                                    style: TextStyle(
                                        fontSize: 17.5,
                                        color: Colors.grey.shade700),
                                  ),
                                ],
                              ),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "\$${hotel.price.toInt()}/",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w800,
                                        fontSize: 25,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const TextSpan(
                                      text: "night",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 18),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Divider(
                          color: Colors.grey.shade400,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ReadMoreText(
                          hotel.description,
                          style: TextStyle(
                            color: Colors.grey.shade700,
                            fontFamily: AppStyles.normalFontStyle,
                            fontSize: 17,
                          ),
                          trimLines: 1,
                          trimLength: 100,
                          trimCollapsedText: "Read more",
                          trimExpandedText: "Read less",
                          lessStyle: const TextStyle(
                            color: Color(0xffFF9C07),
                            fontSize: 18,
                          ),
                          moreStyle: const TextStyle(
                            color: Color(0xffFF9C07),
                            fontSize: 18,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            "What we offer",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                fontFamily: AppStyles.titleFontStyle),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: OfferItemBuilder(controller: _controller),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            "Hosted by",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                fontFamily: AppStyles.titleFontStyle),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(right: 10),
                                    height: 60,
                                    width: 60,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(color: Colors.grey)),
                                    child: const Center(
                                      child: Image(
                                        image: AssetImage(
                                          "Assets/Icons/businesswoman-with-glasses-crossed-arms.jpg",
                                        ),
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        hotel.owner,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 17),
                                      ),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.star_rounded,
                                            color: Color(0xffFFA807),
                                          ),
                                          Text(
                                            "${hotel.ownerRating}",
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Text(
                                            "(${(hotel.ownerReviews / 1000).toStringAsPrecision(2)}K reviews)",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: Colors.grey.shade700,
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                              Container(
                                height: 50,
                                width: 50,
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: const Color(0xfff69a2e),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: const Center(
                                  child: Image(
                                      image: AssetImage(
                                        "Assets/Icons/messenger.png",
                                      ),
                                      color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                      // ),
                      // ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 15,
                child: Container(
                  height: 90,
                  width: MediaQuery.of(context).size.width,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  // color: const Color(0xffF6EDE5),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff4b9eea),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22),
                      ),
                    ),
                    child: const Text(
                      'Book Now',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 10,
                left: 20,
                child: Container(
                  width: MediaQuery.of(context).size.width - 50,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white),
                          height: 40,
                          width: 40,
                          child: Center(
                            child: Icon(Icons.arrow_back),
                          ),
                        ),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          print("Share Pressed");
                        },
                        child: Container(
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white),
                          height: 40,
                          width: 40,
                          child: Center(
                            child: Icon(Icons.share),
                          ),
                        ),
                      ),
                      LikeButton(hotel: hotel),
                    ],
                  ),
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}

class LikeButton extends StatefulWidget {
  LikeButton({
    super.key,
    required this.hotel,
  });
  Hotel hotel;
  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  @override
  Widget build(BuildContext context) {
    final func = Provider.of<HotelsProvider>(context).toogleFav;
    return InkWell(
      onTap: () {
        setState(() {
          func(widget.hotel);
        });
      },
      child: Container(
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        height: 40,
        width: 40,
        child: Center(
          child: (widget.hotel.liked == true)
              ? Icon(
                  Icons.favorite_outlined,
                  color: Colors.red,
                )
              : Icon(
                  Icons.favorite_outline_rounded,
                ),
        ),
      ),
    );
  }
}
