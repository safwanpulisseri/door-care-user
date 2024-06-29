import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/color/app_color.dart';

class AuthTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final String? Function(String?)? validator;
  final bool obscureText;
  final String? prefixIcon;
  final bool showPasswordToggle;
  final TextInputType textInputType;

  const AuthTextFormField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.hintText,
    this.textInputType = TextInputType.text,
    this.validator,
    this.obscureText = false,
    this.prefixIcon,
    this.showPasswordToggle = false,
  });

  @override
  createState() => _AuthTextFormFieldState();
}

class _AuthTextFormFieldState extends State<AuthTextFormField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelText,
          style: const TextStyle(
            color: AppColor.secondary,
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
          ),
        ),
        const SizedBox(height: 8.0),
        TextFormField(
          controller: widget.controller,
          keyboardType: widget.textInputType,
          validator: widget.validator,
          obscureText: widget.obscureText && _obscureText,
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColor.textfield,
            prefixIcon: widget.prefixIcon != null
                ? Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SvgPicture.asset(
                      widget.prefixIcon!,
                      width: 24.0,
                      height: 24.0,
                    ),
                  )
                : null, // Use prefixIcon if provided
            hintText: widget.hintText,
            hintStyle: const TextStyle(
              color: Colors.grey,
              fontSize: 16.0,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: const BorderSide(
                color: AppColor.primary,
                width: 1.0,
              ),
            ),
            suffixIcon: widget.obscureText && widget.showPasswordToggle
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                    icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                  )
                : null,
          ),
          style: const TextStyle(
            fontSize: 16.0,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 7)
      ],
    );
  }
}
