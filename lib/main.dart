// ignore_for_file: unnecessary_null_comparison

import 'package:fakestore/app/core/constant/constant.dart';
import 'package:fakestore/app/core/utils/app_storage/app_storage.dart';
import 'package:fakestore/app/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:fakestore/app/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:fakestore/app/features/product/presentation/bloc/product_bloc.dart';
import 'package:fakestore/app/routes/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app/config/app_config.dart';
import 'app/injection_containers.dart';
import 'app/routes/routes.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await AppConfig.init();
  bool isLogin = await AppStorage().getAuthToken() != null;
  runApp(MyApp(
    isLogin: isLogin,
  ));
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, this.isLogin = false});

  final bool isLogin;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 800),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, widgets) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<AuthBloc>(create: (_) => sl()),
              BlocProvider<ProductBloc>(create: (_) => sl()),
              BlocProvider<CartBloc>(create: (_) => sl()),
            ],
            child: MaterialApp(
              title: 'Fake Store',
              navigatorKey: navigatorKey,
              debugShowCheckedModeBanner: false,
              initialRoute: isLogin ? Pages.product : Pages.login,
              onGenerateRoute: AppRoutes.onGenerateRoute,
              theme: ThemeData(
                useMaterial3: true,
              ),
            ),
          );
        });
  }
}
