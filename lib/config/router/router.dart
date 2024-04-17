import 'package:auto_route/auto_route.dart';
import 'package:pocofino/config/router/router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: OnboardingRoute.page,
        ),
        AutoRoute(page: CreateAccountRoute.page),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(
          page: HomeNavigationRoute.page,
          initial: true,
          children: [
            AutoRoute(page: HomeRoute.page),
            AutoRoute(page: ActivityNavigationRoute.page, children: [
              AutoRoute(page: ActivityOngoingRoute.page),
              AutoRoute(page: ActivityCompletedRoute.page),
            ]),
            AutoRoute(page: WalletRoute.page),
            AutoRoute(page: CartRoute.page),
            AutoRoute(page: AccountRoute.page),
          ],
        ),
        AutoRoute(page: MenuRoute.page),
        AutoRoute(page: ProductDetailsRoute.page),
        AutoRoute(page: OrderRoute.page),
        AutoRoute(page: OrderSuccessRoute.page),
      ];
}
