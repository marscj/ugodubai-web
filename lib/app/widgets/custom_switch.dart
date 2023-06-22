import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

class CustomSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;

  final double width, height;
  final double thumbSize;
  final double spacingOfThumbTrack;

  final Color? activeBorderColor, inactiveBorderColor;

  const CustomSwitch({
    Key? key,
    required this.value,
    this.onChanged,
    this.width = 56,
    this.height = 28,
    this.thumbSize = 22,
    this.spacingOfThumbTrack = 4,
    this.activeBorderColor,
    this.inactiveBorderColor,
  }) : super(key: key);

  const CustomSwitch.normal({
    Key? key,
    required this.value,
    this.onChanged,
    this.width = 48,
    this.height = 24,
    this.thumbSize = 20,
    this.spacingOfThumbTrack = 4,
    this.activeBorderColor,
    this.inactiveBorderColor,
  }) : super(key: key);

  const CustomSwitch.small({
    Key? key,
    required this.value,
    this.onChanged,
    this.width = 32,
    this.height = 16,
    this.thumbSize = 13.5,
    this.spacingOfThumbTrack = 2.5,
    this.activeBorderColor,
    this.inactiveBorderColor,
  }) : super(key: key);

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.onChanged != null) {
          widget.onChanged!(!widget.value);
        }
      },
      child: Container(
        width: widget.width,
        height: widget.height,
        padding: FxSpacing.all(widget.spacingOfThumbTrack),
        decoration: BoxDecoration(
          border: Border.all(width: 0.6),
          borderRadius: BorderRadius.circular(widget.height / 2),
        ),
        child: Align(
          alignment:
              widget.value ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            width: widget.thumbSize,
            height: widget.thumbSize,
            decoration: BoxDecoration(shape: BoxShape.circle),
          ),
        ),
      ),
    );
  }
}
