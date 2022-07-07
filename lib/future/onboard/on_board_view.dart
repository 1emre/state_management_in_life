import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:state_management_in_life/future/onboard/onboard_model.dart';
import 'package:state_management_in_life/future/onboard/tab_indicator.dart';
import 'package:state_management_in_life/product/padding/page_padding.dart';

import '../../product/widget/onboard_card.dart';

part './module/start_fab_button.dart';

class OnBoardView extends StatefulWidget {
  const OnBoardView({Key? key}) : super(key: key);

  @override
  State<OnBoardView> createState() => _OnBoardViewState();
}

class _OnBoardViewState extends State<OnBoardView> {
  final String _skipTitle = 'Skip';

  int _selectedIndex = 0;
  bool get _isLastPage =>
      OnBoardModes.onBoardItems.length - 1 == _selectedIndex;
  bool get _isFirstPage => _selectedIndex == 0;

  // ----xx
  ValueNotifier<bool> isBackEnable = ValueNotifier(false);
  // ----xx

  void _incrementAndChange([int? value]) {
    if (_isLastPage && value == null) {
      _changeBackEnable(true);
      return;
    }
    _changeBackEnable(false);
    _incrementSelectedPage(value);
  }

  void _changeBackEnable(bool value) {
    if (value == isBackEnable.value) {
      return;
    }

    isBackEnable.value = value;
    setState(() {});
  }

  void _incrementSelectedPage([int? value]) {
    setState(() {
      if (value != null) {
        _selectedIndex = value;
      } else {
        _selectedIndex++;
        inspect(_selectedIndex);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Padding(
        padding: const PagePadding.all(),
        child: Column(
          children: [
            Expanded(
              child: _pageViewItems(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TabIndicator(selectedIndex: _selectedIndex),
                _StartFabButton(
                    isLastPage: _isLastPage,
                    onPressed: () {
                      _incrementAndChange();
                    }),
              ],
            )
          ],
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      leading: _isFirstPage
          ? null
          : IconButton(
              onPressed: () {},
              icon:
                  const Icon(Icons.chevron_left_outlined, color: Colors.grey)),
      actions: [
        ValueListenableBuilder<bool>(
            valueListenable: isBackEnable,
            builder: (BuildContext context, bool value, Widget? child) {
              return value
                  ? const SizedBox()
                  : TextButton(onPressed: () {}, child: Text(_skipTitle));
            }),
      ],
    );
  }

  Widget _pageViewItems() {
    return PageView.builder(
      onPageChanged: (value) {
        _incrementAndChange(value);
      },
      itemCount: OnBoardModes.onBoardItems.length,
      itemBuilder: (context, index) {
        index = _selectedIndex;
        return OnBoardCard(model: OnBoardModes.onBoardItems[index]);
      },
    );
  }
}
