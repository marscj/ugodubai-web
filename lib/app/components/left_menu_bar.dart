import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:get/get.dart';
import 'package:ugodubai/app/extensions/get_page.dart';

import 'package:ugodubai/app/routes/app_pages.dart';
import 'package:ugodubai/app/components/left_bar.dart';
import 'package:ugodubai/app/extensions/widgets.dart';

import 'package:ugodubai/utils/utils.dart';
import 'package:ugodubai/app/widgets/custom_pop_menu.dart';

class LeftMenuBar extends StatelessWidget {
  const LeftMenuBar({
    Key? key,
    required this.leftBarCondensed,
  }) : super(key: key);

  final bool leftBarCondensed;

  GetPage get backend => AppPages.routes.first.children
      .lastWhere((element) => element.name == Routes.BACKEND);

  @override
  Widget build(BuildContext context) {
    var menus = backend.children
        .whereType<GetPageMenu>()
        .where((element) => !element.hide)
        .map<Widget>((e) {
      if (e.children.isNotEmpty) {
        return MenuWidget(
          iconData: e.icon ?? Icons.abc,
          title: e.label.tr,
          isCondensed: leftBarCondensed,
          children: e.children
              .whereType<GetPageMenu>()
              .where((element) => !element.hide)
              .map<MenuItem>(
                (e1) => MenuItem(
                  title: e1.label.tr,
                  route: backend.name + e.name + e1.name,
                ),
              )
              .toList(),
        );
      } else {
        return NavigationMenuItem(
          iconData: e.icon ?? Icons.abc,
          title: e.label.tr,
          route: backend.name + e.name,
          isCondensed: leftBarCondensed,
        );
      }
    }).toList();

    return SingleChildScrollView(child: menus.col());
  }
}

class MenuWidget extends StatefulWidget {
  final IconData iconData;
  final String title;
  final bool isCondensed;
  final bool active;
  final List<MenuItem> children;

  const MenuWidget({
    super.key,
    required this.iconData,
    required this.title,
    this.isCondensed = false,
    this.active = false,
    this.children = const [],
  });

  @override
  _MenuWidgetState createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  bool isHover = false;
  bool isActive = false;

  bool popupShowing = true;
  Function? hideFn;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    var route = Utils.getCurrentUrl(context);
    isActive = widget.children.any((element) => element.route == route);

    if (hideFn != null) {
      hideFn!();
    }
    // popupShowing = false;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isCondensed) {
      return CustomPopupMenu(
        backdrop: true,
        show: popupShowing,
        hideFn: (_) => hideFn = _,
        onChange: (_) {
          // popupShowing = _;
        },
        placement: CustomPopupMenuPlacement.right,
        menu: MouseRegion(
          cursor: SystemMouseCursors.click,
          onHover: (event) {
            setState(() {
              isHover = true;
            });
          },
          onExit: (event) {
            setState(() {
              isHover = false;
            });
          },
          child: FxContainer.transparent(
            margin: FxSpacing.fromLTRB(16, 0, 16, 8),
            color: isActive || isHover
                ? LeftBarTheme.of(context).activeItemBackground
                : Colors.transparent,
            padding: FxSpacing.xy(8, 8),
            child: Center(
              child: Icon(
                widget.iconData,
                color: (isHover || isActive)
                    ? LeftBarTheme.of(context).activeItemColor
                    : LeftBarTheme.of(context).onBackground,
                size: 20,
              ),
            ),
          ),
        ),
        menuBuilder: (_) => FxContainer.bordered(
          paddingAll: 8,
          width: 190,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: widget.children,
          ),
        ),
      );
    } else {
      return MouseRegion(
        cursor: SystemMouseCursors.click,
        onHover: (event) {
          setState(() {
            isHover = true;
          });
        },
        onExit: (event) {
          setState(() {
            isHover = false;
          });
        },
        child: FxContainer.transparent(
          margin: FxSpacing.fromLTRB(16, 0, 16, 0),
          padding: FxSpacing.xy(8, 8),
          child: ListTileTheme(
            contentPadding: EdgeInsets.all(0),
            dense: false,
            horizontalTitleGap: 0.0,
            minLeadingWidth: 30,
            style: ListTileStyle.drawer,
            child: ExpansionTile(
                initiallyExpanded: isActive,
                maintainState: true,
                collapsedIconColor: isHover || isActive
                    ? LeftBarTheme.of(context).activeItemColor
                    : LeftBarTheme.of(context).onBackground,
                leading: IconTheme(
                    data: IconThemeData(
                      size: 16,
                      color: isHover || isActive
                          ? LeftBarTheme.of(context).activeItemColor
                          : LeftBarTheme.of(context).onBackground,
                    ),
                    child: Icon(
                      widget.iconData,
                    )),
                iconColor: LeftBarTheme.of(context).activeItemColor,
                childrenPadding: FxSpacing.x(10),
                title: FxText.labelLarge(
                  widget.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                  color: isHover || isActive
                      ? LeftBarTheme.of(context).activeItemColor
                      : LeftBarTheme.of(context).onBackground,
                ),
                collapsedBackgroundColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  side: BorderSide.none,
                ),
                backgroundColor: Colors.transparent,
                children: widget.children),
          ),
        ),
      );
    }
  }
}

