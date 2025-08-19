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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // IndexedStack --> 모든 화면이 다 한번에 로딩
      body: IndexedStack(
        children: [
          HomeScreen(),
          NeighborhoodLifeScreen(),
          NearMeScreen(),
          ChattingScreen(),
          MyCarrotScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              label: 'Home', icon: Icon(CupertinoIcons.home)),
          BottomNavigationBarItem(
              label: 'Life', icon: Icon(CupertinoIcons.news)),
          BottomNavigationBarItem(
              label: 'Chat', icon: Icon(CupertinoIcons.chat_bubble)),
          BottomNavigationBarItem(
              label: 'Near me', icon: Icon(CupertinoIcons.placemark)),
        ],
      ),
    );
  }
}
