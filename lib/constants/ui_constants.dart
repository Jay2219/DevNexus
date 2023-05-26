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
}
