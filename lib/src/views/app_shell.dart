import 'package:collapsible_sidebar/collapsible_sidebar.dart';
import 'package:flutter/material.dart';

class AppShell extends StatelessWidget {
  final Widget child;

  AppShell({
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
        icon: Icons.icecream,
        onPressed: () => {},
      ),
      CollapsibleItem(
        text: 'Search',
        icon: Icons.search,
        onPressed: () => {},
      ),
    ];
    return Row(
      children: [
        CollapsibleSidebar(
          isCollapsed: MediaQuery.of(context).size.width <= 800,
          items: items,
          title: 'John Smith',
          screenPadding: 20,
          body: Container(),
        ),
        Expanded(
          child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: child,
          ),
        )
      ],
    );
  }
}
