import 'package:flutter/material.dart';
import '../models/destination.dart';

class DestinationDetailsPage extends StatelessWidget {
  const DestinationDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final destination =
        ModalRoute.of(context)!.settings.arguments
            as Destination;

    return Scaffold(
      appBar: AppBar(
        title: Text(destination.name),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30),

        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [
            SizedBox(
              height: 350,
              width: double.infinity,

              child: Image.network(
                destination.image,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 25),

            Text(
              destination.name,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),

            Text(
              destination.country,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 20),

            Text(
              destination.description,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/create-trip',
                );
              },

              child: const Text(
                'Add to My Trip',
              ),
            ),
          ],
        ),
      ),
    );
  }
}