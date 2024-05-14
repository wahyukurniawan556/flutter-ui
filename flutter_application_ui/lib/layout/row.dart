import 'package:flutter/material.dart';

class MyRow extends StatelessWidget {
  const MyRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.grey,
          ),
          child: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {},
          ),
        ),
        const Text(
          "Detail",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.normal,
          ),
        ),
        IconButton(
          icon: const Icon(
            Icons.share,
            size: 32,
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
