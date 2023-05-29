import 'package:devnexus/constants/constants.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:devnexus/theme/theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const HomeView(),
      );
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  PageController page = PageController();
  SideMenuController sideMenu = SideMenuController();
  final appBar = UIConstants.appBarHome();

  @override
  void initState() {
    sideMenu.addListener((p0) {
      page.jumpToPage(p0);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8, top: 20, right: 8),
            child: SideMenu(
              controller: sideMenu,
              style: SideMenuStyle(
                displayMode: SideMenuDisplayMode.compact,
                hoverColor: Pallete.lightGreyColor,
                selectedColor: Pallete.blueColor,
                selectedTitleTextStyle:
                    const TextStyle(color: Pallete.whiteColor),
                selectedIconColor: Pallete.whiteColor,
                unselectedTitleTextStyle:
                    const TextStyle(color: Pallete.whiteColor),
                unselectedIconColor: Pallete.greyColor,
              ),
              items: [
                SideMenuItem(
                  priority: 0,
                  title: 'Home',
                  icon: const Icon(Icons.home),
                  onTap: (page, _) {
                    sideMenu.changePage(page);
                  },
                ),
                SideMenuItem(
                  priority: 1,
                  title: 'Explore',
                  icon: const Icon(Icons.explore),
                  onTap: (page, _) {
                    sideMenu.changePage(page);
                  },
                ),
                SideMenuItem(
                  priority: 2,
                  title: 'Notifications',
                  icon: const Icon(Icons.notifications),
                  onTap: (page, _) {
                    sideMenu.changePage(page);
                  },
                ),
                SideMenuItem(
                  priority: 3,
                  title: 'Profile',
                  icon: const Icon(Icons.person),
                  onTap: (page, _) {
                    sideMenu.changePage(page);
                  },
                ),
                const SideMenuItem(
                  priority: 4,
                  title: 'Sign Out',
                  icon: Icon(Icons.logout),
                ),
              ],
            ),
          ),
          Expanded(
            child: PageView(
              controller: page,
              children: UIConstants.sideTabBarPages,
            ),
          )
        ],
      ),
    );
  }
}