class MenuItem extends StatefulWidget {
  final IconData? iconData;
  final String title;
  final bool isCondensed;
  final String? route;

  const MenuItem({
    Key? key,
    this.iconData,
    required this.title,
    this.isCondensed = false,
    this.route,
  }) : super(key: key);

  @override
  _MenuItemState createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    bool isActive = Utils.getCurrentUrl(context) == widget.route;

    return GestureDetector(
      onTap: () {
        if (widget.route != null) {
          Get.rootDelegate.toNamed(widget.route!, arguments: 1);
        }
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onHover: (event) {
          setState(() {
            isHover = true;
          });
        },
        onExit: (event) {
          setState(() {
            isHover = false;
          });
        },
        child: FxContainer.transparent(
          margin: FxSpacing.fromLTRB(4, 0, 8, 4),
          color: isActive || isHover
              ? LeftBarTheme.of(context).activeItemBackground
              : Colors.transparent,
          width: MediaQuery.of(context).size.width,
          padding: FxSpacing.xy(18, 7),
          child: FxText.bodySmall(
            "${widget.isCondensed ? "" : "- "}  ${widget.title}",
            overflow: TextOverflow.clip,
            maxLines: 1,
            textAlign: TextAlign.left,
            fontSize: 12.5,
            color: isActive || isHover
                ? LeftBarTheme.of(context).activeItemColor
                : LeftBarTheme.of(context).onBackground,
            fontWeight: isActive || isHover ? 600 : 500,
          ),
        ),
      ),
    );
  }
}

class NavigationMenuItem extends StatefulWidget {
  const NavigationMenuItem({
    Key? key,
    this.iconData,
    required this.title,
    required this.route,
    required this.isCondensed,
  }) : super(key: key);

  final IconData? iconData;
  final String title;
  final String route;
  final bool isCondensed;

  @override
  _NavigationItemState createState() => _NavigationItemState();
}

class _NavigationItemState extends State<NavigationMenuItem> {
  bool isHover = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isActive = Utils.getCurrentUrl(context) == widget.route;

    return InkWell(
      onTap: () {
        Get.rootDelegate.toNamed(widget.route);
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onHover: (event) {
          setState(() {
            isHover = true;
          });
        },
        onExit: (event) {
          setState(() {
            isHover = false;
          });
        },
        child: FxContainer.transparent(
          margin: FxSpacing.fromLTRB(16, 0, 16, 8),
          color: isActive || isHover
              ? LeftBarTheme.of(context).activeItemBackground
              : Colors.transparent,
          padding: FxSpacing.xy(8, 8),
          child: Row(
            // crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: widget.isCondensed
                ? MainAxisAlignment.center
                : MainAxisAlignment.start,
            children: [
              if (widget.iconData != null)
                Center(
                  child: Icon(
                    widget.iconData,
                    color: (isHover || isActive)
                        ? LeftBarTheme.of(context).activeItemColor
                        : LeftBarTheme.of(context).onBackground,
                    size: 16,
                  ),
                ),
              if (!widget.isCondensed)
                Flexible(
                  fit: FlexFit.loose,
                  child: FxSpacing.width(15),
                ),
              if (!widget.isCondensed)
                Expanded(
                  flex: 3,
                  child: FxText.labelLarge(
                    widget.title,
                    overflow: TextOverflow.clip,
                    maxLines: 1,
                    color: isActive || isHover
                        ? LeftBarTheme.of(context).activeItemColor
                        : LeftBarTheme.of(context).onBackground,
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}

class MenuLabel extends StatelessWidget {
  const MenuLabel({
    Key? key,
    this.isCondensed = false,
    required this.label,
  }) : super(key: key);

  final String label;
  final bool isCondensed;

  @override
  Widget build(BuildContext context) {
    return isCondensed
        ? FxSpacing.empty()
        : Container(
            padding: FxSpacing.xy(24, 8),
            child: FxText.labelSmall(
              label.toUpperCase(),
              color: LeftBarTheme.of(context).labelColor,
              muted: true,
              maxLines: 1,
              overflow: TextOverflow.clip,
              fontWeight: 700,
            ),
          );
  }
}
