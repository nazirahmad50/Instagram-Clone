import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/screens/activity_screen.dart';
import 'package:instagram_clone/screens/create_post_screen.dart';
import 'package:instagram_clone/screens/feed_screen.dart';
import 'package:instagram_clone/screens/profile_screen.dart';
import 'package:instagram_clone/screens/search_screen.dart';

class HomeScreen extends StatefulWidget {
  final String userId;
  HomeScreen({this.userId});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentTab = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  Widget btmNavBar() {
    return CupertinoTabBar(
      currentIndex: _currentTab,
      onTap: (int index) {
        setState(() {
          _currentTab = index;
        });
        // change pages on taping btm nav bar
        _pageController.animateToPage(
          index,
          duration: Duration(milliseconds: 200),
          curve: Curves.easeIn,
        );
      },
      activeColor: Colors.black,
      items: [
        BottomNavigationBarItem(
            icon: Icon(
          Icons.home,
          size: 32,
        )),
        BottomNavigationBarItem(
            icon: Icon(
          Icons.search,
          size: 32,
        )),
        BottomNavigationBarItem(
            icon: Icon(
          Icons.photo_camera,
          size: 32,
        )),
        BottomNavigationBarItem(
            icon: Icon(
          Icons.notifications,
          size: 32,
        )),
        BottomNavigationBarItem(
            icon: Icon(
          Icons.account_circle,
          size: 32,
        ))
      ],
    );
  }

  Widget pageView() {
    return PageView(
      // change pages based on sliding 
      controller: _pageController,
      onPageChanged: (int index) {
        setState(() {
          _currentTab = index;
        });
      },
      children: <Widget>[
        FeedScreen(),
        SearchScreen(),
        CreatePostScreen(),
        ActivityScreen(),
        ProfileScreen(userId:widget.userId),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Instagram",
          style: TextStyle(
            color: Colors.black,
            fontFamily: "Billabong",
            fontSize: 35,
          ),
        ),
      ),
      body: pageView(),
      bottomNavigationBar: btmNavBar(),
    );
  }
}
