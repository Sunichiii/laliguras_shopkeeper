import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';


class PrimaryNavbar extends StatelessWidget {
  const PrimaryNavbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final navigationProvider = Provider.of<NavigationProvider>(context);

    return BottomNavigationBar(
      currentIndex: navigationProvider.currentIndex,
      onTap: (index) {
        navigationProvider.setIndex(index);

        switch (index) {
          case 0:
            Navigator.pushReplacementNamed(context, '/home');
            break;
          case 1:
            Navigator.pushReplacementNamed(context, '/pick');
            break;
          case 2:
            Navigator.pushReplacementNamed(context, '/search');
            break;
          case 3:
            Navigator.pushReplacementNamed(context, '/profile');
            break;
        }
      },
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.black,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border_outlined),
          label: 'Favourite',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: 'Profile',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.inventory_2_outlined),
          label: 'Package',
        ),
      ],
    );
  }
}
