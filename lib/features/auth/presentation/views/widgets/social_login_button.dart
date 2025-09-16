import 'package:e_commerce/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton({
    super.key,
    required this.iconName,
    required this.label,
    this.onPressed,
  });

  final String iconName;
  final String label;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(color: Color(0xFFDDDFDF), width: 1),
          ),
        ),
        onPressed: onPressed,
        child: ListTile(
          visualDensity: VisualDensity(vertical: VisualDensity.minimumDensity),
          title: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyles.semiBold16.copyWith(color: Color(0xFF0C0D0D)),
          ),
          leading: SvgPicture.asset(iconName),
        ),
      ),
    );
  }
}
