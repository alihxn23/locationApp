import 'package:flutter/material.dart';
import 'location_detail.dart';
import 'mocks/mock_location.dart';
import 'models/location.dart';
import 'location_list.dart';

void main() {
  // final Location mockLocation = MockLocation.fetchAny();
  final List<Location> mockLocations = MockLocation.fetchAll();

  runApp(MaterialApp(
    home: LocationList(mockLocations),
  ));
}
