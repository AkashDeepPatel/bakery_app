import 'package:bakery_app/common/utils/arch_utils/ui/responsize_builder.dart';
import 'package:flutter/material.dart';

import '../styles/app_themes.dart';
import '../utils/arch_utils/utils/size_config.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/app_text_button.dart';

class CommonBaseClass extends StatelessWidget {
  CommonBaseClass(
      {Key? key,
      this.child,
      this.pageTitle = "",
      this.showAppBar,
      this.bottomWidget,
      this.showBottomWidget = false,
      this.showBackIcon,
      this.showSearchBar,
      this.isOrdersScreen,
      this.isProfileScreen,
      this.showlocation,
      this.bottomWidgetHPadding = 16.0,
      this.bottomWidgetBottomPadding = 48.0,
      this.bottomWidgetTopPadding = 0.0

      // this.padding = 16.0
      })
      : super(key: key);
  final Widget? child;
  final Widget? bottomWidget;
  // double padding;
  double _usableHeight = 0;
  String pageTitle;
  bool? showAppBar = false;
  bool showBottomWidget = false;
  bool? showBackIcon;
  bool? showSearchBar;
  bool? isOrdersScreen;
  bool? isProfileScreen;
  bool? showlocation;
  double bottomWidgetHPadding;
  double bottomWidgetBottomPadding;
  double bottomWidgetTopPadding;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      extendBodyBehindAppBar: false,
      backgroundColor: AppThemes.white,
      appBar: showAppBar == true
          ? AppBarWidget(
              showSearchBar: showSearchBar,
              showBackIcon: showBackIcon,
              showlocation: showlocation,
              pageTitle: pageTitle,
              isOrdersScreen: isOrdersScreen,
              isProfileScreen: isProfileScreen,
            )
          : null,
      body: ResponsiveBuilder(
        builder: (context, sizingInformation) {
          if (_usableHeight < sizingInformation.localWidgetSize.height) {
            _usableHeight = sizingInformation.localWidgetSize.height;
          }
          return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: SizedBox(
                  height: _usableHeight,
                  child: Column(children: [
                    Expanded(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Positioned.fill(
                            child: child ?? getWidget(),
                          ),
                        ],
                      ),
                    )
                  ])));
        },
      ),
      bottomNavigationBar: showBottomWidget
          ? Padding(
              padding: EdgeInsets.fromLTRB(
                  bottomWidgetHPadding,
                  bottomWidgetTopPadding,
                  bottomWidgetHPadding,
                  bottomWidgetBottomPadding),
              child: bottomWidget,
            )
          : null,
    );
  }

  Widget getWidget() {
    return const Text("Override getWidget to add elements");
  }
}
