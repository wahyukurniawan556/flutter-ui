import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          shadowColor: Colors.grey[20],
          elevation: 5.0,
        ),
        child: Text(
          "Add To Cart".toUpperCase(),
          style: const TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.w500, color: Colors.white),
        ),
      ),
    );
  }
}
