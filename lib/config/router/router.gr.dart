// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i16;
import 'package:pocofino/views/screens/account/account_screen.dart' as _i1;
import 'package:pocofino/views/screens/activity/activity_navigation_screen.dart'
    as _i3;
import 'package:pocofino/views/screens/activity/completed_screen.dart' as _i2;
import 'package:pocofino/views/screens/activity/ongoing_screen.dart' as _i4;
import 'package:pocofino/views/screens/auth/create_account_screen.dart' as _i6;
import 'package:pocofino/views/screens/auth/login_screen.dart' as _i9;
import 'package:pocofino/views/screens/auth/onboarding_screen.dart' as _i11;
import 'package:pocofino/views/screens/cart/cart_screen.dart' as _i5;
import 'package:pocofino/views/screens/cart/order_screen.dart' as _i12;
import 'package:pocofino/views/screens/cart/order_success_screen.dart' as _i13;
import 'package:pocofino/views/screens/home/home_screen.dart' as _i8;
import 'package:pocofino/views/screens/home/menu_screen.dart' as _i10;
import 'package:pocofino/views/screens/home/product_details_screen.dart'
    as _i14;
import 'package:pocofino/views/screens/home_navigation_screen.dart' as _i7;
import 'package:pocofino/views/screens/wallet/wallet_screen.dart' as _i15;

abstract class $AppRouter extends _i16.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i16.PageFactory> pagesMap = {
    AccountRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AccountScreen(),
      );
    },
    ActivityCompletedRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.ActivityCompletedScreen(),
      );
    },
    ActivityNavigationRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.ActivityNavigationScreen(),
      );
    },
    ActivityOngoingRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.ActivityOngoingScreen(),
      );
    },
    CartRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.CartScreen(),
      );
    },
    CreateAccountRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.CreateAccountScreen(),
      );
    },
    HomeNavigationRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.HomeNavigationScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.HomeScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.LoginScreen(),
      );
    },
    MenuRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.MenuScreen(),
      );
    },
    OnboardingRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.OnboardingScreen(),
      );
    },
    OrderRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.OrderScreen(),
      );
    },
    OrderSuccessRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.OrderSuccessScreen(),
      );
    },
    ProductDetailsRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.ProductDetailsScreen(),
      );
    },
    WalletRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.WalletScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AccountScreen]
class AccountRoute extends _i16.PageRouteInfo<void> {
  const AccountRoute({List<_i16.PageRouteInfo>? children})
      : super(
          AccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccountRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i2.ActivityCompletedScreen]
class ActivityCompletedRoute extends _i16.PageRouteInfo<void> {
  const ActivityCompletedRoute({List<_i16.PageRouteInfo>? children})
      : super(
          ActivityCompletedRoute.name,
          initialChildren: children,
        );

  static const String name = 'ActivityCompletedRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i3.ActivityNavigationScreen]
class ActivityNavigationRoute extends _i16.PageRouteInfo<void> {
  const ActivityNavigationRoute({List<_i16.PageRouteInfo>? children})
      : super(
          ActivityNavigationRoute.name,
          initialChildren: children,
        );

  static const String name = 'ActivityNavigationRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i4.ActivityOngoingScreen]
class ActivityOngoingRoute extends _i16.PageRouteInfo<void> {
  const ActivityOngoingRoute({List<_i16.PageRouteInfo>? children})
      : super(
          ActivityOngoingRoute.name,
          initialChildren: children,
        );

  static const String name = 'ActivityOngoingRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i5.CartScreen]
class CartRoute extends _i16.PageRouteInfo<void> {
  const CartRoute({List<_i16.PageRouteInfo>? children})
      : super(
          CartRoute.name,
          initialChildren: children,
        );

  static const String name = 'CartRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i6.CreateAccountScreen]
class CreateAccountRoute extends _i16.PageRouteInfo<void> {
  const CreateAccountRoute({List<_i16.PageRouteInfo>? children})
      : super(
          CreateAccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateAccountRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i7.HomeNavigationScreen]
class HomeNavigationRoute extends _i16.PageRouteInfo<void> {
  const HomeNavigationRoute({List<_i16.PageRouteInfo>? children})
      : super(
          HomeNavigationRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeNavigationRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i8.HomeScreen]
class HomeRoute extends _i16.PageRouteInfo<void> {
  const HomeRoute({List<_i16.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i9.LoginScreen]
class LoginRoute extends _i16.PageRouteInfo<void> {
  const LoginRoute({List<_i16.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i10.MenuScreen]
class MenuRoute extends _i16.PageRouteInfo<void> {
  const MenuRoute({List<_i16.PageRouteInfo>? children})
      : super(
          MenuRoute.name,
          initialChildren: children,
        );

  static const String name = 'MenuRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i11.OnboardingScreen]
class OnboardingRoute extends _i16.PageRouteInfo<void> {
  const OnboardingRoute({List<_i16.PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i12.OrderScreen]
class OrderRoute extends _i16.PageRouteInfo<void> {
  const OrderRoute({List<_i16.PageRouteInfo>? children})
      : super(
          OrderRoute.name,
          initialChildren: children,
        );

  static const String name = 'OrderRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i13.OrderSuccessScreen]
class OrderSuccessRoute extends _i16.PageRouteInfo<void> {
  const OrderSuccessRoute({List<_i16.PageRouteInfo>? children})
      : super(
          OrderSuccessRoute.name,
          initialChildren: children,
        );

  static const String name = 'OrderSuccessRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i14.ProductDetailsScreen]
class ProductDetailsRoute extends _i16.PageRouteInfo<void> {
  const ProductDetailsRoute({List<_i16.PageRouteInfo>? children})
      : super(
          ProductDetailsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProductDetailsRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i15.WalletScreen]
class WalletRoute extends _i16.PageRouteInfo<void> {
  const WalletRoute({List<_i16.PageRouteInfo>? children})
      : super(
          WalletRoute.name,
          initialChildren: children,
        );

  static const String name = 'WalletRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}
