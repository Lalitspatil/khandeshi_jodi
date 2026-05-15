
import 'package:flutter/material.dart';
import 'package:khandeshi_jodi/navigation/bottom_nav.dart';
import 'package:khandeshi_jodi/navigation/navigation_controller.dart';
import 'package:khandeshi_jodi/resources/sizes.dart';
import 'package:khandeshi_jodi/widgets/app_bar.dart';
import 'package:provider/provider.dart';


class BaseScaffold extends StatelessWidget {
  final Widget? appBar;
  final String? appTitle;
  final bool? isBackButton;
  final Widget body;
  final bool? showDrawer;
  final int? currentIndex;
  const BaseScaffold({super.key, this.appBar, this.appTitle, this.isBackButton, this.showDrawer = true, required this.body, this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationController>(builder: (_, viewModel, child) => Scaffold(
      appBar: (appBar == null && appTitle == null) ? null : PreferredSize(preferredSize: Size.fromHeight(Sizes.s50),
          child: appBar ?? CommanAppBar(text: appTitle,isBackButon: true)),
     // drawer: showDrawer == true ? const MenuDrawer() : null,
      body: body,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNav(viewModel: viewModel, currentIndex: currentIndex),
    ));
  }
}