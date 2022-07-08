import 'package:flutter/material.dart';
import 'package:meesh_app/apps/meeesh_mobile_app/modules/home_page/home_page.dart';
import 'package:meesh_app/apps/widgets/app_state.dart';
import 'package:animations/animations.dart';
import 'modules/profile_page/profile_page.dart';

class MeeshApp extends StatefulWidget {
  const MeeshApp({Key? key}) : super(key: key);

  @override
  State<MeeshApp> createState() => _MeeshAppState();
}

class _MeeshAppState extends State<MeeshApp> {
  String title = 'title';

  final _pageList = <Widget>[
    const HomePage(),
    const ProfilePage(),
  ];

  void handleSetPageIndex(selectedIndex) {
    AppStateWidget.of(context).setPageIndex(selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    var pageIndex = AppStateScope.of(context).pageIndex;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Meesh`s siq fuckin App'),
      ),
      body: PageTransitionSwitcher(
        transitionBuilder: (
          child,
          animation,
          secondaryAnimation,
        ) {
          return FadeThroughTransition(
            animation: animation,
            secondaryAnimation: secondaryAnimation,
            child: child,
          );
        },
        child: _pageList[pageIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageIndex,
        onTap: (selectedIndex) => handleSetPageIndex(selectedIndex),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.house),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.photo),
            label: 'Profile',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.library_books_rounded),
          //   label: 'Details',
          // ),
        ],
      ),
    );
  }
}