import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

// Color hexToColor(String hexCode) {
//   final buffer = StringBuffer();
//   if (hexCode.length == 6 || hexCode.length == 7) buffer.write('ff');
//   buffer.write(hexCode.replaceFirst('#', ''));
//   return Color(int.parse(buffer.toString(), radix: 16));
// }

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final String backgroundColor;
  final Color textColor;
  final double borderRadius;
  final double paddingVertical;
  final double paddingHorizontal;
  final IconData? icon;
  final double iconSpacing;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = "0B0909",
    this.textColor = Colors.white,
    this.borderRadius = 12.0,
    this.paddingVertical = 14.0,
    this.paddingHorizontal = 24.0,
    this.icon,
    this.iconSpacing = 8.0,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: HexColor(backgroundColor),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        padding: EdgeInsets.symmetric(
          vertical: paddingVertical,
          horizontal: paddingHorizontal,
        ),
        elevation: 3,
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) ...[
            Icon(icon, color: textColor, size: 20),
            SizedBox(width: iconSpacing),
          ],
          Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
