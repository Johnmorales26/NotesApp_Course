import 'package:flutter/material.dart';

class ResponsiveLayout {
  static const int mobileMaxWidth = 576;
  static const int tabletMaxWidth = 992;
  static const int desktopMaxWidth = 1200;

  // Determina si la pantalla se considera móvil
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width <= mobileMaxWidth;
  }

  // Determina si la pantalla se considera tableta
  static bool isTablet(BuildContext context) {
    return mobileMaxWidth < MediaQuery.of(context).size.width &&
        MediaQuery.of(context).size.width <= tabletMaxWidth;
  }

  // Determina si la pantalla se considera de escritorio
  static bool isDesktop(BuildContext context) {
    return tabletMaxWidth < MediaQuery.of(context).size.width &&
        MediaQuery.of(context).size.width <= desktopMaxWidth;
  }

  // Determina si la pantalla se considera grande (mayor que el ancho de escritorio)
  static bool isLarge(BuildContext context) {
    return desktopMaxWidth < MediaQuery.of(context).size.width;
  }
}
