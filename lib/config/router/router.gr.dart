// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i13;
import 'package:pocofino/views/screens/account/account_screen.dart' as _i1;
import 'package:pocofino/views/screens/activity/activity_navigation_screen.dart'
    as _i3;
import 'package:pocofino/views/screens/activity/completed_screen.dart' as _i2;
import 'package:pocofino/views/screens/activity/ongoing_screen.dart' as _i4;
import 'package:pocofino/views/screens/cart/cart_screen.dart' as _i5;
import 'package:pocofino/views/screens/cart/order_screen.dart' as _i9;
import 'package:pocofino/views/screens/cart/order_success_screen.dart' as _i10;
import 'package:pocofino/views/screens/home/home_screen.dart' as _i7;
import 'package:pocofino/views/screens/home/menu_screen.dart' as _i8;
import 'package:pocofino/views/screens/home/product_details_screen.dart'
    as _i11;
import 'package:pocofino/views/screens/home_navigation_screen.dart' as _i6;
import 'package:pocofino/views/screens/wallet/wallet_screen.dart' as _i12;

abstract class $AppRouter extends _i13.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i13.PageFactory> pagesMap = {
    AccountRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AccountScreen(),
      );
    },
    ActivityCompletedRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.ActivityCompletedScreen(),
      );
    },
    ActivityNavigationRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.ActivityNavigationScreen(),
      );
    },
    ActivityOngoingRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.ActivityOngoingScreen(),
      );
    },
    CartRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.CartScreen(),
      );
    },
    HomeNavigationRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.HomeNavigationScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.HomeScreen(),
      );
    },
    MenuRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.MenuScreen(),
      );
    },
    OrderRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.OrderScreen(),
      );
    },
    OrderSuccessRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.OrderSuccessScreen(),
      );
    },
    ProductDetailsRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.ProductDetailsScreen(),
      );
    },
    WalletRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.WalletScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AccountScreen]
class AccountRoute extends _i13.PageRouteInfo<void> {
  const AccountRoute({List<_i13.PageRouteInfo>? children})
      : super(
          AccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccountRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i2.ActivityCompletedScreen]
class ActivityCompletedRoute extends _i13.PageRouteInfo<void> {
  const ActivityCompletedRoute({List<_i13.PageRouteInfo>? children})
      : super(
          ActivityCompletedRoute.name,
          initialChildren: children,
        );

  static const String name = 'ActivityCompletedRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i3.ActivityNavigationScreen]
class ActivityNavigationRoute extends _i13.PageRouteInfo<void> {
  const ActivityNavigationRoute({List<_i13.PageRouteInfo>? children})
      : super(
          ActivityNavigationRoute.name,
          initialChildren: children,
        );

  static const String name = 'ActivityNavigationRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i4.ActivityOngoingScreen]
class ActivityOngoingRoute extends _i13.PageRouteInfo<void> {
  const ActivityOngoingRoute({List<_i13.PageRouteInfo>? children})
      : super(
          ActivityOngoingRoute.name,
          initialChildren: children,
        );

  static const String name = 'ActivityOngoingRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i5.CartScreen]
class CartRoute extends _i13.PageRouteInfo<void> {
  const CartRoute({List<_i13.PageRouteInfo>? children})
      : super(
          CartRoute.name,
          initialChildren: children,
        );

  static const String name = 'CartRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i6.HomeNavigationScreen]
class HomeNavigationRoute extends _i13.PageRouteInfo<void> {
  const HomeNavigationRoute({List<_i13.PageRouteInfo>? children})
      : super(
          HomeNavigationRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeNavigationRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i7.HomeScreen]
class HomeRoute extends _i13.PageRouteInfo<void> {
  const HomeRoute({List<_i13.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i8.MenuScreen]
class MenuRoute extends _i13.PageRouteInfo<void> {
  const MenuRoute({List<_i13.PageRouteInfo>? children})
      : super(
          MenuRoute.name,
          initialChildren: children,
        );

  static const String name = 'MenuRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i9.OrderScreen]
class OrderRoute extends _i13.PageRouteInfo<void> {
  const OrderRoute({List<_i13.PageRouteInfo>? children})
      : super(
          OrderRoute.name,
          initialChildren: children,
        );

  static const String name = 'OrderRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i10.OrderSuccessScreen]
class OrderSuccessRoute extends _i13.PageRouteInfo<void> {
  const OrderSuccessRoute({List<_i13.PageRouteInfo>? children})
      : super(
          OrderSuccessRoute.name,
          initialChildren: children,
        );

  static const String name = 'OrderSuccessRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i11.ProductDetailsScreen]
class ProductDetailsRoute extends _i13.PageRouteInfo<void> {
  const ProductDetailsRoute({List<_i13.PageRouteInfo>? children})
      : super(
          ProductDetailsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProductDetailsRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i12.WalletScreen]
class WalletRoute extends _i13.PageRouteInfo<void> {
  const WalletRoute({List<_i13.PageRouteInfo>? children})
      : super(
          WalletRoute.name,
          initialChildren: children,
        );

  static const String name = 'WalletRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}
