import 'package:flutter/material.dart';

class MyListView extends StatelessWidget {
  MyListView({super.key});
  final List<String> categories = [
    "All",
    "Living Room",
    "Bedroom",
    "Dining Room",
    "Kitchen",
    "Bedroom",
    "Dining Room",
    "Kitchen",
    "Bedroom",
    "Dining Room",
    "Kitchen",
  ];
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 35,
              child: CustomListView(
                categories: categories,
                scrollDirection: Axis.horizontal,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 500,
                child: CustomListView(
                  categories: categories,
                  scrollDirection: Axis.vertical,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class CustomListView extends StatelessWidget {
  const CustomListView({
    super.key,
    required this.categories,
    required this.scrollDirection,
  });

  final List<String> categories;
  final Axis scrollDirection;

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: scrollDirection,
      children: List.generate(
        categories.length,
        (index) {
          return GestureDetector(
            onTap: () {},
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 8,
              ),
              margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
              child: Text(categories[index],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1,
                  )),
            ),
          );
        },
      ),
    );
  }
}


// Listview.builder untuk banyak data

// ListView.builder(
//       itemCount: categories.length,
    //   itemBuilder: (BuildContext context, int index) {
    //     return GestureDetector(
    //       onTap: () {},
    //       child: AnimatedContainer(
    //         duration: const Duration(milliseconds: 150),
    //         decoration: BoxDecoration(
    //           borderRadius: BorderRadius.circular(20),
    //           color: Colors.grey,
    //         ),
    //         padding: const EdgeInsets.symmetric(
    //           horizontal: 24,
    //           vertical: 8,
    //         ),
    //         margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
    //         child: Text(categories[index],
    //             textAlign: TextAlign.center,
    //             style: const TextStyle(
    //               fontSize: 12,
    //               color: Colors.black,
    //               fontWeight: FontWeight.w500,
    //               letterSpacing: 1,
    //             )),
    //       ),
    //     );
    //   },
    // );
