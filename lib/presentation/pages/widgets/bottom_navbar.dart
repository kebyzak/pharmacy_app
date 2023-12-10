import 'package:flutter/material.dart';
import 'package:pharmacy_app/presentation/pages/screens/news_page.dart';
import 'package:pharmacy_app/presentation/pages/screens/profile_page.dart';
import 'package:pharmacy_app/presentation/pages/screens/qr_page.dart';
import 'package:pharmacy_app/presentation/pages/screens/stories_page.dart';

class AnimatedBottomNavBarPage extends StatefulWidget {
  const AnimatedBottomNavBarPage({super.key, required this.initialIndex});

  final int initialIndex;

  @override
  _AnimatedBottomNavBarPageState createState() =>
      _AnimatedBottomNavBarPageState();
}

class _AnimatedBottomNavBarPageState extends State<AnimatedBottomNavBarPage> {
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: widget.initialIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          const NewsPage(),
          StoriesPage(),
          const QrPage(),
          const ProfilePage(),
        ],
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.redAccent,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _currentIndex,
        elevation: 0,
        onTap: (index) {
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper_rounded),
            label: 'News',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.web_stories_rounded),
            label: 'Stories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_rounded),
            label: 'QR',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_rounded),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
