import 'package:daily/src/sample_feature/sample_item_details_view.dart';
import 'package:daily/src/sample_feature/sample_item_list_view.dart';
import 'package:daily/src/settings/settings_view.dart';
import 'package:daily/src/views/app_shell.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(routes: <RouteBase>[
  ShellRoute(
    builder: (BuildContext context, GoRouterState state, Widget child) {
      return AppShell(
        child: child,
      );
    },
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => Center(
          child: Column(
            children: [
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
