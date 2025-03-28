import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_netflix_ui/cubits/cubits.dart';
import 'package:flutter_netflix_ui/screens/screens.dart';
import 'package:flutter_netflix_ui/widgets/widgets.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({super.key});

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> _screens = const [
    HomeScreen(
      key: PageStorageKey('homeScreen'),
    ),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];

  final Map<String, IconData> _icons = const {
    'Home': Icons.home,
    'Search': Icons.search,
    'Coming Soon': Icons.queue_play_next,
    'Downloads': Icons.file_download,
    'More': Icons.menu,
  };

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<AppBarCubit>(
        create: (context) => AppBarCubit(),
        child: _screens[_currentIndex],
      ),
      bottomNavigationBar: !Responsive.isDesktop(context)
          ? BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.black,
              items: _icons
                  .map(
                    (title, icon) => MapEntry(
                      title,
                      BottomNavigationBarItem(
                        icon: Icon(
                          icon,
                          size: 30.0,
                        ),
                        label: title,
                      ),
                    ),
                  )
                  .values
                  .toList(),
              currentIndex: _currentIndex,
              selectedFontSize: 11.0,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey,
              onTap: (index) => setState(() {
                _currentIndex = index;
              }),
            )
          : null,
    );
  }
}
