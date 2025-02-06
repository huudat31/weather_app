import 'package:flutter/material.dart';
import 'package:weather_tutorial/constants/app_colors.dart';

class RoundTextField extends StatelessWidget {
  const RoundTextField({super.key, required this.controller});
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
        color: AppColors.accentBlue,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextField(
          controller: controller,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(top: 10.0, left: 20),
            border: InputBorder.none,
            fillColor: Colors.white,
            focusColor: Colors.white,
            // hoverColor: Colors.white,
            hintText: "Search",
            hintStyle: const TextStyle(
                color: Colors.grey, fontWeight: FontWeight.w400),
          )),
    );
  }
}
