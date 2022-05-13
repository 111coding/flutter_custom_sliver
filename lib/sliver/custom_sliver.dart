import 'dart:math';

import 'package:flutter/material.dart';

typedef CustomSliverWidgetBuilder = Widget Function(BuildContext context, double offset, double statusBarHeight);

/// 스크롤 포지션에 따라 슬리버 앱바 그려줄 윗젯
/// 메인 화면에서 해당 슬리버에 들어갈 컴포넌트 구현해서 사용
class CustomSliver extends StatelessWidget {
  const CustomSliver({
    Key? key,
    required this.builder,
    required this.expandedHeight,
    required this.toolbarHeight,
  }) : super(key: key);

  /// offset (0.0 ~ 1.0) 에 따라 리턴할 위젯
  final CustomSliverWidgetBuilder builder;

  /// 최대 크기
  final double expandedHeight;

  /// 툴바 크기(최소크기)
  final double toolbarHeight;

  @override
  Widget build(BuildContext context) {
    final topPaddingHeight = MediaQuery.of(context).padding.top;

    return SliverPersistentHeader(
      pinned: true,
      delegate: _CustomSliverBuilderDelegate(
        builder: builder,
        expandedHeight: expandedHeight - topPaddingHeight,
        toolbarHeight: toolbarHeight,
        topPaddingHeight: topPaddingHeight,
      ),
    );
  }
}

class _CustomSliverBuilderDelegate extends SliverPersistentHeaderDelegate {
  _CustomSliverBuilderDelegate({
    required this.builder,
    required this.topPaddingHeight,
    required this.expandedHeight,
    required this.toolbarHeight,
  });

  /// offset (0.0 ~ 1.0) 에 따라 리턴할 위젯
  final CustomSliverWidgetBuilder builder;

  /// 최대 크기
  final double expandedHeight;

  /// 툴바 크기(최소크기)
  final double toolbarHeight;

  /// StatusBar
  final double topPaddingHeight;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    final bodyHeight = expandedHeight - toolbarHeight;
    // toolBarHeight 만큼 offset이 더 증가 해서 min으로 처리!
    final double offset = 1 - min(1, shrinkOffset / bodyHeight);
    return builder(context, offset, topPaddingHeight);
  }

  @override
  double get maxExtent => expandedHeight + topPaddingHeight;

  @override
  double get minExtent => toolbarHeight + topPaddingHeight;

  @override
  bool shouldRebuild(_CustomSliverBuilderDelegate oldDelegate) => true;
}
