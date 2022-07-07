import 'package:flutter/material.dart';

import 'onboard_model.dart';

class TabIndicator extends StatefulWidget {
  final int selectedIndex;
  const TabIndicator({Key? key, required this.selectedIndex}) : super(key: key);

  @override
  State<TabIndicator> createState() => _TabIndicatorState();
}

class _TabIndicatorState extends State<TabIndicator>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void didUpdateWidget(covariant TabIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedIndex != widget.selectedIndex) {
      _tabController.animateTo(widget.selectedIndex);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController =
        TabController(length: OnBoardModes.onBoardItems.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return TabPageSelector(
      controller: _tabController,
    );
  }
}
