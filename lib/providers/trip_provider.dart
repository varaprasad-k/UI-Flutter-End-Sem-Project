import 'package:flutter/material.dart';
import '../models/trip.dart';

class TripProvider extends ChangeNotifier {
  final List<Trip> _trips = [];

  List<Trip> get trips => _trips;

  void addTrip(Trip trip) {
    _trips.add(trip);
    notifyListeners();
  }

  void removeTrip(int index) {
    _trips.removeAt(index);
    notifyListeners();
  }
}