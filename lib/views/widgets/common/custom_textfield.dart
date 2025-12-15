import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;

  final String? label;
  final String? hint;

  final IconData? prefixIcon;
  final IconData? suffixIcon;

  final double iconSize;
  final Color iconColor;

  final bool obscure;
  final bool readOnly;

  final TextInputType keyboardType;

  final Color cursorColor;

  final Color fillColor;
  final Color borderColor;
  final Color focusColor;
  final Color errorColor;

  final double borderRadius;
  final double height;
  final double borderWidth;
  final double focusBorderWidth;
  final double errorBorderWidth;

  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final TextStyle? errorStyle;

  final String? Function(String?)? validator;
  final VoidCallback? onTap;
  final VoidCallback? onSuffixTap;
  final ValueChanged<String>? onChanged;


  // → NEW
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final TextInputAction textInputAction;

  const CustomTextField({
    super.key,
    required this.controller,

    this.label,
    this.hint,

    this.prefixIcon,
    this.suffixIcon,

    this.iconSize = 22,
    this.iconColor = Colors.grey,

    this.obscure = false,
    this.readOnly = false,

    this.keyboardType = TextInputType.text,

    this.cursorColor = AppColors.primaryColor,
    this.fillColor = const Color(0xFFF5F5F5),
    this.borderColor = Colors.transparent,
    this.focusColor = AppColors.primaryColor,
    this.errorColor = Colors.red,

    this.borderRadius = 6,
    this.height = 58,

    this.borderWidth = 1.0,
    this.focusBorderWidth = 1.3,
    this.errorBorderWidth = 1.3,

    this.labelStyle,
    this.hintStyle,
    this.textStyle,
    this.errorStyle,

    this.validator,
    this.onTap,
    this.onSuffixTap,
    this.onChanged,

    this.focusNode,
    this.nextFocusNode,
    this.textInputAction = TextInputAction.next,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isFocused = false;

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (focused) => setState(() => isFocused = focused),
      child: FormField<String>(
        validator: widget.validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        builder: (state) {
          final hasError = state.hasError;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '${widget.label} ',
                      style: widget.labelStyle??Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: const Color(0xFF0F172A),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        height: 1.50,
                      ),
                    ),
                    const TextSpan(
                      text: '*',
                      style:  TextStyle(
                        color: Color(0xFFFF3636) /* System-Danger */,
                        fontSize: 16,
                        fontFamily: 'Instrument Sans',
                        fontWeight: FontWeight.w600,
                        height: 2,
                      ),
                    ),
                  ],
                ),
              ),
              // SizedBox(height: 10),
              Container(
                height: hasError ? widget.height + 10 : widget.height - 10,
                decoration: BoxDecoration(
                  color: widget.fillColor,
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                ),

                child: TextFormField(
                  controller: widget.controller,
                  obscureText: widget.obscure,
                  readOnly: widget.readOnly,
                  keyboardType: widget.keyboardType,
                  onTap: widget.onTap,
                  focusNode: widget.focusNode,
                  textInputAction: widget.textInputAction,
                  cursorColor: widget.cursorColor,
                  cursorWidth: 1.2,
                  onChanged: (val) {
                    state.didChange(val);
                    widget.onChanged?.call(val);
                  },

                  style:
                      widget.textStyle?.copyWith(
                        color: Colors.black.withAlpha((0.7 * 255).toInt())

                      ) ??
                      const TextStyle(fontSize: 15, color: Colors.black87),

                  decoration: InputDecoration(
                    errorText: state.errorText,
                    // <-- required
                    errorStyle: widget.errorStyle,

                    contentPadding: EdgeInsets.only(left: 10, right: 10),
                    // labelText: widget.label,
                    hintText: widget.hint,
                    labelStyle:
                        widget.labelStyle ??
                        TextStyle(color: Colors.grey.shade600, fontSize: 14),

                    hintStyle:
                        widget.hintStyle ??
                        TextStyle(color: Colors.grey.shade500, fontSize: 11),

                    filled: true,
                    fillColor: widget.fillColor,
                    prefixIcon: widget.prefixIcon != null
                        ? Icon(
                            widget.prefixIcon,
                            size: widget.iconSize,
                            color: widget.iconColor,
                          )
                        : null,
                    suffixIcon: widget.suffixIcon != null
                        ? InkWell(
                            onTap: widget.onSuffixTap,
                            child: Icon(
                              widget.suffixIcon,
                              size: widget.iconSize,
                              color: widget.iconColor,
                            ),
                          )
                        : null,

                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(widget.borderRadius),
                      borderSide: BorderSide(
                        color: widget.borderColor,
                        width: widget.borderWidth,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(widget.borderRadius),
                      borderSide: BorderSide(
                        color: widget.focusColor,
                        width: widget.focusBorderWidth,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(widget.borderRadius),
                      borderSide: BorderSide(
                        color: widget.errorColor,
                        width: widget.errorBorderWidth,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(widget.borderRadius),
                      borderSide: BorderSide(
                        color: widget.errorColor,
                        width: widget.errorBorderWidth,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
