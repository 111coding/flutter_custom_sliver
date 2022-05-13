import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_custom_sliver/sliver/custom_sliver.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({
    Key? key,
    required this.appBar,
    required this.appBarBackgroundColor,
    required this.expandedSpace,
    required this.openedSystemUiOverlayStyle,
    required this.closedSystemUiOverlayStyle,
    this.toolbarHeight = 56,
    this.expandedHeight = 300,
  }) : super(key: key);

  /// Don't set background color for app bar
  /// 앱바에 배경색을 설정하지 마세요
  final Widget appBar;

  /// The background color of the app bar
  /// 앱바의 배경색
  final Color appBarBackgroundColor;

  /// This is the widget that will fill the CustomSliverAppBar
  /// CustomSliverAppBar를 가득 채울 위젯입니다
  final Widget expandedSpace;

  /// This is the text color of the system status bar when the app bar is open.
  /// 앱바가 열렸을 때의 시스템 상태바의 글자색 입니다
  final SystemUiOverlayStyle openedSystemUiOverlayStyle;

  /// This is the text color of the system status bar when the app bar is close.
  /// 앱바가 닫혔을 때의 시스템 상태바의 글자색 입니다
  final SystemUiOverlayStyle closedSystemUiOverlayStyle;

  /// toolbarHeight
  final double toolbarHeight;

  /// CustomSliverAppBar height
  final double expandedHeight;

  @override
  Widget build(BuildContext context) {
    return CustomSliver(
      toolbarHeight: toolbarHeight,
      expandedHeight: expandedHeight,
      builder: (context, offset, statusBarHeight) {
        // System status bar text color change!
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: offset > 0.5 ? openedSystemUiOverlayStyle : closedSystemUiOverlayStyle,
          child: Stack(
            children: [
              _expnadedSpace(),
              _appBar(statusBarHeight, offset),
            ],
          ),
        );
      },
    );
  }

  Widget _expnadedSpace() {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      reverse: true,
      child: SizedBox(
        width: double.infinity,
        height: expandedHeight,
        child: expandedSpace,
      ),
    );
  }

  Widget _appBar(double statusBarHeight, double offset) {
    return Container(
      width: double.infinity,
      height: toolbarHeight + statusBarHeight,
      color: appBarBackgroundColor.withOpacity(1 - offset),
      padding: EdgeInsets.only(top: statusBarHeight),
      child: appBar,
    );
  }
}
