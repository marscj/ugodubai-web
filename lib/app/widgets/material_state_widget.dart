import 'package:flutter/material.dart';

class MaterialStateWidget extends StatefulWidget {
  const MaterialStateWidget({
    Key? key,
    this.width,
    this.height,
    this.elevation = 1.0,
    this.borderRadius = 0.0,
    this.shape,
    this.mouseCursor,
    this.onPressed,
    this.onLongPress,
    this.onHover,
    this.onFocusChange,
    this.statesController,
    required this.child,
  }) : super(key: key);

  final double? width;
  final double? height;
  final double elevation;
  final double borderRadius;
  final ShapeBorder? shape;
  final MouseCursor? mouseCursor;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final ValueChanged<bool>? onHover;
  final ValueChanged<bool>? onFocusChange;
  final MaterialStatesController? statesController;

  final Widget child;

  bool get enabled => onPressed != null || onLongPress != null;

  @override
  State<MaterialStateWidget> createState() => _MaterialStateWidgetState();
}

class _MaterialStateWidgetState extends State<MaterialStateWidget> {
  MaterialStatesController? internalStatesController;

  void handleStatesControllerChange() {
    setState(() {});
  }

  MaterialStatesController get statesController =>
      widget.statesController ?? internalStatesController!;

  void initStatesController() {
    if (widget.statesController == null) {
      internalStatesController = MaterialStatesController();
    }
    statesController.update(MaterialState.disabled, !widget.enabled);
    statesController.addListener(handleStatesControllerChange);
  }

  @override
  void initState() {
    super.initState();
    initStatesController();
  }

  @override
  void didUpdateWidget(MaterialStateWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.statesController != oldWidget.statesController) {
      oldWidget.statesController?.removeListener(handleStatesControllerChange);
      if (widget.statesController != null) {
        internalStatesController?.dispose();
        internalStatesController = null;
      }
      initStatesController();
    }
    if (widget.enabled != oldWidget.enabled) {
      statesController.update(MaterialState.disabled, !widget.enabled);
      if (!widget.enabled) {
        statesController.update(MaterialState.pressed, false);
      }
    }
  }

  @override
  void dispose() {
    statesController.removeListener(handleStatesControllerChange);
    internalStatesController?.dispose();
    super.dispose();
  }

  ColorScheme get _colors => Theme.of(context).colorScheme;

  Color contrastColor(Color color) {
    final brightness = ThemeData.estimateBrightnessForColor(color);
    switch (brightness) {
      case Brightness.dark:
        return Colors.white;
      case Brightness.light:
        return _colors.onPrimary;
    }
  }

  MaterialStateProperty<TextStyle?> get textStyle =>
      MaterialStatePropertyAll<TextStyle?>(
          Theme.of(context).textTheme.labelLarge);

  MaterialStateProperty<Color?>? get backgroundColor =>
      MaterialStateProperty.resolveWith((Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return _colors.onSurface.withOpacity(0.12);
        }
        return _colors.primary;
      });

  MaterialStateProperty<Color?>? get foregroundColor =>
      MaterialStateProperty.resolveWith((Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return _colors.onSurface.withOpacity(0.38);
        }
        return _colors.onPrimary;
      });

  MaterialStateProperty<Color?>? get overlayColor =>
      MaterialStateProperty.resolveWith((Set<MaterialState> states) {
        if (states.contains(MaterialState.hovered)) {
          return _colors.onPrimary.withOpacity(0.08);
        }
        if (states.contains(MaterialState.focused)) {
          return _colors.onPrimary.withOpacity(0.12);
        }
        if (states.contains(MaterialState.pressed)) {
          return _colors.onPrimary.withOpacity(0.12);
        }
        return null;
      });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: _colors.primary,
      elevation: widget.elevation,
      textStyle: TextStyle(color: contrastColor(_colors.primary)),
      borderRadius: BorderRadius.circular(widget.borderRadius),
      shape: widget.shape,
      child: InkWell(
        overlayColor: overlayColor,
        mouseCursor: widget.mouseCursor,
        onTap: widget.onPressed,
        onLongPress: widget.onLongPress,
        onHover: widget.onHover,
        onFocusChange: widget.onFocusChange,
        statesController: statesController,
        child: SizedBox(
          width: widget.width,
          height: widget.height,
          child: widget.child,
        ),
      ),
    );
  }
}
