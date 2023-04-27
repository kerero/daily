import 'package:daily/src/sample_feature/sample_item_details_view.dart';
import 'package:daily/src/settings/settings_view.dart';
import 'package:daily/src/utils.dart';
import 'package:daily/src/views/app_shell_mobile.dart';
import './views/app_shell_desktop.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(routes: <RouteBase>[
  ShellRoute(
    builder: (BuildContext context, GoRouterState state, Widget child) {
      return !isDesktop()
          ? AppShellDesktop(child: child)
          : AppShellMobile(child: child);
    },
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => Center(
          child: Column(
            children: const [
              Text('Some Text'),
              Text('Some Text2'),
            ],
          ),
        ), //const SampleItemListView(),
      ),
      GoRoute(
        path: '/settings',
        builder: (context, state) => const SettingsView(),
      ),
      GoRoute(
        path: '/sample_item',
        builder: (context, state) => const SampleItemDetailsView(),
      ),
    ],
  )
]);
