import 'package:flutter/material.dart';

class MyRatio extends StatelessWidget {
  const MyRatio({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 180 / 240,
      child: Container(
        color: Colors.red,
      ),
    );
  }
}
