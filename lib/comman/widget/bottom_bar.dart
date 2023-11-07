import 'package:flutter/material.dart' hide Badge;
import 'package:youtube_clone/constants/global_variable.dart';
import 'package:badges/badges.dart' as badge;
import 'package:youtube_clone/features/Account/Screen/Account.dart';
import 'package:youtube_clone/features/Home/Screen/HomeScreen.dart';
class BottomBar extends StatefulWidget {
  static const String routeName = './actual-home';

  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;
  double _bottomBarWidth = 42;
  double _bottomBarBorderWidth = 42;
  List<Widget>pages=[
    const HomeScreen(),
    const AccountScreen(),
  ];
void updatePage(int page){
  setState(() {
    _page=page;
  });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        selectedItemColor: GlobalVariables.selectedNavBarColor,
        unselectedItemColor: GlobalVariables.unselectedNavBarColor,
        backgroundColor: GlobalVariables.backgroundColor,
        iconSize: 28,
        onTap: updatePage,
        items: [
          BottomNavigationBarItem(
              icon: Container(
            width: _bottomBarWidth,
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(
                        color: _page == 0
                            ? GlobalVariables.selectedNavBarColor
                            : GlobalVariables.unselectedNavBarColor,
                      width: _bottomBarBorderWidth
                    )
                )
            ),
                child: const Icon(Icons.home_outlined),
          ),
            label: "Home"
          ),BottomNavigationBarItem(
              icon: Container(
            width: _bottomBarWidth,
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(
                        color: _page == 1
                            ? GlobalVariables.selectedNavBarColor
                            : GlobalVariables.unselectedNavBarColor,
                      width: _bottomBarBorderWidth
                    )
                )
            ),
                child: const Icon(Icons.person_2_outlined),
          ),
            label: ""
          ),BottomNavigationBarItem(
              icon: Container(
            width: _bottomBarWidth,
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(
                        color: _page == 2
                            ? GlobalVariables.selectedNavBarColor
                            : GlobalVariables.unselectedNavBarColor,
                      width: _bottomBarBorderWidth
                    )
                )
            ),
                child: const Icon(Icons.home_outlined),
          ),
            label: "Home"
          )
        ],
      ),
    );
  }
}
