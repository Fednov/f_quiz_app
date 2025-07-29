import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AppBaseInputField extends StatelessWidget {
  const AppBaseInputField({
    super.key,
    this.onChanged,
    this.labelText,
    this.prefix,
    this.suffix,
    this.autofocus,
    this.keyboardType,
    this.controller,
    this.borderColor,
    this.errorText,
    this.onInputFieldClear,
  });

  final String? labelText;
  final String? errorText;
  final bool? autofocus;

  final Widget? prefix;
  final Widget? suffix;
  final Color? borderColor;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  final void Function()? onInputFieldClear;

  double get borderRarius => 15.0;

  @override
  Widget build(BuildContext context) {
    var errorBorderColor = Theme.of(context).colorScheme.error;

    return TextField(
      controller: controller,
      autofocus: autofocus ?? false,
      keyboardType: keyboardType,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        prefix: prefix,
        suffix: onInputFieldClear != null
            ? _BaseInputFieldClearButton(onInputFieldClear: onInputFieldClear)
            : suffix,
        labelText: labelText,
        fillColor: Colors.white.withOpacity(0.4),
        filled: true,
        errorText: errorText,
        contentPadding:
            EdgeInsets.symmetric(vertical: 2.0.h, horizontal: 2.0.w),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(borderRarius),
          ),
          borderSide: BorderSide(
            color: errorBorderColor,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(borderRarius),
          ),
        ),
      ),
      onChanged: onChanged != null ? (String value) => onChanged!(value) : null,
    );
  }
}

class _BaseInputFieldClearButton extends StatelessWidget {
  const _BaseInputFieldClearButton({required this.onInputFieldClear});

  final void Function()? onInputFieldClear;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onInputFieldClear,
      icon: const Icon(Icons.clear),
    );
  }
}

// class _BaseInputFieldObscureTextButton extends StatelessWidget {
//   const _BaseInputFieldObscureTextButton({
//     required this.onObscureTextButtonPressed,
//   }) : super();

//   final void Function()? onObscureTextButtonPressed;

//   @override
//   Widget build(BuildContext context) {
//     return IconButton(
//         onPressed: onObscureTextButtonPressed, icon: Icon(Icons.obscu));
//   }
// }
