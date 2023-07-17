import 'package:flutter/material.dart';
import 'package:naulo/sign_in_up/login_screen.dart';

import 'common/widgets/bottom_bar.dart';
import 'features/address/screens/address_screen.dart';
import 'features/admin/screens/add_product_screen.dart';
import 'features/admin/screens/admin_screen.dart';
import 'features/auction/screens/auction_screen.dart';
import 'features/auth/screens/auth_screen.dart';
import 'features/home/screens/category_details_screen.dart';
import 'features/home/screens/home_screen.dart';
import 'features/product_details/screens/product_detail_screen.dart';
import 'features/search/screens/search_screen.dart';
import 'models/product.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AuthScreen(),
      );

    case LoginScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const LoginScreen(),
      );

    case AuctionScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AuctionScreen(),
      );

    case AddressScreen.routeName:
      var totalAmount = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => AddressScreen(
          totalAmount: totalAmount,
        ),
      );

    case SearchScreen.routeName:
      var searchQuery = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => SearchScreen(
          searchQuery: searchQuery,
        ),
      );

    case ProductDetailScreen.routeName:
      var productDetails = routeSettings.arguments as Product;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => ProductDetailScreen(
          product: productDetails,
        ),
      );

    case CategoryDetailsScreen.routeName:
      var category = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => CategoryDetailsScreen(
          category: category,
        ),
      );

    case AddProductScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AddProductScreen(),
      );

    case AdminScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AdminScreen(),
      );

    case HomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const HomeScreen(),
      );

    case BottomBar.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const BottomBar(),
      );

    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text("Error 404"),
          ),
        ),
      );
  }
}
