import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

typedef SliverHeaderBuilder = Widget Function(
    BuildContext context, double shrinkOffset, bool overlapsContent);

class SliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  // child 为 header
  SliverHeaderDelegate({
    required this.maxHeight,
    this.minHeight = 0,
    required Widget child,
  })  : builder = ((a, b, c) => child),
        assert(minHeight <= maxHeight && minHeight >= 0);

  //最大和最小高度相同
  SliverHeaderDelegate.fixedHeight({
    required double height,
    required Widget child,
  })  : builder = ((a, b, c) => child),
        maxHeight = height,
        minHeight = height;

  //需要自定义builder时使用
  SliverHeaderDelegate.builder({
    required this.maxHeight,
    this.minHeight = 0,
    required this.builder,
  });

  final double maxHeight;
  final double minHeight;
  final SliverHeaderBuilder builder;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    Widget child = builder(context, shrinkOffset, overlapsContent);
    //测试代码：如果在调试模式，且子组件设置了key，则打印日志
    assert(() {
      if (child.key != null) {
        if (kDebugMode) {
          print(
              '${child.key}: shrink: $shrinkOffset，overlaps:$overlapsContent');
        }
      }
      return true;
    }());
    // 让 header 尽可能充满限制的空间；宽度为 Viewport 宽度，
    // 高度随着用户滑动在[minHeight,maxHeight]之间变化。
    return SizedBox.expand(child: child);
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(SliverHeaderDelegate oldDelegate) {
    return oldDelegate.maxExtent != maxExtent ||
        oldDelegate.minExtent != minExtent;
  }
}

// Scaffold(
//       body: NestedScrollView(
//         physics: AlwaysScrollableScrollPhysics(),
//         headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
//           return [
//             SliverPersistentHeader(
//               pinned: true, //是否固定在顶部
//               floating: false,
//               delegate: SliverHeaderDelegate(
//                   minHeight: 50, //收起的高度
//                   maxHeight: 50, //展开的最大高度
//                   // offset: Offset(0, 50),
//                   child: Container(
//                     padding: EdgeInsets.only(left: 16),
//                     color: Colors.pink,
//                     alignment: Alignment.centerLeft,
//                     child: Text("浮动1", style: TextStyle(fontSize: 18)),
//                   )),
//             ),
//           ];
//         },
//         body: CustomScrollView(
//           slivers: <Widget>[
//             SliverList(
//               delegate: SliverChildBuilderDelegate(
//                 (context, index) {
//                   return Container(
//                     height: 50,
//                     color: index % 2 == 0 ? Colors.white : Colors.black12,
//                     width: double.infinity,
//                     alignment: Alignment.center,
//                     child: Text("我是第${index}个item"),
//                   );
//                 },
//                 childCount: 300,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );