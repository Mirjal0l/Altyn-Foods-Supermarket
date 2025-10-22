import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:homework1/features/auth/registration.dart';
import 'package:homework1/features/auth/signin.dart';
import 'package:homework1/features/basket/basket.dart';
import 'package:homework1/features/favorites/favorites.dart';
import 'package:homework1/features/home/catalogue.dart';
import 'package:homework1/features/main/pages/main_page.dart';
import 'package:homework1/features/onboarding/presentation/pages/welcome_page.dart';
import 'package:homework1/features/orders/orders.dart';
import 'package:homework1/features/profile/account_changing.dart';
import 'package:homework1/features/profile/details/about_us.dart';
import 'package:homework1/features/profile/details/contact_us.dart';
import 'package:homework1/features/profile/details/delivery.dart';
import 'package:homework1/features/profile/details/faq.dart';
import 'package:homework1/features/profile/details/language.dart';
import 'package:homework1/features/profile/details/my_addresses.dart';
import 'package:homework1/features/profile/details/news.dart';
import 'package:homework1/features/profile/details/privacy_policy.dart';
import 'package:homework1/features/profile/details/public_offer.dart';
import 'package:homework1/features/profile/profile.dart';
import 'package:homework1/features/splash/mixins/splash_page.dart';
import 'package:homework1/router/name_routes.dart';

import '../features/basket/confirmed.dart';
import '../features/basket/payment.dart';
import '../features/home/message.dart';

final GoRouter router = GoRouter(
  initialLocation: Routes.initial,

  routes: <RouteBase>[
    GoRoute(
      path: '/',
      name: Routes.initial,
      builder: (_, __) => const SplashPage(),
    ),
    GoRoute(
      path: Routes.welcome,
      name: Routes.welcome,
      builder: (_, __) => const WelcomePage(),
    ),

    GoRoute(
      path: Routes.registration,
      name: Routes.registration,
      builder: (_, __) => const Registration(),
    ),

    GoRoute(
      path: Routes.signin,
      name: Routes.signin,
      builder: (_, __) => const Sign_In(),
    ),

    GoRoute(
      path: '${Routes.signin}/catalogue',
      name: '${Routes.signin}_catalogue',
      builder: (_, __) => const Catalogue(isActive: true),
    ),

    StatefulShellRoute.indexedStack(
      builder:
          (
            BuildContext context,
            GoRouterState state,
            StatefulNavigationShell navigationShell,
          ) => MainPage(navigationShell: navigationShell),
      branches: <StatefulShellBranch>[
        // branch 1: HomePage
        StatefulShellBranch(
          initialLocation: Routes.catalogue,
          routes: <RouteBase>[
            GoRoute(
              path: Routes.catalogue,
              name: Routes.catalogue,
              builder: (_, __) => const Catalogue(),
            ),

            GoRoute(
                path: Routes.message,
              name: Routes.message,
              builder: (_, __) => const Message(),
            )
          ],
        ),

        // branch 2: Orders
        StatefulShellBranch(
          initialLocation: Routes.orders,
          routes: <RouteBase>[
            GoRoute(
              path: Routes.orders,
              name: Routes.orders,
              builder: (_, __) => const Orders(),
            ),
          ],
        ),

        StatefulShellBranch(
          initialLocation: Routes.basket,
          routes: <RouteBase>[
            GoRoute(
              path: Routes.basket,
              name: Routes.basket,
              builder: (_, __) => const Basket(),
            ),

            GoRoute(
              path: Routes.payment,
              name: Routes.payment,
              builder: (_, __) => const Payment(),
            ),

            GoRoute(
              path: Routes.confirmed,
              name: Routes.confirmed,
              builder: (_, __) => const Confirmed(),
            ),
          ],
        ),

        StatefulShellBranch(
          initialLocation: Routes.favorites,
          routes: <RouteBase>[
            GoRoute(
              path: Routes.favorites,
              name: Routes.favorites,
              builder: (_, __) => const Favorites(),
            ),

            GoRoute(
              path: '${Routes.favorites}/catalogue', // Unique path
              name: '${Routes.favorites}_catalogue', // Unique name
              builder: (_, __) => const Catalogue(isActive: true),
            ),
          ],
        ),

        StatefulShellBranch(
          initialLocation: Routes.profile,
          routes: <RouteBase>[
            GoRoute(
              path: Routes.profile,
              name: Routes.profile,
              builder: (_, __) => const Profile(),
            ),

            GoRoute(
              path: Routes.account_changing,
              name: Routes.account_changing,
              builder: (_, __) => const AccountChanging(),
            ),

            GoRoute(
              path: Routes.my_address,
              name: Routes.my_address,
              builder: (_, __) => const MyAddresses(),
            ),

            GoRoute(
              path: Routes.language,
              name: Routes.language,
              builder: (_, __) => const Language(),
            ),

            GoRoute(
              path: Routes.contact_us,
              name: Routes.contact_us,
              builder: (_, __) => const ContactUs(),
            ),

            GoRoute(
              path: Routes.public_offer,
              name: Routes.public_offer,
              builder: (_, __) => const PublicOffer(),
            ),

            GoRoute(
              path: Routes.privacy_policy,
              name: Routes.privacy_policy,
              builder: (_, __) => const PrivacyPolicy(),
            ),

            GoRoute(
              path: Routes.news,
              name: Routes.news,
              builder: (_, __) => const News(),
            ),

            GoRoute(
              path: Routes.delivery,
              name: Routes.delivery,
              builder: (_, __) => const Delivery(),
            ),

            GoRoute(
              path: Routes.about_us,
              name: Routes.about_us,
              builder: (_, __) => const AboutUs(),
            ),

            GoRoute(
              path: Routes.faq,
              name: Routes.faq,
              builder: (_, __) => const Faq(),
            ),
          ],
        ),
      ],
    ),
  ],
);
