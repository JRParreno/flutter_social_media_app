import 'package:flutter/material.dart';
import 'package:social_media_app/src/common/navigation/home_navigation.dart';
import 'package:social_media_app/src/core/theme.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;
  late List<Widget> _pages;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _selectedIndex = 0;

    _pages = [
      const HomeNavigation(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          return !await Navigator.maybePop(
            MyKeys.getKeys()[_selectedIndex].currentState!.context,
          );
        },
        child: IndexedStack(
          index: _selectedIndex,
          children: _pages,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.circle),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        backgroundColor: AppTheme.lightColor,
        selectedItemColor: AppTheme.primaryColor,
        elevation: 0,
        unselectedItemColor: AppTheme.darkColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        enableFeedback: true,
      ),
    );
  }
}

class MyKeys {
  static final homeTab = GlobalKey(debugLabel: 'homeTab');
  static final searchTab = GlobalKey(debugLabel: 'searchTab');
  static final addTab = GlobalKey(debugLabel: 'addTab');
  static final notifTab = GlobalKey(debugLabel: 'notifTab');
  static final profileTab = GlobalKey(debugLabel: 'profileTab');

  static List<GlobalKey> getKeys() =>
      [homeTab, searchTab, addTab, notifTab, profileTab];
}
