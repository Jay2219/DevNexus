import 'package:devnexus/constants/constants.dart';
import 'package:flutter/material.dart';

class UIConstants {
  static AppBar appBar() {
    return AppBar(
      title: Image.asset(
        AssetsConstants.appLogo,
        height: 30,
      ),
      centerTitle: true,
    );
  }

  static AppBar appBarHome(){
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.only(left: 8,top: 10),
        child: Image.asset(
          AssetsConstants.appLogo,
        ),
      ),
      title: const Padding(
        padding: EdgeInsets.only(left: 8,top: 8),
        child: SearchBar(
          leading: Icon(Icons.search),
          hintText: 'Search',
          constraints: BoxConstraints(
            maxWidth: 200.0
          ),
          // backgroundColor: ,
          // padding: ,
        ),
      ),
      actions: const [
        Icon(Icons.notifications_none),
        SizedBox(
          width: 15,
        ),
        CircleAvatar(
          minRadius: 15,
          child: Icon(Icons.person_outline),
        ),
        SizedBox(
          width: 15,
        ),
      ],
    );
  }

  static List<Widget> sideTabBarPages =[
    Container(
      child: Center(
        child: Text(
          'Home',
        ),
      ),
    ),
    Container(
      child: Center(
        child: Text(
          'Explore',
        ),
      ),
    ),
    Container(
      child: Center(
        child: Text(
          'Notifications',
        ),
      ),
    ),
    Container(
      child: Center(
        child: Text(
          'Profile',
        ),
      ),
    ),
  ];
}
