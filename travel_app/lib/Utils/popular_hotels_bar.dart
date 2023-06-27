import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/Screens/hotel_details_screen.dart';

import '../Models/app_styles.dart';
import '../Models/hotels.dart';
import '../Providers/hotels_provider.dart';

class PopularHotelsBarBuilder extends StatelessWidget {
  const PopularHotelsBarBuilder({
    super.key,
    required ScrollController controller1,
  }) : _controller1 = controller1;

  final ScrollController _controller1;

  @override
  Widget build(BuildContext context) {
    final hotels = Provider.of<HotelsProvider>(context).hotels;
    return Scrollbar(
      controller: _controller1,
      scrollbarOrientation: ScrollbarOrientation.bottom,
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 17),
        scrollDirection: Axis.horizontal,
        controller: _controller1,
        children: [
          ...hotels
              .map(
                (e) => Container(
                  margin: const EdgeInsets.only(right: 15),
                  child: PopularHotels(
                    currHotel: e,
                  ),
                ),
              )
              .toList(),
        ],
      ),
    );
  }
}

class PopularHotels extends StatelessWidget {
  PopularHotels({
    super.key,
    required this.currHotel,
  });
  Hotel currHotel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamedAndRemoveUntil(
          HotelDetailsScreen.route,
          arguments: currHotel,
          (route) => route.isFirst,
        );
      },
      child: SizedBox(
        width: 160,
        child: Stack(
          children: [
            Container(
              width: 170,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      currHotel.images[0],
                    ),
                    fit: BoxFit.fitHeight),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            Container(
              width: 160,
              decoration: BoxDecoration(
                color: Colors.transparent.withAlpha(130),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            Positioned(
              bottom: 70,
              left: 10,
              child: SizedBox(
                width: 150,
                child: Text(
                  currHotel.title,
                  style: const TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontFamily: AppStyles.titleFontStyle,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 50,
              left: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.location_on_outlined,
                    color: Colors.grey,
                    size: 20,
                  ),
                  Text(
                    currHotel.location,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,
                      fontFamily: AppStyles.titleFontStyle,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 20,
              left: 10,
              child: SizedBox(
                width: 140,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: "\$${currHotel.price.toInt()}/",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17)),
                      const TextSpan(
                        text: "night",
                      ),
                    ])),
                    // SizedBox(width: 10,),
                    Row(
                      children: [
                        const Icon(
                          Icons.star_rounded,
                          color: Colors.amber,
                        ),
                        Text(
                          "${currHotel.rating}",
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
