import 'package:collapsible_sidebar/collapsible_sidebar.dart';
import 'package:flutter/material.dart';

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
            sidebarBoxShadow: const [],
            isCollapsed: MediaQuery.of(context).size.width <= 800,
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
