import 'package:flutter/material.dart';
import 'package:flight/routes/app_routes.dart';
import 'package:flight/views/flight_listing.dart';
import 'package:flight/views/splash_screen.dart';

class AppRouter {
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.flights:
        return _materialRoute(const FlightListingScreen());

      default:
        return _materialRoute(const SplashScreen());
    }
  }

  // ignore: unused_element
  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
