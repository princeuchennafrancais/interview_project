import 'package:flutter/material.dart';
import '../utils/color_util.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final Color textColor;
  final Widget? icon;
  final bool isOutlined;
  final bool isDisabled;

  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.backgroundColor = AppColors.buttonBlue,
    this.textColor = AppColors.textWhite,
    this.icon,
    this.isOutlined = false,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    final bool isEnabled = onPressed != null && !isDisabled;

    return SizedBox(
      width: double.infinity,
      height: 56,
      child: isOutlined
          ? OutlinedButton(
        onPressed: isEnabled ? onPressed : null,
        style: OutlinedButton.styleFrom(
          side: BorderSide(
            color: isEnabled ? textColor : textColor.withOpacity(0.5),
            width: 1.5,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
        ),
        child: _buildContent(isEnabled),
      )
          : ElevatedButton(
        onPressed: isEnabled ? onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: isEnabled
              ? backgroundColor
              : backgroundColor.withOpacity(0.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
          elevation: 0,
        ),
        child: _buildContent(isEnabled),
      ),
    );
  }

  Widget _buildContent(bool isEnabled) {
    if (icon != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Opacity(
            opacity: isEnabled ? 1.0 : 0.7,
            child: icon!,
          ),
          const SizedBox(width: 12),
          Text(
            text,
            style: TextStyle(
              color: isEnabled ? textColor : textColor.withOpacity(0.7),
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      );
    } else {
      return Text(
        text,
        style: TextStyle(
          color: isEnabled ? textColor : textColor.withOpacity(0.7),
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      );
    }
  }
}