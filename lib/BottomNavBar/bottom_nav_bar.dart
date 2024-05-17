import 'package:flutter/material.dart';
import 'package:maristcommerce/screen_pages/merch.dart';
import 'package:maristcommerce/screen_pages/my_account.dart';
import 'package:maristcommerce/screen_pages/my_cart.dart';
import 'package:maristcommerce/screen_pages/home_screen.dart';

class BottomNavBar extends StatefulWidget {
  final initialIndex;
  const BottomNavBar({super.key, this.initialIndex});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  var _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 0:
        _navigateToRoute(context, '/home', HomeScreen());
        break;
      case 1:
        _navigateToRoute(context, '/merch', Merch());
        break;
      case 2:
        _navigateToRoute(context, '/cart', MyCart());
        break;
      case 3:
        _navigateToRoute(context, '/myaccount', MyAccount());
        break;
    }
  }

  void _navigateToRoute(context, String routeName, Widget screen) {
    final String? currentRouteName = ModalRoute.of(context)?.settings.name;
    bool routeExists = currentRouteName == routeName;

    if (routeExists) {
      Navigator.popUntil(
        context,
        ModalRoute.withName(routeName),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => screen,
          settings: RouteSettings(name: routeName),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
        backgroundColor: Color(0xFF00BE62),
        selectedItemColor: Colors.white,
        unselectedItemColor: Color(0xFF7ED957),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              color: _selectedIndex == 0 ? Colors.white : Color(0xFF7ED957),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_bag_outlined,
              color: _selectedIndex == 1 ? Colors.white : Color(0xFF7ED957),
            ),
            label: 'Merch',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined,
                color: _selectedIndex == 2 ? Colors.white : Color(0xFF7ED957)),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_2_outlined,
              color: _selectedIndex == 3 ? Colors.white : Color(0xFF7ED957),
            ),
            label: 'My Account',
          ),
        ]);
  }
}
