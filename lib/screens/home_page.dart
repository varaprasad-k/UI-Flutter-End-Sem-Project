import 'package:flutter/material.dart';
import '../models/destination.dart';
import '../widgets/destination_card.dart';
import '../widgets/section_title.dart';
import '../widgets/custom_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<Destination> destinations = const [
    Destination(
      name: 'Goa',
      country: 'India',
      image:
          'https://images.unsplash.com/photo-1512343879784-a960bf40e7f2',
      description:
          'Goa is famous for its beaches, food and beautiful sunsets.',
      category: 'Beach',
    ),

    Destination(
      name: 'Manali',
      country: 'India',
      image:
          'https://images.unsplash.com/photo-1506905925346-21bda4d32df4',
      description:
          'Manali is a beautiful hill station surrounded by mountains.',
      category: 'Mountain',
    ),

    Destination(
      name: 'Jaipur',
      country: 'India',
      image:
          'https://images.unsplash.com/photo-1599661046289-e31897846e41',
      description:
          'Jaipur is known for its forts, palaces and rich history.',
      category: 'City',
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
        title: const Text(
          'TravelMate',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/explore');
            },
            child: const Text('Explore'),
          ),

          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/my-trips');
            },
            child: const Text('My Trips'),
          ),

          const SizedBox(width: 10),
        ],
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width < 600 ? 20 : 60,
            vertical: 30,
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(35),

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xff1976D2),
                      Color(0xff42A5F5),
                    ],
                  ),
                ),

                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,

                        children: [
                          const Text(
                            'Plan your next adventure',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 15),

                          const Text(
                            'Explore new destinations and create your perfect trip.',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 16,
                            ),
                          ),

                          const SizedBox(height: 25),

                          CustomButton(
                            text: 'Explore Destinations',
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                '/explore',
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              const SectionTitle(
                title: 'Popular Destinations',
              ),

              GridView.builder(
                shrinkWrap: true,
                physics:
                    const NeverScrollableScrollPhysics(),

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

              const SizedBox(height: 30),

              const SectionTitle(
                title: 'Start Planning',
              ),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(25),

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),

                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,

                  children: [
                    const Expanded(
                      child: Text(
                        'Create a trip and start planning your journey.',
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                    ),

                    CustomButton(
                      text: 'Create Trip',
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          '/create-trip',
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}