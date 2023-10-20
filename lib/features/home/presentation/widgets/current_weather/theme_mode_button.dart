import 'package:flutter/material.dart';

class ThemeModeButton extends StatelessWidget {
  const ThemeModeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: const Icon(
        Icons.nightlight_round,
        color: Colors.white,
      ),
    );
  }
}
