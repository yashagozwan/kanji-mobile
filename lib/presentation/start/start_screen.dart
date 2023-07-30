import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../core/core.dart';
import 'start.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<StartCubit>().started();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BlocListener<StartCubit, StartState>(
              listenWhen: (previous, current) {
                return previous.status != current.status;
              },
              listener: (context, state) {
                String route;

                switch (state.authStatus) {
                  case AuthStatus.authenticated:
                    route = Routes.home;
                    break;
                  case AuthStatus.unauthenticated:
                    route = Routes.login;
                    break;
                }

                if (state.status == Status.success) {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    route,
                    (route) => false,
                  );
                }
              },
              child: const SizedBox.shrink(),
            ),
            SpinKitFadingCube(
              size: 100,
              itemBuilder: (context, index) {
                return DecoratedBox(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                  ),
                );
              },
            ),
            const SizedBox(height: 50),
            const Text(
              'Wait a minute!',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
