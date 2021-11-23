import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ritenute_bonifici/src/core/constant.dart';
import 'package:ritenute_bonifici/src/presentation/blocs/cubit/ritenuta_cubit.dart';
import 'package:ritenute_bonifici/src/presentation/view/home_view.dart';
import 'package:ritenute_bonifici/src/themes/app_theme.dart';

class RitenuteApp extends StatelessWidget {
  const RitenuteApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => RitenutaCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: kAppTitle,
        theme: ritenuteTheme(),
        home: const HomeView(),
      ),
    );
  }
}
