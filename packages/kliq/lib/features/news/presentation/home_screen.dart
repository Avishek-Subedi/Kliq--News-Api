import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kliq/features/auth/presentation/profile/profile_screen.dart';
import 'package:kliq/features/favourite/presentation/favourite_screen.dart';
import 'package:kliq/features/news/presentation/news_screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  /// List Of Screen
  final List<Widget> _screens = const [
    NewsScreen(),
    FavouriteScreen(),
    ProfileScreen()
  ];

  /// Selected Screens
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          _selectedIndex = index;
          setState(() {});
        },
        currentIndex: _selectedIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper),
            label: 'News',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            label: 'Favourite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
