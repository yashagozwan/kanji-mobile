import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kanji_app/presentation/home/home_section.dart';
import 'package:kanji_app/presentation/search/search_section.dart';
import 'package:kanji_app/presentation/user/user_section.dart';
import 'home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>()..started();

    return Scaffold(
      body: BlocBuilder<HomeCubit, HomeState>(
        buildWhen: (previous, current) {
          return previous.index != current.index;
        },
        builder: (context, state) {
          return [
            const HomeSection(),
            const SearchSection(),
            const Center(child: Text('Pencil')),
            const Center(child: Text('List')),
            const UserSection(),
          ][state.index];
        },
      ),
      bottomNavigationBar: BlocBuilder<HomeCubit, HomeState>(
        buildWhen: (previous, current) => previous.index != current.index,
        builder: (context, state) {
          return BottomNavigationBar(
            currentIndex: state.index,
            type: BottomNavigationBarType.fixed,
            onTap: context.read<HomeCubit>().setIndex,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            unselectedItemColor:
                Theme.of(context).primaryColor.withOpacity(0.2),
            selectedItemColor: Theme.of(context).primaryColor,
            items: [
              const BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: '',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: MaterialButton(
                  padding: const EdgeInsets.all(16),
                  minWidth: 0,
                  elevation: 0,
                  color: state.index != 2
                      ? Theme.of(context).primaryColor.withOpacity(.2)
                      : Theme.of(context).primaryColor,
                  onPressed: () => cubit.setIndex(2),
                  shape: const CircleBorder(),
                  child: const FaIcon(
                    FontAwesomeIcons.pencil,
                    color: Colors.white,
                  ),
                ),
                label: '',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.list),
                label: '',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: '',
              ),
            ],
          );
        },
      ),
    );
  }
}
