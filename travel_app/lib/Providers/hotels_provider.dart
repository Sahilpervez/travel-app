import 'package:flutter/material.dart';
import 'package:travel_app/Models/hotels.dart';

class HotelsProvider extends ChangeNotifier {
  List<Hotel> hotels = [
    Hotel(
      title: "Santorini",
      location: "Greece",
      rating: 4.9,
      numberOfReviews: 4600,
      price: 488,
      description:
          "Santorini is the world famous Greek Island located at the south Aegean Sea.It is a 40 minutes fly from Athens international Airport or an average 6 to 8 hours boat ride from the port of Piraeus.Santorini is essentially what remains after an enormous volcanic eruption that destroyed the earliest settlements on a formerly single island, and created the current geological caldera. A giant central, rectangular lagoon with steep cliffs on three sides. The main island slopes downward to the Aegean Sea. The capital Fira, Oia and Imerovigli, clings to the top of the cliff looking down on the lagoon, the volcanic rocks and the world famous Santorinian sunset.Apart from the breathtaking views and the amazing sunsets Santorini is well known for the local wines which have been internationally awarded.Santorini also hosts the incredible “Excavations” of Akrotiri as well as the ruins of Ancient Thera and the museums of Ancient and Prehistorical Thera conveniently located close to Pantelia Suites.",
      images: [
        "Assets/santorini_img/Santorini-Greece.jpg",
        "Assets/santorini_img/santorini-g3.jpg",
        "Assets/santorini_img/santorini-g2.jpg",
        "Assets/santorini_img/santorini-g4.jpg",
      ],
      owner: "Jane Doe",
      ownerRating: 4.8,
      ownerReviews: 1604,
      discount: 25,
    ),
    Hotel(
      title: "Hotel Royal Passeig de Gracia",
      location: "Spain",
      rating: 4.8,
      numberOfReviews: 3600,
      price: 280,
      description:
          "Royal Passeig de Gracia is a 4 star hotel located at the heart of Barcelona, just a few steps from Gaudi's La Pedrera building, a unique placement surrounded by beautiful architectural jewels of Catalan Modernism and by the most exclusive and luxurious stores of the city. The hotel stands out for the quality of service, the design and comfort of its rooms and for its unique spaces such as its famous rooftop 83.3 Terrace Bar, place to eat and drink the best cocktails while enjoying incredible views of the whole city.",
      images: [
        "Assets/hotel_royal_img/hotel_royal_2.jpeg",
        "Assets/hotel_royal_img/hotel_royal_1.jpg",
        "Assets/hotel_royal_img/hotel_royal_3.webp",
      ],
      owner: "John Doe",
      ownerRating: 4.79,
      ownerReviews: 1348,
      discount: 30,
    ),
    Hotel(
      title: "BaLi Motel Vung Tau",
      location: "Indonesia",
      rating: 4.9,
      numberOfReviews: 6800,
      price: 580,
      description:
          "Set in Vung Tau, 100 metres from Front Beach, BaLi Motel Vung Tau offers accommodation with a garden, private parking, a shared lounge and a terrace. Located around 2.3 km from Back Beach, the guest house with free WiFi is also 2.3 km away from Pineapple Beach. The accommodation provides a shared kitchen, room service and luggage storage for guests.At the guest house, all rooms are fitted with a desk. Complete with a private bathroom fitted with a bidet and free toiletries, all guest rooms at BaLi Motel Vung Tau have a flat-screen TV and air conditioning, and some rooms also offer a balcony. At the accommodation all rooms have bed linen and towels.",
      images: [
        "Assets/bali_hotel_img/bali_hotel_3.jpg",
        "Assets/bali_hotel_img/bali_hotel_2.jpg",
        "Assets/bali_hotel_img/bali_hotel_4.jpg",
        "Assets/bali_hotel_img/BaliHotel.webp",
      ],
      owner: "Harleen Smith",
      ownerRating: 4.9,
      ownerReviews: 1604,
      discount: 10,
    ),
  ];

  final mainBarItems =[
    {"title" : "Hotel","icon" : "Assets/Icons/hotel.png"},
    {"title" : "Flight","icon" : "Assets/Icons/flight.png"},
    {"title" : "Place","icon" : "Assets/Icons/places.png"},
    {"title" : "Food","icon" : "Assets/Icons/food.png"},
  ];
  final offers = [
    {"title" : "2 Bed","icon" : "Assets/Icons/hotel-bed.png"},
    {"title" : "Dinner","icon" : "Assets/Icons/tray.png"},
    {"title" : "Hot Tub","icon" : "Assets/Icons/hot-tub.png"},
    {"title" : "1 AC","icon" : "Assets/Icons/air-conditioner.png"},
    {"title" : "Gym","icon" : "Assets/Icons/dumbbell.png"},
    {"title" : "Cafe","icon" : "Assets/Icons/coffee-cup.png"},
  ];
}
