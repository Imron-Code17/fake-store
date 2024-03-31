import 'dart:developer';

import 'package:fakestore/app/config/theme/colors.dart';
import 'package:fakestore/app/config/theme/font.dart';
import 'package:fakestore/app/config/theme/style.dart';
import 'package:fakestore/app/config/theme/theme.dart';
import 'package:fakestore/app/core/components/button/primary_button.dart';
import 'package:fakestore/app/core/components/form/app_form.dart';
import 'package:fakestore/app/core/utils/validator.dart';
import 'package:fakestore/app/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../injection_containers.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  late TextEditingController usernameEditingController;
  late TextEditingController passwordEditingController;

  @override
  void initState() {
    super.initState();
    usernameEditingController = TextEditingController();
    passwordEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AuthBloc>(),
      child: Scaffold(
        backgroundColor: kWhiteColor,
        body: SafeArea(
          child: ListView(
              padding: theme.style.padding.allLarge,
              children: [_buildHeader(context), _buildForm(context)]),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Gap(72.h),
        Text(
          'Fake Shop',
          style: theme.font.f26.bold.copyWith(color: kPrimaryColor),
        ),
        Text(
          'Shop from our stores with ease',
          style: theme.font.f14.medium.copyWith(color: kGrey),
        ),
        Gap(148.h),
      ],
    );
  }

  Widget _buildForm(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      log("PP : ${state.status == AuthStatus.loading}");
      return Form(
        key: formKey,
        child: Column(
          children: [
            AppForm(
              label: 'Username',
              controller: usernameEditingController,
              validator: (value) =>
                  validatorText(value, 'Username', minChar: 0),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              keyboardType: TextInputType.emailAddress,
            ),
            Gap(16.h),
            AppForm.password(
              label: 'Password',
              controller: passwordEditingController,
              validator: (value) => validatePassword(value),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              keyboardType: TextInputType.visiblePassword,
            ),
            Gap(36.h),
            PrimaryButton(
                isLoading: state.status == AuthStatus.loading,
                isExpanded: true,
                text: 'Sign In',
                onPressed: () {
                  if ((formKey.currentState?.validate() ?? false)) {
                    context.read<AuthBloc>().add(TodoLoginEvent(
                        username: usernameEditingController.text,
                        password: passwordEditingController.text));
                  }
                }),
          ],
        ),
      );
    });
  }
}
