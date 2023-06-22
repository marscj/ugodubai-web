// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:ugodubai/constants/style.dart';

// import 'package:universal_html/html.dart' as html;

// class HorizontalMenu extends StatelessWidget {
//   const HorizontalMenu({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox.fromSize(
//       size: Size.fromWidth(80),
//       child: Container(color: Colors.red),
//     );
//   }
// }

// class VerticalMenu extends StatelessWidget {
//   const VerticalMenu({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

// class MyMenu extends StatelessWidget {
//   const MyMenu({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return HorizontalMenu();
//   }
// }

// class NavigationMenu extends StatefulWidget {
//   const NavigationMenu({
//     super.key,
//     required this.menus,
//   });

//   final List<NavigationMenuItem> menus;

//   @override
//   NavigationMenuState createState() => NavigationMenuState();
// }

// class NavigationMenuState extends State<NavigationMenu> {
//   int index = 0;

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 100.0,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.end,
//         mainAxisSize: MainAxisSize.max,
//         children: widget.menus,
//       ),
//     );
//   }

//   // void onHighlight(String route) {
//   //   switch (route) {
//   //     case routeHome:
//   //       changeHighlight(0);
//   //       break;
//   //     case routeAbout:
//   //       changeHighlight(1);
//   //       break;
//   //     case routeContacts:
//   //       changeHighlight(2);
//   //       break;
//   //   }
//   // }

//   // void changeHighlight(int newIndex) {
//   //   setState(() {
//   //     index = newIndex;
//   //   });
//   // }
// }

// class InteractiveNavItem extends MouseRegion {
//   static final appContainer =
//       html.window.document.querySelectorAll('flt-glass-pane')[0];

//   InteractiveNavItem({
//     super.key,
//     Widget? child,
//     required String text,
//     required String routeName,
//     bool selected = false,
//   }) : super(
//           onHover: (PointerHoverEvent evt) {
//             appContainer.style.cursor = 'pointer';
//           },
//           onExit: (PointerExitEvent evt) {
//             appContainer.style.cursor = 'default';
//           },
//           child: InteractiveText(
//             text: text,
//             routeName: routeName,
//             selected: selected,
//           ),
//         );
// }

// class InteractiveText extends StatefulWidget {
//   final String text;
//   final String routeName;
//   final bool selected;

//   const InteractiveText({
//     super.key,
//     required this.text,
//     required this.routeName,
//     required this.selected,
//   });

//   @override
//   InteractiveTextState createState() => InteractiveTextState();
// }

// class InteractiveTextState extends State<InteractiveText> {
//   bool _hovering = false;

//   @override
//   Widget build(BuildContext context) {
//     return MouseRegion(
//       onHover: (_) => _hovered(true),
//       onExit: (_) => _hovered(false),
//       child: Text(widget.text,
//           style: _hovering
//               ? kPageTitleStyle.copyWith(
//                   color: Colors.indigo, decoration: TextDecoration.underline)
//               : (widget.selected)
//                   ? kPageTitleStyle.copyWith(color: Colors.red)
//                   : kPageTitleStyle),
//     );
//   }

//   _hovered(bool hovered) {
//     setState(() {
//       _hovering = hovered;
//     });
//   }
// }

// class NavigationMenuItem extends StatelessWidget {
//   final String title;
//   final String routeName;
//   final bool selected;
//   final Function onHighlight;

//   const NavigationMenuItem({
//     super.key,
//     required this.title,
//     required this.routeName,
//     required this.selected,
//     required this.onHighlight,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Get.toNamed(routeName);
//         onHighlight(routeName);
//       },
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 50.0),
//         child: InteractiveNavItem(
//           text: title,
//           routeName: routeName,
//           selected: selected,
//         ),
//       ),
//     );
//   }
// }
