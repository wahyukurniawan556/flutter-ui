import 'package:flutter/material.dart';
import 'package:flutter_application_1/navigator/halaman2.dart';
import 'package:flutter_application_1/navigator/halaman3.dart';
import 'package:flutter_application_1/navigator/halaman4.dart';
import 'package:flutter_application_1/navigator/halaman5.dart';
import 'package:flutter_application_1/navigator/home.dart';

class MyScaffold extends StatefulWidget {
  const MyScaffold({super.key, required this.title});

  final String title;

  @override
  State<MyScaffold> createState() => _MyScaffoldState();
}

class _MyScaffoldState extends State<MyScaffold> {
  List<Widget> pages = [Home(), Hal2(), Hal3(), Hal4(), MyForm()];
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor:
              Theme.of(context).colorScheme.background.withBlue(100),
          title: Text(widget.title),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert),
            ),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              Container(
                color: Colors.blue[100],
                child: UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                  ),
                  accountName: const Text(
                    'Khanif Zyen',
                    style: TextStyle(color: Colors.black),
                  ),
                  accountEmail: const Text(
                    "khanif.zyen@gmail.com",
                    style: TextStyle(color: Colors.black),
                  ),
                  currentAccountPicture: const CircleAvatar(
                    child: FlutterLogo(size: 50),
                  ),
                ),
              ),
              ListTile(
                title: const Text('Item 1'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Item 2'),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const Hal2()));
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.mail),
              label: 'Messages',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_comment),
              label: 'hal4',
            ),
            BottomNavigationBarItem(
              icon: Stack(
                clipBehavior: Clip.none,
                children: [
                  Icon(
                    Icons.shopping_cart,
                  ),
                  Positioned(
                    top: -4,
                    right: -4,
                    child: CircleAvatar(
                      radius: 8,
                      backgroundColor: Colors.red,
                      child: Text(
                        "1",
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              label: 'hal5',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          unselectedItemColor: Colors.grey,
          onTap: _onItemTapped,
        ),
        body: IndexedStack(
          index: _selectedIndex,
          children: pages,
        ));
  }
}
