import "package:flutter/material.dart";
import "../styles/button_styles.dart";
import "../styles/text_styles.dart";

class Button extends StatelessWidget {

  final ButtonStyle style;
  final TextStyle labelStyle;
  final String label;
  final double? width;
  final double? height;
  final VoidCallback? onPressed;
  final bool outline;

  const Button({super.key, required this.style, this.height, this.outline = false, required this.label, this.onPressed, required this.labelStyle, this.width});

  Button.primary({super.key, this.height, required this.label, this.onPressed, this.width}) : 
    style = ButtonStyles.i.primaryButton,
    labelStyle = TextStyles.i.textSecondaryFontExtraBold,
    outline = false;

  @override
  Widget build(BuildContext context) {
    final labelText = Text(
    label,
    style: labelStyle,
    overflow: TextOverflow.ellipsis,
  );

    return SizedBox(
      width: width,
      height: height,
      child: outline 
      ? OutlinedButton(
        onPressed: onPressed,
         style: style,
         child: labelText,
         )
       : ElevatedButton(
        onPressed: onPressed,
          style: style,
          child: labelText,
         ),
    );
  }
}