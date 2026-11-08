import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/trip_provider.dart';

import 'screens/home_page.dart';
import 'screens/explore_page.dart';
import 'screens/destination_details_page.dart';
import 'screens/create_trip_page.dart';
import 'screens/my_trips_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => TripProvider(),
      child: const TravelMateApp(),
    ),
  );
}

class TravelMateApp extends StatelessWidget {
  const TravelMateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TravelMate',

      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xffF5F7FA),

        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
        ),

        cardTheme: CardThemeData(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),

      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/explore': (context) => const ExplorePage(),
        '/create-trip': (context) => const CreateTripPage(),
        '/my-trips': (context) => const MyTripsPage(),
        '/details': (context) => const DestinationDetailsPage(),
      },
    );
  }
}