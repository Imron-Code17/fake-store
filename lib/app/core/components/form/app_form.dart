import 'package:fakestore/app/config/theme/colors.dart';
import 'package:fakestore/app/config/theme/font.dart';
import 'package:fakestore/app/config/theme/style.dart';
import 'package:fakestore/app/config/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppForm extends StatefulWidget {
  const AppForm(
      {super.key,
      required this.controller,
      this.keyboardType,
      this.validator,
      this.autovalidateMode,
      this.label,
      this.password = false,
      this.isSearch = false});

  const AppForm.search(
      {super.key,
      required this.controller,
      this.keyboardType,
      this.validator,
      this.autovalidateMode,
      this.label,
      this.password = false,
      this.isSearch = true});

  const AppForm.password(
      {super.key,
      required this.controller,
      this.keyboardType,
      this.validator,
      this.autovalidateMode,
      this.label,
      this.password = true,
      this.isSearch = false});

  final TextEditingController controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final AutovalidateMode? autovalidateMode;
  final String? label;
  final bool password;
  final bool isSearch;

  @override
  State<AppForm> createState() => _AppFormState();
}

class _AppFormState extends State<AppForm> {
  bool showPassword = true;
  bool isError = false;
  setShowPassword() {
    setState(() {
      showPassword = !showPassword;
    });
  }

  void clearForm() {
    widget.controller.clear();
    setState(() {
      isError = false;
    });
  }

  @override
  void initState() {
    super.initState();
    showPassword = widget.password;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: theme.style.fullWidth,
      height: isError ? 66.h : 44.h,
      child: TextFormField(
          autofocus: widget.isSearch,
          obscureText: showPassword,
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          cursorColor: kPrimaryColor,
          style: theme.font.f12,
          validator: (value) {
            final result = widget.validator?.call(value);
            final hasError = result != null;
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (isError != hasError) {
                setState(() {
                  isError = hasError;
                });
              }
            });
            return result;
          },
          autovalidateMode: widget.autovalidateMode,
          decoration: InputDecoration(
              labelText: widget.label,
              labelStyle: theme.font.f12.copyWith(color: kGrey),
              filled: true,
              fillColor: kWhiteColor,
              border: border,
              enabledBorder: border,
              focusedBorder: focuseBorder,
              errorBorder: errorBorder,
              focusedErrorBorder: errorBorder,
              errorStyle: theme.font.f12.red,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.w),
              prefixIcon: !widget.isSearch
                  ? Icon(
                      widget.password
                          ? Icons.lock_outline
                          : Icons.person_outline,
                      size: 20.r,
                      color: kGrey)
                  : null,
              suffixIcon: widget.password
                  ? IconButton(
                      onPressed: () => setShowPassword(),
                      icon: Icon(
                        showPassword ? Icons.visibility_off : Icons.visibility,
                        size: 20.r,
                        color: Colors.grey.shade400,
                      ))
                  : widget.isSearch
                      ? IconButton(
                          onPressed: () => clearForm(),
                          icon: Icon(
                            Icons.close,
                            size: 20.r,
                            color: kBlackColor,
                          ))
                      : null)),
    );
  }

  OutlineInputBorder get border {
    return OutlineInputBorder(
        borderRadius: theme.style.borderRadius.allSmall,
        borderSide: const BorderSide(color: kBorder));
  }

  OutlineInputBorder get focuseBorder {
    return OutlineInputBorder(
        borderRadius: theme.style.borderRadius.allSmall,
        borderSide: const BorderSide(color: kPrimaryColor, width: 1.2));
  }

  OutlineInputBorder get errorBorder {
    return OutlineInputBorder(
        borderRadius: theme.style.borderRadius.allSmall,
        borderSide: const BorderSide(color: kErrorColor));
  }
}
