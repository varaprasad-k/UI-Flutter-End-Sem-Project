import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/trip.dart';
import '../providers/trip_provider.dart';

class CreateTripPage extends StatefulWidget {
  const CreateTripPage({super.key});

  @override
  State<CreateTripPage> createState() => _CreateTripPageState();
}

class _CreateTripPageState extends State<CreateTripPage> {
  final formKey = GlobalKey<FormState>();

  final travellersController = TextEditingController();
  final budgetController = TextEditingController();

  String? selectedDestination;

  @override
  void dispose() {
    travellersController.dispose();
    budgetController.dispose();
    super.dispose();
  }

  void createTrip() {
    if (formKey.currentState!.validate()) {
      final trip = Trip(
        destination: selectedDestination!,
        travellers: int.parse(
          travellersController.text,
        ),
        budget: double.parse(
          budgetController.text,
        ),
      );

      Provider.of<TripProvider>(
        context,
        listen: false,
      ).addTrip(trip);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Trip created successfully!',
          ),
        ),
      );

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Create Trip',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),

          child: SizedBox(
            width: 500,

            child: Form(
              key: formKey,

              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.stretch,

                children: [
                  const Text(
                    'Plan Your Trip',
                    textAlign: TextAlign.center,

                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    'Enter your trip details below.',
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 30),

                  // Destination
                  DropdownButtonFormField<String>(
                    value: selectedDestination,

                    decoration: const InputDecoration(
                      labelText: 'Destination',
                      border: OutlineInputBorder(),
                    ),

                    items: const [
                      DropdownMenuItem(
                        value: 'Goa',
                        child: Text('Goa'),
                      ),
                      DropdownMenuItem(
                        value: 'Kashmir',
                        child: Text('Kashmir'),
                      ),
                      DropdownMenuItem(
                        value: 'Manali',
                        child: Text('Manali'),
                      ),
                      DropdownMenuItem(
                        value: 'Jaipur',
                        child: Text('Jaipur'),
                      ),
                      DropdownMenuItem(
                        value: 'Kerala',
                        child: Text('Kerala'),
                      ),
                    ],

                    onChanged: (value) {
                      setState(() {
                        selectedDestination = value;
                      });
                    },

                    validator: (value) {
                      if (value == null ||
                          value.isEmpty) {
                        return 'Please select a destination';
                      }

                      return null;
                    },
                  ),

                  const SizedBox(height: 20),

                  // Number of travellers
                  TextFormField(
                    controller: travellersController,

                    keyboardType:
                        TextInputType.number,

                    decoration: const InputDecoration(
                      labelText: 'Number of Travellers',
                      border: OutlineInputBorder(),
                    ),

                    validator: (value) {
                      if (value == null ||
                          value.isEmpty) {
                        return 'Please enter number of travellers';
                      }

                      if (int.tryParse(value) == null) {
                        return 'Please enter a valid number';
                      }

                      if (int.parse(value) <= 0) {
                        return 'Number must be greater than 0';
                      }

                      return null;
                    },
                  ),

                  const SizedBox(height: 20),

                  // Budget
                  TextFormField(
                    controller: budgetController,

                    keyboardType:
                        const TextInputType.numberWithOptions(
                      decimal: true,
                    ),

                    decoration: const InputDecoration(
                      labelText: 'Budget',
                      prefixText: '₹ ',
                      border: OutlineInputBorder(),
                    ),

                    validator: (value) {
                      if (value == null ||
                          value.isEmpty) {
                        return 'Please enter your budget';
                      }

                      if (double.tryParse(value) == null) {
                        return 'Please enter a valid budget';
                      }

                      if (double.parse(value) <= 0) {
                        return 'Budget must be greater than 0';
                      }

                      return null;
                    },
                  ),

                  const SizedBox(height: 30),

                  ElevatedButton.icon(
                    onPressed: createTrip,

                    icon: const Icon(
                      Icons.add,
                    ),

                    label: const Text(
                      'Create Trip',
                    ),

                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}