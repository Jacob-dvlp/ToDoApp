import 'package:flutter/material.dart';

class TodoElevatedButton extends StatelessWidget {
  const TodoElevatedButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.padding,
    this.borderRadius,
    this.borderSide,
    this.elevation,
    this.backgroundColor,
    this.enable = true,
  });

  final Function() onPressed;
  final Widget child;
  final EdgeInsets? padding;
  final double? borderRadius;
  final BorderSide? borderSide;
  final Color? backgroundColor;
  final double? elevation;
  final bool enable;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: enable ? onPressed : () {},
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(backgroundColor),
        elevation: WidgetStateProperty.all(elevation),
        padding: WidgetStateProperty.all(padding ?? const EdgeInsets.all(20)),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 18),
            side: borderSide ?? BorderSide.none,
          ),
        ),
      ),
      child: child,
    );
  }
}

Widget buttonSpinner() {
  return const Center(
    child: SizedBox(
      width: 16,
      height: 16,
      child: CircularProgressIndicator(),
    ),
  );
}
