import 'package:flutter/material.dart';
import 'package:flutter_application_ui/main.dart';

void main() {
  runApp(const MyApp());
}

class MyImage extends StatelessWidget {
  const MyImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: Image.asset("../images/02 appbar.png")),
    );
  }
}
