import 'package:flutter/material.dart';

class MyExpanded extends StatelessWidget {
  const MyExpanded({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: const Column(
        children: [
          Row(
            children: [
              Icon(
                Icons.arrow_back_ios,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "List checklist ",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              Icon(
                Icons.check,
                color: Colors.blue,
              )
            ],
          ),
        ],
      ),
    );
  }
}
