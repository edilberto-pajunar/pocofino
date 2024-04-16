// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:pocofino/views/screens/account/account_screen.dart' as _i1;
import 'package:pocofino/views/screens/activity/activity_screen.dart' as _i2;
import 'package:pocofino/views/screens/cart/cart_screen.dart' as _i3;
import 'package:pocofino/views/screens/home/home_screen.dart' as _i5;
import 'package:pocofino/views/screens/home/menu_screen.dart' as _i6;
import 'package:pocofino/views/screens/home/product_details_screen.dart' as _i7;
import 'package:pocofino/views/screens/home_navigation_screen.dart' as _i4;
import 'package:pocofino/views/screens/wallet/wallet_screen.dart' as _i8;

abstract class $AppRouter extends _i9.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    AccountRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AccountScreen(),
      );
    },
    ActivityRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.ActivityScreen(),
      );
    },
    CartRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.CartScreen(),
      );
    },
    HomeNavigationRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.HomeNavigationScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.HomeScreen(),
      );
    },
    MenuRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.MenuScreen(),
      );
    },
    ProductDetailsRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.ProductDetailsScreen(),
      );
    },
    WalletRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.WalletScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AccountScreen]
class AccountRoute extends _i9.PageRouteInfo<void> {
  const AccountRoute({List<_i9.PageRouteInfo>? children})
      : super(
          AccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccountRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i2.ActivityScreen]
class ActivityRoute extends _i9.PageRouteInfo<void> {
  const ActivityRoute({List<_i9.PageRouteInfo>? children})
      : super(
          ActivityRoute.name,
          initialChildren: children,
        );

  static const String name = 'ActivityRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i3.CartScreen]
class CartRoute extends _i9.PageRouteInfo<void> {
  const CartRoute({List<_i9.PageRouteInfo>? children})
      : super(
          CartRoute.name,
          initialChildren: children,
        );

  static const String name = 'CartRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i4.HomeNavigationScreen]
class HomeNavigationRoute extends _i9.PageRouteInfo<void> {
  const HomeNavigationRoute({List<_i9.PageRouteInfo>? children})
      : super(
          HomeNavigationRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeNavigationRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i5.HomeScreen]
class HomeRoute extends _i9.PageRouteInfo<void> {
  const HomeRoute({List<_i9.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i6.MenuScreen]
class MenuRoute extends _i9.PageRouteInfo<void> {
  const MenuRoute({List<_i9.PageRouteInfo>? children})
      : super(
          MenuRoute.name,
          initialChildren: children,
        );

  static const String name = 'MenuRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i7.ProductDetailsScreen]
class ProductDetailsRoute extends _i9.PageRouteInfo<void> {
  const ProductDetailsRoute({List<_i9.PageRouteInfo>? children})
      : super(
          ProductDetailsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProductDetailsRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i8.WalletScreen]
class WalletRoute extends _i9.PageRouteInfo<void> {
  const WalletRoute({List<_i9.PageRouteInfo>? children})
      : super(
          WalletRoute.name,
          initialChildren: children,
        );

  static const String name = 'WalletRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}
