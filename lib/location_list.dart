import 'dart:math';

import 'package:flutter/material.dart';
import 'models/location.dart';
import 'styles.dart';
import 'location_detail.dart';

class LocationList extends StatelessWidget {
  final List<Location> locations;

  LocationList(this.locations);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Center(
        child: Text('List of Locations', style: Styles.navbarTitle),
      )),
      body: ListView.builder(
          itemCount: locations.length, itemBuilder: _listViewItemBuilder),
    );
  }

  Widget _listViewItemBuilder(BuildContext context, int index) {
    Location location = locations[index];
    return ListTile(
      contentPadding: const EdgeInsets.all(10.0),
      leading: _itemThumbnail(location),
      title: _itemTitle(location),
      onTap: () => _navigateToItemPage(context, location),
    );
  }

  void _navigateToItemPage(BuildContext context, Location location) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => LocationDetail(location)));
  }

  Widget _itemThumbnail(Location location) {
    return Container(
        constraints: const BoxConstraints.tightFor(width: 100.0),
        child: Image.network(
          location.url,
          fit: BoxFit.fitWidth,
        ));
  }

  Widget _itemTitle(Location location) {
    return Text('>>> ${location.name}', style: Styles.textDefault);
  }
}
