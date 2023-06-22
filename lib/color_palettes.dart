import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

import 'package:get/get.dart';

import 'package:ugodubai/app/extensions/widget.dart';
import 'package:ugodubai/app/extensions/widgets.dart';
import 'package:ugodubai/app/widgets/material_state_widget.dart';

const Widget divider = SizedBox(height: 10);

const List<MaterialColor> colorOptions = [
  Colors.red,
  Colors.pink,
  Colors.purple,
  Colors.deepPurple,
  Colors.indigo,
  Colors.blue,
  Colors.lightBlue,
  Colors.cyan,
  Colors.teal,
  Colors.green,
  Colors.lightGreen,
  Colors.lime,
  Colors.yellow,
  Colors.amber,
  Colors.orange,
  Colors.deepOrange,
  Colors.brown,
  Colors.blueGrey,
  Colors.grey,
];

const List<String> colorText = <String>[
  'red',
  'pink',
  'purple',
  'deepPurple',
  'indigo',
  'blue',
  'lightBlue',
  'cyan',
  'teal',
  'green',
  'lightGreen',
  'lime',
  'yellow',
  'amber',
  'orange',
  'deepOrange',
  'brown',
  'blueGrey',
  'grey'
];

class ColorPalettesScreen extends StatefulWidget {
  const ColorPalettesScreen({super.key});

  @override
  State<StatefulWidget> createState() => _ColorPalettesScreenState();
}

class _ColorPalettesScreenState extends State<ColorPalettesScreen> {
  bool isMaterial3 = true;
  bool isLight = true;
  MaterialColor primaryColor = Colors.blueGrey;

  ThemeData get lightTheme => Theme.of(context).copyWith(
      colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
      brightness: Brightness.light);

  ThemeData get darkTheme => Theme.of(context).copyWith(
      colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
      brightness: Brightness.dark);

  late ThemeData theme;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    theme = lightTheme;
  }

  void changeTheme() {
    theme = isLight ? lightTheme : darkTheme;
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: theme,
      child: Scaffold(
        appBar: AppBar(),
        body: [
          FxSpacing.height(40),
          Text('Material Color').center,
          List.generate(
              colorOptions.length,
              (index) => SizedBox(
                    width: 200,
                    height: 50,
                    child: [
                      [50, 100, 200, 300, 400, 500, 600, 700, 800, 900]
                          .map((e) => Container(
                              width: 20,
                              height: 50,
                              color: colorOptions[index][e],
                              child: Text(e.toString(),
                                      style: TextStyle(fontSize: 6))
                                  .center))
                          .toList()
                          .row(),
                      Text(colorText[index],
                          style: TextStyle(color: Colors.black87, fontSize: 10))
                    ].stack(),
                  ).paddingAll(5)).warp(),
          FxSpacing.height(20),
          [
            [
              Text('Theme Mode').center,
              Switch(
                onChanged: (value) {
                  setState(() {
                    isLight = value;
                    changeTheme();
                  });
                },
                value: isLight,
              ),
            ].col(),
            FxSpacing.width(40),
            [
              Text('Use Material3').center,
              Switch(
                onChanged: (value) {
                  setState(() {
                    isMaterial3 = value;
                    changeTheme();
                  });
                },
                value: isMaterial3,
              ),
            ].col(),
          ].row(ma: MainAxisAlignment.center),
          FxSpacing.height(20),
          Text('Material Color').center,
          List.generate(
              colorOptions.length,
              ((index) => SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          primaryColor = colorOptions[index];
                          changeTheme();
                        });
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: colorOptions[index]),
                      child: Text(
                        colorText[index],
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ).paddingAll(5))).warp(),
          FxSpacing.height(20),
          Text('Widgets').center,
          ElevatedButton(onPressed: () {}, child: Text('ElevatedButton')),
          FilledButton(
            onPressed: () {},
            child: Text('FilledButton'),
          ),
          OutlinedButton(onPressed: () {}, child: Text('OutlinedButton')),
          TextButton(onPressed: () {}, child: Text('TextButton')),
          MaterialStateWidget(
            onPressed: () {},
            onLongPress: () {},
            onHover: (value) {},
            onFocusChange: (value) {},
            child: Text('MaterialStateWidget'),
          ),
          ListTile(
            title: Text('ListTile'),
            onTap: () {},
          ),
          AboutListTile(
            child: Text('AboutListTile'),
          ),
          CupertinoListTile(
            title: Text('CupertinoListTile'),
            onTap: () {},
          ),
          FxSpacing.height(20),
          [
            [
              Text('Light Theme').center,
              schemeView(lightTheme),
            ].col().expanded,
            [
              Text('Dark Theme').center,
              schemeView(darkTheme),
            ].col().expanded,
          ].row(ma: MainAxisAlignment.start, ca: CrossAxisAlignment.start),
          FxSpacing.height(100)
        ].col().list,
      ),
    );
  }
}

Widget schemeView(ThemeData theme) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    child: ColorSchemeView(
      colorScheme: theme.colorScheme,
    ),
  );
}

