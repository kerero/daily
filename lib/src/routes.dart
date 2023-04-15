import 'package:daily/src/sample_feature/sample_item_details_view.dart';
import 'package:daily/src/sample_feature/sample_item_list_view.dart';
import 'package:daily/src/settings/settings_view.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SampleItemListView(),
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
);
