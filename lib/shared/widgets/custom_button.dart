import 'package:flutter/material.dart';
import '../../core/constants/app_dimensions.dart';

enum ButtonType { elevated, outlined, text }

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final ButtonType type;
  final bool isLoading;
  final IconData? icon;
  final Color? backgroundColor;
  final Color? textColor;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;

  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.type = ButtonType.elevated,
    this.isLoading = false,
    this.icon,
    this.backgroundColor,
    this.textColor,
    this.width,
    this.height,
    this.padding,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final buttonStyle = _getButtonStyle(context);
    final child = _buildButtonChild();

    Widget button;
    switch (type) {
      case ButtonType.elevated:
        button = ElevatedButton(
          onPressed: isLoading ? null : onPressed,
          style: buttonStyle,
          child: child,
        );
        break;
      case ButtonType.outlined:
        button = OutlinedButton(
          onPressed: isLoading ? null : onPressed,
          style: buttonStyle,
          child: child,
        );
        break;
      case ButtonType.text:
        button = TextButton(
          onPressed: isLoading ? null : onPressed,
          style: buttonStyle,
          child: child,
        );
        break;
    }

    return SizedBox(
      width: width,
      height: height ?? AppDimensions.buttonHeightMedium,
      child: button,
    );
  }

  ButtonStyle _getButtonStyle(BuildContext context) {
    return ButtonStyle(
      backgroundColor: backgroundColor != null ? WidgetStateProperty.all(backgroundColor) : null,
      foregroundColor: textColor != null ? WidgetStateProperty.all(textColor) : null,
      padding: padding != null ? WidgetStateProperty.all(padding) : null,
      shape:
          borderRadius != null
              ? WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: borderRadius!))
              : null,
      minimumSize: WidgetStateProperty.all(
        Size(width ?? double.infinity, height ?? AppDimensions.buttonHeightMedium),
      ),
    );
  }

  Widget _buildButtonChild() {
    if (isLoading) {
      return const SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      );
    }

    if (icon != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: AppDimensions.iconSmall),
          const SizedBox(width: AppDimensions.paddingSmall),
          Text(text),
        ],
      );
    }

    return Text(text);
  }
}
