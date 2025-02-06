import 'package:flutter/material.dart';
import 'package:weather_tutorial/constants/app_colors.dart';
import 'package:weather_tutorial/constants/text_styles.dart';
import 'package:weather_tutorial/views/famous_citties_view.dart';
import 'package:weather_tutorial/views/gradient_container.dart';
import 'package:weather_tutorial/widgets/round_text_field.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late final TextEditingController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientContainer(children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Pick Location', style: TextStyles.h1),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Find your area or the city that you want to know the detail weather info at the time',
              style: TextStyles.subtitleText,
              textAlign: TextAlign.center,
            ),
          ],
        ),
        const SizedBox(
          height: 40,
        ),
        Row(
          children: [
            Expanded(child: RoundTextField(controller: _controller)),
            const SizedBox(
              width: 15,
            ),
            LocationIcon()
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        FamousCittiesView()
      ]),
    );
  }
}

class LocationIcon extends StatelessWidget {
  const LocationIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: 55,
      decoration: BoxDecoration(
        color: AppColors.accentBlue,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: const Icon(
        Icons.location_on_outlined,
        color: Colors.white,
      ),
    );
  }
}
