import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../ui/controllers/home_controller.dart';
import '../ui/home_page.dart';
import 'routes.dart';

GoRouter router() => GoRouter(
      initialLocation: Routes.home,
      redirect: _redirect,
      routes: [
        GoRoute(
          path: Routes.home,
          builder: (context, state) => HomePage(
            controller: Provider.of<HomeController>(context),
          ),
        ),
      ],
    );

Future<String?> _redirect(BuildContext context, GoRouterState state) async {
  return Routes.home;
}
