import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/Providers/hotels_provider.dart';
import 'package:travel_app/Screens/home_screen.dart';
import 'package:travel_app/Screens/hotel_details_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => HotelsProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Travel App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true
        ),
        home: HomeScreen(),
        routes: {
          HotelDetailsScreen.route : (BuildContext context) => HotelDetailsScreen()
        },
      ),
    );
  }
}