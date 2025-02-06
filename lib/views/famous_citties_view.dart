import 'package:flutter/material.dart';
import 'package:weather_tutorial/models/famous_cities.dart';
import 'package:weather_tutorial/widgets/famous_cities_tile.dart';

class FamousCittiesView extends StatelessWidget {
  const FamousCittiesView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: famousCities.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 20, mainAxisSpacing: 20),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final city = famousCities[index];
          return FamousCitiesTile(
            city: city.name,
            index: index,
          );
        });
  }
}
