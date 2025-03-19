import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_clean_architecture/src/pages/daily_news/presentation/screens/daily_news_screen.dart';
import 'package:news_clean_architecture/src/widgets/themed_app_bar.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  int _selectedIndex = 0;
  PageController _pageController = PageController();

  void _onItemTapped(int index) {
    _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut, // Smooth transition
    );
  }

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: [
          Center(child: DailyNewsScreen()),
          Center(child: Text('Search Screen', style: TextStyle(fontSize: 24))),
          Center(child: Text('Profile Screen', style: TextStyle(fontSize: 24))),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _onItemTapped(1); // Navigate to Search Screen
        },
        backgroundColor: Colors.blue,
        shape: CircleBorder(),
        child: Icon(Icons.search, size: 28, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.home, color: _selectedIndex == 0 ? Colors.blue : Colors.grey),
              onPressed: () => _onItemTapped(0),
            ),
            SizedBox(width: 40), // Space for FAB
            IconButton(
              icon: Icon(Icons.person, color: _selectedIndex == 2 ? Colors.blue : Colors.grey),
              onPressed: () => _onItemTapped(2),
            ),
          ],
        ),
      ),
    );
  }
}
