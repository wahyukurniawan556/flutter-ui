import 'package:flutter/material.dart';

class MyAvatar extends StatelessWidget {
  const MyAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    List<Color> colors = [
      Colors.red,
      Colors.green,
      Colors.blue,
    ];
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage('https://picsum.photos/200'),
          ),
          Row(
            children: [
              ...List.generate(
                colors.length,
                (index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: colors[index],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
