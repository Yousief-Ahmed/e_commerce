import 'package:e_commerce/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final Widget? suffixIcon;
  final String hintText;
  final TextInputType keyboardType;
  final void Function(String?)? onSaved;
  final bool obscureText;

  const CustomTextFormField({
    super.key,
    this.suffixIcon,
    required this.hintText,
    required this.keyboardType, this.onSaved, this.obscureText =false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText ,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'هذا الحقل مطلوب';
        }
        return null;
      },
      onSaved: onSaved,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: Color(0xFFF9FAFA),
        hintText: hintText,
        hintStyle: TextStyles.bold13.copyWith(color: Color(0xFF949D9E)),
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(color: Color(0xFFE6E9EA), width: 1),
    );
  }
}
