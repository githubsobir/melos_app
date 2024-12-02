import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home/home_screen.dart';
import 'package:locations/locations_screen.dart';
import 'package:main/main_cubit.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  // final cubit = MainCubit(inject());
  final cubit = MainCubit();

  static final List<Widget> _mainScreens = <Widget>[
    HomeScreen(),
    LocationsScreen(),
    Container(
      color: Colors.blue,
    ),
    Container(
      color: Colors.greenAccent,
    ),
    Container(
      color: Colors.yellow,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: cubit,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Сохранено"),
          ),
          body: _mainScreens[cubit.currentMenuPosition],
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.home),
                ),
                activeIcon: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.home_outlined),
                ),
                label: "Основной",
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.notifications),
                ),
                activeIcon: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.notifications_outlined),
                ),
                label: "Рядом со мной",
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.add_circle_outline),
                ),
                activeIcon: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.add_circle_outline),
                ),
                label: "Templates",
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.settings),
                ),
                activeIcon: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.settings_outlined),
                ),
                label: "Sms",
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.settings),
                ),
                activeIcon: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.account_circle),
                ),
                label: "Sms",
              ),
            ],
            currentIndex: cubit.currentMenuPosition,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            onTap: _onItemTapped,
          ),
        );
      },
    );
  }

  void _onItemTapped(int index) {
    if (index!=2) {
      cubit.changeMenuPosition(index);
    } else {
      print("addd");
    }
  }
}
