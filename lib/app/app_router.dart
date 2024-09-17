import 'dart:async';

import 'package:auth_repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pocofino/features/account/view/account_page.dart';
import 'package:pocofino/features/account/view/app_settings_page.dart';
import 'package:pocofino/features/account/view/edit_account_page.dart';
import 'package:pocofino/features/account/view/help_center_page.dart';
import 'package:pocofino/features/activity/view/activity_page.dart';
import 'package:pocofino/features/admin/features/home/admin_home_page.dart';
import 'package:pocofino/features/auth/view/login_page.dart';
import 'package:pocofino/features/auth/view/sign_up_page.dart';
import 'package:pocofino/features/cart/view/cart_page.dart';
import 'package:pocofino/features/category/view/category_page.dart';
import 'package:pocofino/features/menu/view/menu_page.dart';
import 'package:pocofino/features/order/view/contact_page.dart';
import 'package:pocofino/features/order/view/location_page.dart';
import 'package:pocofino/features/order/view/order_page.dart';
import 'package:pocofino/features/order/view/pick_up_time_page.dart';
import 'package:pocofino/features/product/view/product_page.dart';
import 'package:pocofino/features/wallet/view/payment_page.dart';
import 'package:pocofino/features/wallet/view/top_up_page.dart';
import 'package:pocofino/features/wallet/view/wallet_page.dart';
import 'package:pocofino/layout/home_page.dart';
import 'package:product_repository/product_repository.dart';

class AppRouter {
  final AuthRepository authRepository;
  AppRouter({required this.authRepository});
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  late final GoRouter config = GoRouter(
    navigatorKey: navigatorKey,
    routes: [
      GoRoute(
        path: "/login",
        name: LoginPage.route,
        builder: (context, state) => const LoginPage(),
        routes: [
          GoRoute(
            path: "create",
            name: SignUpPage.route,
            builder: (context, state) => SignUpPage(
              authBloc: (state.extra as Map)["authBloc"],
            ),
          ),
        ],
      ),
      GoRoute(
        path: "/",
        name: HomePage.route,
        builder: (context, state) => const HomePage(),
        routes: [
          GoRoute(
            path: "menu",
            name: MenuPage.route,
            builder: (context, state) => const MenuPage(),
            routes: [
              GoRoute(
                path: "category",
                name: CategoryPage.route,
                builder: (context, state) => CategoryPage(
                  category: (state.extra as Map)["category"]! as Category,
                  menuBloc: (state.extra as Map)["menuBloc"],
                  cartBloc: (state.extra as Map)["cartBloc"],
                ),
              )
            ],
          ),
          GoRoute(
            path: "product/:product_id",
            name: ProductPage.route,
            builder: (context, state) => ProductPage(
              product: (state.extra as Map)["product"]!,
              cartBloc: (state.extra as Map)["cartBloc"],
              isEdit: (state.extra as Map)["isEdit"],
            ),
          ),
          GoRoute(
            path: "activity",
            name: ActivityPage.route,
            builder: (context, state) => const ActivityPage(),
          ),
          GoRoute(
            path: "wallet",
            name: WalletPage.route,
            builder: (context, state) => const WalletPage(),
            routes: [
              GoRoute(
                path: "top_up",
                name: TopUpPage.route,
                builder: (context, state) => TopUpPage(
                  walletBloc: (state.extra as Map)["walletBloc"],
                  orderBloc: (state.extra as Map)["orderBloc"],
                  cartBloc: (state.extra as Map)["cartBloc"],
                ),
              ),
              GoRoute(
                path: "payment",
                name: PaymentPage.route,
                builder: (context, state) => PaymentPage(
                  walletBloc: (state.extra as Map)["walletBloc"],
                  amount: (state.extra as Map)["amount"],
                  paymentType: (state.extra as Map)["paymentType"],
                  orderBloc: (state.extra as Map)["orderBloc"],
                  cartBloc: (state.extra as Map)["cartBloc"],
                ),
              ),
            ],
          ),
          GoRoute(
            path: "cart",
            name: CartPage.route,
            builder: (context, state) => const CartPage(),
            routes: [
              GoRoute(
                path: "contact",
                name: ContactPage.route,
                builder: (context, state) => ContactPage(
                  orderBloc: (state.extra as Map)["orderBloc"],
                ),
              ),
              GoRoute(
                path: "location",
                name: LocationPage.route,
                builder: (context, state) => LocationPage(
                  orderBloc: (state.extra as Map)["orderBloc"],
                ),
              ),
              GoRoute(
                path: "pick_up_time",
                name: PickUpTimePage.route,
                builder: (context, state) => const PickUpTimePage(),
              ),
            ],
          ),
          GoRoute(
            path: "order",
            name: OrderPage.route,
            builder: (context, state) => OrderPage(
              products: (state.extra as Map)["products"]!,
              orderBloc: (state.extra as Map)["orderBloc"],
              cartBloc: (state.extra as Map)["cartBloc"],
              walletBloc: (state.extra as Map)["walletBloc"],
              timerBloc: (state.extra as Map)["timerBloc"],
            ),
          ),
          GoRoute(
            path: "account",
            name: AccountPage.route,
            builder: (context, state) => const AccountPage(),
            routes: [
              GoRoute(
                path: "edit",
                name: EditAccountPage.route,
                builder: (context, state) => const EditAccountPage(),
              ),
              GoRoute(
                path: "app_settings",
                name: AppSettingsPage.route,
                builder: (context, state) => const AppSettingsPage(),
              ),
              GoRoute(
                path: "help_center",
                name: HelpCenterPage.route,
                builder: (context, state) => const HelpCenterPage(),
              ),
            ],
          ),

          /// [Admin]
          GoRoute(
            path: "admin",
            name: AdminHomePage.route,
            builder: (context, state) => const AdminHomePage(),
          ),
        ],
      ),
    ],
    // redirect: (context, state) async {
    //   print("Current location: ${state.path}");
    //   final currentUser = await authRepository.currentUserStream.first;
    //   final isLoggedIn = currentUser != null;
    //   final loggingIn = state.matchedLocation.startsWith('/login');

    //   final isAdmin = currentUser?.email == "admin@gmail.com";

    //   // If the user is not logged in, they must login

    //   // if (isLoggedIn) {
    //   //   // if the user is admin
    //   //   if (kIsWeb && isAdmin) {
    //   //     return "/admin";
    //   //   }
    //   // } else if (!isLoggedIn) {
    //   //   // if the user is not logged in, they must login
    //   //   return "/login";
    //   // }

    //   // // If the user is logged in but still on AuthView, send them to
    //   // // the home
    //   // if (loggingIn) {
    //   //   if (isAdmin) {
    //   //     return "/admin";
    //   //   }
    //   //   return "/";
    //   // }

    //   // No need to redirect at all
    //   return null;
    // },
    // refreshListenable: _GoRouterRefreshStream(
    //   authRepository.currentUserStream,
    // ),
  );
}

class _GoRouterRefreshStream extends ChangeNotifier {
  _GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
          (_) => notifyListeners(),
        );
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
