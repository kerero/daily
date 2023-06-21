import 'package:collapsible_sidebar/collapsible_sidebar.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class AppShellDesktop extends StatelessWidget {
  final Widget child;

  const AppShellDesktop({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = [
      CollapsibleItem(
        text: 'Dashboard',
        icon: Icons.assessment,
        onPressed: () => {},
        isSelected: true,
      ),
      CollapsibleItem(
        text: 'Ice-Cream',
        icon: Icons.ac_unit,
        onPressed: () => {},
      ),
      CollapsibleItem(
        text: 'Search',
        icon: Icons.search,
        onPressed: () => {},
      ),
    ];
    return Scaffold(
      body: Row(
        children: [
          CollapsibleSidebar(
            showTitle: false,
            backgroundColor: Theme.of(context).cardColor,
            selectedIconColor: Theme.of(context).primaryColor,
            sidebarBoxShadow: const [],
            isCollapsed:
                MediaQuery.of(context).size.width <= Constants.smallWindowWidth,
            items: items,
            screenPadding: 10,
            body: const SizedBox.shrink(),
          ),
          Expanded(
            child: child,
          )
        ],
      ),
    );
  }
}
