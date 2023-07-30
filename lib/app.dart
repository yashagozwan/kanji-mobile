import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanji_app/presentation/detail/detail.dart';
import 'core/custom_theme.dart';
import 'presentation/search/search.dart';
import 'presentation/user/user.dart';
import 'presentation/login/login.dart';
import 'presentation/home/home.dart';
import 'presentation/start/start.dart';
import 'core/routes.dart';
import 'core/injection/injection.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<LoginCubit>()),
        BlocProvider(create: (context) => getIt<HomeCubit>()),
        BlocProvider(create: (context) => getIt<StartCubit>()),
        BlocProvider(create: (context) => getIt<UserCubit>()),
        BlocProvider(create: (context) => getIt<SearchCubit>()),
        BlocProvider(
          create: (context) => getIt<DetailCubit>(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: CustomTheme.theme,
        initialRoute: Routes.start,
        routes: {
          Routes.start: (context) => const StartScreen(),
          Routes.home: (context) => const HomeScreen(),
          Routes.login: (context) => const LoginScreen(),
          Routes.detail: (context) => const DetailScreen(),
        },
      ),
    );
  }
}
