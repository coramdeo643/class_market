import 'package:class_market/ch02/screens/chatting/chatting_screen.dart';
import 'package:class_market/ch02/screens/home/home_screen.dart';
import 'package:class_market/ch02/screens/my_carrot/my_carrot_screen.dart';
import 'package:class_market/ch02/screens/near_me/near_me_screen.dart';
import 'package:class_market/ch02/screens/neighborhood_life/neighborhood_life_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    print("main02->mainScreen() build() 함수 호출됨");
    return Scaffold(
      // IndexedStack --> 모든 화면이 다 한번에 로딩
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          HomeScreen(),
          NeighborhoodLifeScreen(),
          NearMeScreen(),
          ChattingScreen(),
          MyCarrotScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        //backgroundColor: Colors.black,
        onTap: (value) {
          _selectedIndex = value;
          setState(() {});
        },
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              label: 'Home', icon: Icon(CupertinoIcons.house_fill)),
          BottomNavigationBarItem(
              label: 'Life', icon: Icon(CupertinoIcons.building_2_fill)),
          BottomNavigationBarItem(
              label: 'Near', icon: Icon(CupertinoIcons.placemark_fill)),
          BottomNavigationBarItem(
              label: 'Chat', icon: Icon(CupertinoIcons.chat_bubble_2_fill)),
          BottomNavigationBarItem(
              label: 'My', icon: Icon(CupertinoIcons.profile_circled)),
        ],
      ),
    );
  }
}
