import 'package:auto_route/auto_route.dart';
import 'package:pocofino/config/router/router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          initial: true,
          page: HomeNavigationRoute.page,
          children: [
            AutoRoute(page: HomeRoute.page),
            AutoRoute(page: ActivityRoute.page),
            AutoRoute(page: WalletRoute.page),
            AutoRoute(page: CartRoute.page),
            AutoRoute(page: AccountRoute.page),
          ],
        ),
        AutoRoute(page: MenuRoute.page),
        AutoRoute(page: ProductDetailsRoute.page),
      ];
}
