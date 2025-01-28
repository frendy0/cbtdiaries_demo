import 'package:cbtdiaries_demo/presentations/authentication/bloc/authentication_bloc.dart';
import 'package:cbtdiaries_demo/presentations/home/screens/home_screen.dart';
import 'package:cbtdiaries_demo/presentations/itd/bloc/itd_bloc.dart';
import 'package:cbtdiaries_demo/presentations/shared/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
            create: (c) => AuthenticationBloc(), lazy: false),
        BlocProvider<ItdBloc>(create: (c) => ItdBloc())
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: mainLightTheme,
          debugShowCheckedModeBanner: false,
          home: const HomeScreen()),
    );
  }
}
