import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AppBaseInputField extends StatefulWidget {
  const AppBaseInputField({
    super.key,
    this.onChanged,
    this.labelText,
    this.prefix,
    this.suffixIcon,
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
  final Widget? suffixIcon;
  final Color? borderColor;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  final void Function()? onInputFieldClear;

  @override
  State<AppBaseInputField> createState() => _AppBaseInputFieldState();
}

class _AppBaseInputFieldState extends State<AppBaseInputField> {
  late FocusNode _focusNode;

  static const _borderRarius = 15.0;

  @override
  Widget build(BuildContext context) {
    var errorBorderColor = Theme.of(context).colorScheme.error;

    return TextField(
      controller: widget.controller,
      focusNode: _focusNode,
      autofocus: widget.autofocus ?? false,
      onTap: !_focusNode.hasFocus ? () => setState(() {}) : null,
      keyboardType: widget.keyboardType,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        prefix: widget.prefix,
        suffixIcon: _focusNode.hasFocus
            ? (widget.onInputFieldClear != null
                ? _BaseInputFieldClearButton(
                    onInputFieldClear: widget.onInputFieldClear)
                : widget.suffixIcon)
            : null,
        labelText: widget.labelText,
        fillColor: Colors.white.withOpacity(0.4),
        filled: true,
        errorText: widget.errorText,
        contentPadding:
            EdgeInsets.symmetric(vertical: 2.0.h, horizontal: 2.0.w),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(_borderRarius),
          ),
          borderSide: BorderSide(
            color: errorBorderColor,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(_borderRarius),
          ),
        ),
      ),
      onChanged: widget.onChanged != null
          ? (String value) => widget.onChanged!(value)
          : null,
    );
  }

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();

    _focusNode.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
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
