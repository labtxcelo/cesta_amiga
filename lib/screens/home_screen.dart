import 'package:flutter/material.dart';

import 'feed_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final List<Widget> _children = [
    FeedScreen(),
    Container(
      color: Colors.blue,
    ),
    Container(
      color: Colors.green,
    ),
    Container(
      color: Colors.yellow,
    ),
  ];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IndexedStack(
        index: this.index,
        children: this._children,
      ),
      bottomNavigationBar: _buildBottomBar(context, this.index),
    );
  } //end build

  Widget _buildBottomBar(BuildContext context, int currentIndex) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          label: '',
          icon: Icon(
            Icons.home,
            color: currentIndex == 0 ? Colors.red : Colors.black,
            size: 30,
          ),
        ),
        BottomNavigationBarItem(
          label: '',
          icon: Icon(
            Icons.favorite_border,
            color: currentIndex == 1 ? Colors.red : Colors.black,
          ),
        ),
        BottomNavigationBarItem(
          label: '',
          icon: Icon(
            Icons.person_outline,
            color: currentIndex == 2 ? Colors.red : Colors.black,
            size: 30,
          ),
        ),
        BottomNavigationBarItem(
          label: '',
          icon: Icon(
            Icons.update,
            color: currentIndex == 3 ? Colors.red : Colors.black,
            size: 30,
          ),
        ),
      ],
      currentIndex: currentIndex,
      elevation: 0,
      selectedItemColor: Colors.red,
      onTap: (int index) {
        setState(() {
          this.index = index;
        });
      },
    );
  } //end _buildBottomBar

} //end class
