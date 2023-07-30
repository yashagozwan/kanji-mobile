import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanji_app/core/auth_status.dart';
import 'package:kanji_app/presentation/user/user.dart';
import 'package:kanji_app/presentation/widget/widget.dart';

import '../../core/routes.dart';
import '../../core/status.dart';

class UserSection extends StatelessWidget {
  const UserSection({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<UserCubit>()..started();
    return ListView(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: 24,
          ),
          color: Colors.white,
          child: BlocBuilder<UserCubit, UserState>(
            buildWhen: (previous, current) {
              return previous.status != current.status ||
                  current.authStatus == AuthStatus.authenticated;
            },
            builder: (context, state) {
              final user = state.user;
              return switch (state.status) {
                Status.initial => const SizedBox.shrink(),
                Status.loading => const SizedBox.shrink(),
                Status.success => LayoutSlot(
                    bottom: 0,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(user.image),
                            radius: 30,
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  user.name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 24,
                                  ),
                                ),
                                Text(
                                  user.email,
                                  style: const TextStyle(
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                Status.failure => const SizedBox.shrink(),
              };
            },
          ),
        ),
        LayoutSlot(
          children: [
            BlocListener<UserCubit, UserState>(
              listenWhen: (previous, current) {
                return previous.status != current.status &&
                    previous.authStatus != current.authStatus;
              },
              listener: (context, state) {
                if (state.status == Status.success &&
                    state.authStatus == AuthStatus.unauthenticated) {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    Routes.login,
                    (route) {
                      return false;
                    },
                  );
                }
              },
              child: OutlinedButton(
                onPressed: () => cubit.logout(),
                child: const Text('Logout'),
              ),
            ),
          ],
        )
      ],
    );
  }
}