class ColorSchemeView extends StatelessWidget {
  const ColorSchemeView({super.key, required this.colorScheme});

  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ColorGroup(children: [
          ColorChip(
            label: "primary",
            color: colorScheme.primary,
            onColor: colorScheme.onPrimary,
          ),
          ColorChip(
              label: "onPrimary",
              color: colorScheme.onPrimary,
              onColor: colorScheme.primary),
          ColorChip(
            label: "primaryContainer",
            color: colorScheme.primaryContainer,
            onColor: colorScheme.onPrimaryContainer,
          ),
          ColorChip(
            label: "onPrimaryContainer",
            color: colorScheme.onPrimaryContainer,
            onColor: colorScheme.primaryContainer,
          )
        ]),
        divider,
        ColorGroup(children: [
          ColorChip(
            label: "secondary",
            color: colorScheme.secondary,
            onColor: colorScheme.onSecondary,
          ),
          ColorChip(
            label: "onSecondary",
            color: colorScheme.onSecondary,
            onColor: colorScheme.secondary,
          ),
          ColorChip(
            label: "secondaryContainer",
            color: colorScheme.secondaryContainer,
            onColor: colorScheme.onSecondaryContainer,
          ),
          ColorChip(
              label: "onSecondaryContainer",
              color: colorScheme.onSecondaryContainer,
              onColor: colorScheme.secondaryContainer)
        ]),
        divider,
        ColorGroup(
          children: [
            ColorChip(
                label: 'tertiary',
                color: colorScheme.tertiary,
                onColor: colorScheme.onTertiary),
            ColorChip(
                label: 'onTertiary',
                color: colorScheme.onTertiary,
                onColor: colorScheme.tertiary),
            ColorChip(
                label: 'tertiaryContainer',
                color: colorScheme.tertiaryContainer,
                onColor: colorScheme.onTertiaryContainer),
            ColorChip(
                label: 'onTertiaryContainer',
                color: colorScheme.onTertiaryContainer,
                onColor: colorScheme.tertiaryContainer),
          ],
        ),
        divider,
        ColorGroup(
          children: [
            ColorChip(
                label: 'error',
                color: colorScheme.error,
                onColor: colorScheme.onError),
            ColorChip(
                label: 'onError',
                color: colorScheme.onError,
                onColor: colorScheme.error),
            ColorChip(
                label: 'errorContainer',
                color: colorScheme.errorContainer,
                onColor: colorScheme.onErrorContainer),
            ColorChip(
                label: 'onErrorContainer',
                color: colorScheme.onErrorContainer,
                onColor: colorScheme.errorContainer),
          ],
        ),
        divider,
        ColorGroup(
          children: [
            ColorChip(
                label: 'background',
                color: colorScheme.background,
                onColor: colorScheme.onBackground),
            ColorChip(
                label: 'onBackground',
                color: colorScheme.onBackground,
                onColor: colorScheme.background),
          ],
        ),
        divider,
        ColorGroup(
          children: [
            ColorChip(
                label: 'surface',
                color: colorScheme.surface,
                onColor: colorScheme.onSurface),
            ColorChip(
                label: 'onSurface',
                color: colorScheme.onSurface,
                onColor: colorScheme.surface),
            ColorChip(
                label: 'surfaceVariant',
                color: colorScheme.surfaceVariant,
                onColor: colorScheme.onSurfaceVariant),
            ColorChip(
                label: 'onSurfaceVariant',
                color: colorScheme.onSurfaceVariant,
                onColor: colorScheme.surfaceVariant),
          ],
        ),
        divider,
        ColorGroup(
          children: [
            ColorChip(label: 'outline', color: colorScheme.outline),
            ColorChip(label: 'shadow', color: colorScheme.shadow),
            ColorChip(
                label: 'inverseSurface',
                color: colorScheme.inverseSurface,
                onColor: colorScheme.onInverseSurface),
            ColorChip(
                label: 'onInverseSurface',
                color: colorScheme.onInverseSurface,
                onColor: colorScheme.inverseSurface),
            ColorChip(
                label: 'inversePrimary',
                color: colorScheme.inversePrimary,
                onColor: colorScheme.primary),
          ],
        ),
      ],
    );
  }
}

class ColorGroup extends StatelessWidget {
  const ColorGroup({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: children,
      ),
    );
  }
}

class ColorChip extends StatelessWidget {
  const ColorChip({
    super.key,
    required this.color,
    required this.label,
    this.onColor,
  });

  final Color color;
  final Color? onColor;
  final String label;

  static Color contrastColor(Color color) {
    final brightness = ThemeData.estimateBrightnessForColor(color);
    switch (brightness) {
      case Brightness.dark:
        return Colors.white;
      case Brightness.light:
        return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    final Color labelColor = onColor ?? contrastColor(color);

    return Container(
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(child: Text(label, style: TextStyle(color: labelColor))),
          ],
        ),
      ),
    );
  }
}
