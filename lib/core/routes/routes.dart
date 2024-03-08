import 'package:cat_api/models/cats_model.dart';
import 'package:cat_api/presentation/home/detail/detail_page.dart';
import 'package:cat_api/presentation/home/home_page.dart';
import 'package:cat_api/presentation/splash/splash_page.dart';
import 'package:go_router/go_router.dart';

class CatRoutesNames {
  static final RouteData splashPage = RouteData(name: '/', path: '/');
  static final RouteData homePage =
      RouteData(name: 'home_page', path: 'home_page');
  static final RouteData detailPage =
      RouteData(name: 'detail_page', path: 'detail_page');
}

class RouteData {
  ///Data of the route
  RouteData({required this.name, required this.path});

  final String name;
  final String path;
}

class CatRouter {
  static GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
          path: "/",
          name: "/",
          builder: (context, state) => SplashPage(
                key: state.pageKey,
              ),
          routes: [
            GoRoute(
                path: "home_page",
                name: "home_page",
                builder: (context, state) => HomePage(
                      key: state.pageKey,
                    ),
                routes: [
                  GoRoute(
                    path: "detail_page",
                    name: "detail_page",
                    builder: (context, state) {
                      final cat = state.extra as CatsModel;
                      return DetailPage(
                        cat: cat,
                        key: state.pageKey,
                      );
                    },
                  ),
                ]),
          ]),
    ],
  );
}
