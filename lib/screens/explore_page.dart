import 'package:flutter/material.dart';

import '../models/destination.dart';
import '../widgets/destination_card.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  final List<Destination> destinations = const [
    const Destination(
      name: 'Goa',
      country: 'India',
      image:'https://images.unsplash.com/photo-1512343879784-a960bf40e7f2',
      description: 'Beautiful beaches, sunsets and amazing food.',
      category: 'Beach',
    ),

    const Destination(
      name: 'Kashmir',
      country: 'India',
      image:'https://images.unsplash.com/photo-1626621341517-bbf3d9990a23',
      description:'Known for its beautiful mountains, lakes, valleys and peaceful landscapes.',
      category: 'Nature',
    ),
    const Destination(
      name: 'Manali',
      country: 'India',
      image:'https://images.unsplash.com/photo-1506905925346-21bda4d32df4',
      description: 'A peaceful mountain destination.',
      category: 'Mountain',
    ),

    const Destination(
      name: 'Jaipur',
      country: 'India',
      image:'https://images.unsplash.com/photo-1599661046289-e31897846e41',
      description: 'The Pink City with beautiful forts and palaces.',
      category: 'City',
    ),

    const Destination(
      name: 'Kerala',
      country: 'India',
      image: 'https://images.unsplash.com/photo-1602216056096-3b40cc0c9944',
      description:'Beautiful backwaters and natural scenery.',
      category: 'Nature',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    int crossAxisCount = 1;

    if (width > 1000) {
      crossAxisCount = 3;
    } else if (width > 600) {
      crossAxisCount = 2;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore Destinations'),
      ),

      body: Padding(
        padding: EdgeInsets.all(
          width < 600 ? 20 : 50,
        ),

        child: GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            childAspectRatio: 1.1,
          ),

          itemCount: destinations.length,

          itemBuilder: (context, index) {
            return DestinationCard(
              destination: destinations[index],
            );
          },
        ),
      ),
    );
  }
}