import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/trip_provider.dart';
import '../widgets/trip_card.dart';

class MyTripsPage extends StatelessWidget {
  const MyTripsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final tripProvider =
        Provider.of<TripProvider>(context);

    final trips = tripProvider.trips;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Trips',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: trips.isEmpty
          ? _buildEmptyState(context)
          : _buildTripList(context, tripProvider),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center,

          children: [
            Icon(
              Icons.flight_takeoff,
              size: 70,
              color: Colors.blue.shade300,
            ),

            const SizedBox(height: 20),

            const Text(
              'No trips planned yet',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              'Create your first trip and start planning your journey.',
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 25),

            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/create-trip',
                );
              },

              icon: const Icon(
                Icons.add,
              ),

              label: const Text(
                'Create Trip',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTripList(
    BuildContext context,
    TripProvider tripProvider,
  ) {
    return ListView.builder(
      padding: const EdgeInsets.all(20),

      itemCount: tripProvider.trips.length,

      itemBuilder: (context, index) {
        final trip =
            tripProvider.trips[index];

        return TripCard(
          trip: trip,

          onDelete: () {
            tripProvider.removeTrip(index);
          },
        );
      },
    );
  }
}