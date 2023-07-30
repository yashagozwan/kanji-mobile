import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kanji_app/core/routes.dart';
import 'package:kanji_app/presentation/home/home.dart';
import '../../core/images.dart';
import '../../core/status.dart';
import 'login.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(milliseconds: 1000),
      context.read<HomeCubit>().reset,
    );

    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(),
        child: SizedBox(
          width: 300,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Text(
                  '日本語',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'BELAJAR KANJI',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Ayo kita asah bahasa jepang kamu bersama daruma',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: 200,
                child: Image.asset(Images.assetDaruma),
              ),
              const SizedBox(height: 24),
              BlocConsumer<LoginCubit, LoginState>(
                listenWhen: (previous, current) {
                  return previous.status != current.status;
                },
                buildWhen: (previous, current) {
                  return previous.status != current.status;
                },
                listener: (context, state) {
                  if (state.status == Status.success) {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      Routes.home,
                      (route) => false,
                    );
                  }
                },
                builder: (context, state) {
                  final button = ElevatedButton(
                    onPressed: context.read<LoginCubit>().login,
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FaIcon(FontAwesomeIcons.google),
                        SizedBox(width: 8),
                        Text('Sign In With Google')
                      ],
                    ),
                  );

                  return switch (state.status) {
                    Status.initial => button,
                    Status.loading => const CircularProgressIndicator(),
                    Status.success => button,
                    Status.failure => button,
                  };
                },
              ),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 16,
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Text(
                  '日本語を勉強しよう',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
