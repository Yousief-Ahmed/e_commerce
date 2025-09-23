import 'package:e_commerce/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({super.key, this.onSaved});
  final void Function(String?)? onSaved; 
  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  
  bool obsecureText = true;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      obscureText: obsecureText,
      onSaved: widget.onSaved,
      hintText: "كلمة المرور",
      keyboardType: TextInputType.visiblePassword,
      suffixIcon: GestureDetector(
        onTap: () {
          setState(() {
            obsecureText = !obsecureText;
          });
        },
        child: obsecureText
            ? Icon(Icons.remove_red_eye_rounded, color: Color(0xFFC9CECF))
            : Icon(Icons.visibility_off_rounded, color: Color(0xFFC9CECF)),
      ),
    );
  }
}
